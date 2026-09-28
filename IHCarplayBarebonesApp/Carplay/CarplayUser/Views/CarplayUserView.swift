import SwiftUI

struct CarplayUserView: View {
    @StateObject private var vm: CarplayUserViewModel

    init(store: UserStore) {
        _vm = StateObject(wrappedValue: CarplayUserViewModel(store: store))
    }

    var body: some View {
        carplayUserInformationView
            .glassBackdrop("sleeping-beauty-background")
    }
}

extension CarplayUserView {
    private var carplayUserInformationView: some View {
        VStack(spacing: 4) {
            UserFullNameTitle(name: vm.user.name, lastName: vm.user.lastName)
            WardrobeImage(imageName: vm.user.dressColor.assetName)
            DressColorSegmentedPicker(selection: vm.dressColorBinding)
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension CarplayUserViewModel {
    /// Binding adapter that exposes the model’s `dressColor` as a `Binding<DressColor>`
    /// suitable for SwiftUI controls (e.g., `Picker`, `Toggle` via a Bool mapping).
    /// Writes are forwarded to `setDressColor(_:)` so both Companion and CarPlay stay in sync.
    var dressColorBinding: Binding<DressColor> {
        Binding(
            get: { self.user.dressColor },
            set: { self.setDressColor($0) }
        )
    }
}
