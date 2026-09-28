import Foundation

@MainActor
final class CompanionAppUserViewModel: ObservableObject {
    @Published var user: CompanionAppUser
    let store: UserStore
    private var task: Task<Void, Never>?

    /// Creates the view model with an optional initial user and subscribes to store updates.

    /// NOTE: For tutorial brevity we fall back to a trivial placeholder if `initial` is nil.
    /// In production, prefer making `user` optional or awaiting the first value from the store.
    init(store: UserStore, initial: CompanionAppUser? = nil) {
        self.store = store

        user = initial ?? CompanionAppUserViewModel.defaultInitUser

        task = Task {
            let stream = await store.observeCompanion()
            for await newUser in stream {
                self.user = newUser
            }
        }
    }

    deinit { task?.cancel() }
}
