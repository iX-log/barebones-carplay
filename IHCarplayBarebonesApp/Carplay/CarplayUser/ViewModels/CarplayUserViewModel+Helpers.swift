/// CarplayUser/ViewModels/CarplayUserViewModel+Helpers.swift
extension CarplayUserViewModel {
    static let defaultInitUser = CarplayUser(name: "Tom Marvolo",
                                             lastName: "Riddle",
                                             dressColor: .blue,
                                             preferredTirePressure: nil)
}

// MARK: Getters and Setters

extension CarplayUserViewModel {
    func setDressColor(_ color: DressColor) {
        Task { await store.updateDressColor(color) } // syncs both sides
    }

    func toggleDressColor() {
        let next: DressColor = (user.dressColor == .pink) ? .blue : .pink
        setDressColor(next)
    }
}
