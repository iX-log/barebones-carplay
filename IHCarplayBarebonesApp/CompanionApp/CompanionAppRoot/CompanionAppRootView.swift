import SwiftUI

struct CompanionAppRootView: View {
    @Environment(\.userStore) private var userStore

    var body: some View {
        CompanionAppUserView(store: userStore)
    }
}
