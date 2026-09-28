import Foundation

/// SharedCarplay/SharedUser/Stores/UserStore+Observation.swift

// MARK: - Observation (AsyncStream publishers)

extension UserStore {
    func observeCarplay() -> AsyncStream<CarplayUser> {
        let id = UUID()
        let (stream, c) = AsyncStream<CarplayUser>.makeStream()
        carplayContinuations[id] = c
        c.yield(carplay) // sticky
        c.onTermination = { [weak self] _ in
            Task { await self?.removeCarplayContinuation(id) }
        }
        return stream
    }

    func observeCompanion() -> AsyncStream<CompanionAppUser> {
        let id = UUID()
        let (stream, c) = AsyncStream<CompanionAppUser>.makeStream()
        companionContinuations[id] = c
        c.yield(companion) // sticky
        c.onTermination = { [weak self] _ in
            Task { await self?.removeCompanionContinuation(id) }
        }
        return stream
    }
}

// MARK: - Private helpers

extension UserStore {
    func removeCarplayContinuation(_ id: UUID) {
        carplayContinuations.removeValue(forKey: id)
    }

    func removeCompanionContinuation(_ id: UUID) {
        companionContinuations.removeValue(forKey: id)
    }
}
