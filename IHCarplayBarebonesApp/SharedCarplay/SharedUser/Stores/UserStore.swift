import Foundation

/// SharedCarplay/SharedUser/Stores/UserStore.swift

actor UserStore {
    // MARK: State

    // Current state (one “logged-in” user, shaped for each surface)
    // Populated from the backend service in init()
    var carplay: CarplayUser
    var companion: CompanionAppUser

    // Backend service (dummy in this target)
    let service: UserBackendService

    // MARK: Streams

    // Multi-subscriber continuations
    var carplayContinuations: [UUID: AsyncStream<CarplayUser>.Continuation] = [:]
    var companionContinuations: [UUID: AsyncStream<CompanionAppUser>.Continuation] = [:]

    // MARK: Init

    /// Initialize the store and hydrate initial state from the backend service.
    /// Uses placeholders first, then asynchronously refreshes so init remains non-blocking.
    init(service: UserBackendService = DummyUserBackendService()) {
        self.service = service

        // Placeholders; real values will arrive via async refresh.
        carplay = CarplayUser(name: "Tom Marvolo",
                              lastName: "Riddle",
                              dressColor: .blue,
                              preferredTirePressure: nil)

        companion = CompanionAppUser(name: "Lord",
                                     lastName: "Voldemort",
                                     dressColor: .blue)

        // Kick off hydration without blocking init
        Task { await self.refreshFromBackend() }
    }
}
