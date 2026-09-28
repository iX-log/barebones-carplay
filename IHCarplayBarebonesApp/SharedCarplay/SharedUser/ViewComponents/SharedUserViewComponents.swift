import SwiftUI

// MARK: - Reusable UI pieces

/// Applies a full‑bleed background image with a thin‑material overlay (glass effect).
/// Use this as a light, readable backdrop behind foreground content.
/// - Parameters:
///   - imageName: Asset name of the background image to fill the screen.
///   - opacity: Opacity of the material overlay (0 = none, 1 = fully opaque). Defaults to 0.85.
/// - Returns: The original view with the glass backdrop applied.
extension View {
    func glassBackdrop(_ imageName: String, opacity: Double = 0.85) -> some View {
        background {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .overlay(.thinMaterial.opacity(opacity))
                .ignoresSafeArea()
        }
    }
}

/// Asset name for the dress image that corresponds to this color.
/// Centralizes the enum→asset mapping in one place.
extension DressColor {
    var assetName: String {
        switch self {
        case .pink: return "pink-dress"
        case .blue: return "blue-dress"
        }
    }
}

/// Scalable full‑name title used across Companion/CarPlay.
/// Marks itself as a header for accessibility.
struct UserFullNameTitle: View {
    let name: String
    let lastName: String

    var body: some View {
        Text("\(name) \(lastName)")
            .font(.title2)
            .fontWeight(.bold)
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .accessibilityAddTraits(.isHeader)
    }
}

/// Displays a wardrobe image by asset name.
/// The image maintains aspect ratio via `.scaledToFit()`.
struct WardrobeImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

/// Segmented control for choosing a `DressColor`.
/// Provide a binding to your source of truth; changes are written back.
struct DressColorSegmentedPicker: View {
    @Binding var selection: DressColor

    var body: some View {
        Picker("Dress Color", selection: $selection) {
            Text("Blue").tag(DressColor.blue)
            Text("Pink").tag(DressColor.pink)
        }
        .pickerStyle(.segmented)
    }
}
