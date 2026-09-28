import SwiftUI

@main
struct IHCarplayBarebonesApp: App {
    static let appDependencies = AppDependencies()
    static let userStore = appDependencies.userStore

    var body: some Scene {
        WindowGroup {
            CompanionAppRootView()
                .environment(\.userStore, IHCarplayBarebonesApp.userStore)
        }
    }
}
