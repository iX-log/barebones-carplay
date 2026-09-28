import Foundation

@MainActor
final class CarplayUserViewModel: ObservableObject {
    @Published var user: CarplayUser
    let store: UserStore
    private var task: Task<Void, Never>?

    /// Creates the view model with an optional initial user and subscribes to store updates.
    /// NOTE: For tutorial brevity we fall back to a trivial placeholder if `initial` is nil.
    /// In production, prefer making `user` optional or awaiting the first value from the store.
    init(store: UserStore, initial: CarplayUser? = nil) {
        self.store = store

        // Placeholder fallback for compact sample; see note above.
        user = initial ?? CarplayUserViewModel.defaultInitUser

        task = Task {
            let stream = await store.observeCarplay()
            for await newUser in stream {
                self.user = newUser
            }
        }
    }

    deinit { task?.cancel() }
}
