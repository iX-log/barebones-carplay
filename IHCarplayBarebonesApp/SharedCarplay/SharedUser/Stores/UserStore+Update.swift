// MARK: - Updates (mutations & broadcast)

/// SharedCarplay/SharedUser/Stores/UserStore+Update.swift

// MARK: - Backend hydration

extension UserStore {
    /// Refresh both models from the backend service and broadcast updates to all subscribers.
    func refreshFromBackend() async {
        let newCarplay = await service.initialCarplayUser()
        let newCompanion = await service.initialCompanionUser()
        carplay = newCarplay
        companion = newCompanion
        for (_, c) in carplayContinuations {
            c.yield(newCarplay)
        }
        for (_, c) in companionContinuations {
            c.yield(newCompanion)
        }
    }
}

extension UserStore {
    /// Cross-update shared field: keep colors in sync.
    func updateDressColor(_ color: DressColor) {
        carplay.dressColor = color
        companion.dressColor = color
        for (_, c) in carplayContinuations {
            c.yield(carplay)
        }
        for (_, c) in companionContinuations {
            c.yield(companion)
        }
    }
}

// TODO: Check if we need them
// extension UserStore {
// func updateCarplay(_ new: CarplayUser) {
//    carplay = new
//    for (_, c) in carplayContinuations {
//        c.yield(new)
//    }
// }
//
// func updateCompanion(_ new: CompanionAppUser) {
//    companion = new
//    for (_, c) in companionContinuations {
//        c.yield(new)
//    }
// }
// }
