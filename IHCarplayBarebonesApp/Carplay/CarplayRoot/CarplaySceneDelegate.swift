import CarPlay
import Foundation
import SwiftUI

class CarPlaySceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }

        let carPlayWindow = UIWindow(windowScene: scene)

        let carplayRootView = CarplayRootView()
            .environment(\.userStore, IHCarplayBarebonesApp.userStore)

        carPlayWindow.rootViewController = UIHostingController(rootView: carplayRootView)
        window = carPlayWindow
        carPlayWindow.makeKeyAndVisible()
    }
}
