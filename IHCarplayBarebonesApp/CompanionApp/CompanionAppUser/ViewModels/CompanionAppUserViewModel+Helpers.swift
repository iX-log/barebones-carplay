extension CompanionAppUserViewModel {
    static let defaultInitUser = CompanionAppUser(name: "Lord",
                                                  lastName: "Voldemort",
                                                  dressColor: .blue)
}

// MARK: Getters and Setters

extension CompanionAppUserViewModel {
    func setDressColor(_ color: DressColor) {
        Task { await store.updateDressColor(color) } // syncs both sides
    }

    func toggleDressColor() {
        let next: DressColor = (user.dressColor == .pink) ? .blue : .pink
        setDressColor(next)
    }
}
