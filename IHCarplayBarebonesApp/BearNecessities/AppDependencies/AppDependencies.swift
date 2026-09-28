import SwiftUI

@MainActor
final class AppDependencies {
    let userStore = UserStore()

    /// If we want to add more dependencies in the future
    // let vehicleStore = VehicleStore()
    // let playbackStore = PlaybackStore()
}

private struct UserStoreKey: EnvironmentKey {
    static let defaultValue: UserStore = IHCarplayBarebonesApp.userStore
}

extension EnvironmentValues {
    var userStore: UserStore {
        get { self[UserStoreKey.self] }
        set { self[UserStoreKey.self] = newValue }
    }
}
