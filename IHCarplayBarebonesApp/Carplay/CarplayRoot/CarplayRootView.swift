import SwiftUI

struct CarplayRootView: View {
    @Environment(\.userStore) private var userStore

    var body: some View {
        CarplayUserView(store: userStore)
    }
}
