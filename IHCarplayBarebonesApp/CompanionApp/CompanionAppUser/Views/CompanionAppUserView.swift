import SwiftUI

struct CompanionAppUserView: View {
    @StateObject private var vm: CompanionAppUserViewModel

    init(store: UserStore) {
        _vm = StateObject(wrappedValue: CompanionAppUserViewModel(store: store))
    }

    var body: some View {
        companionAppUserInformationView
            .glassBackdrop("sleeping-beauty-spinning-wheel-background")
    }
}

extension CompanionAppUserView {
    private var companionAppUserInformationView: some View {
        VStack(spacing: 4) {
            UserFullNameTitle(name: vm.user.name, lastName: vm.user.lastName)
            WardrobeImage(imageName: vm.user.dressColor.assetName)
            DressColorSegmentedPicker(selection: vm.dressColorBinding)
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension CompanionAppUserViewModel {
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
