/// SharedCarplay/SharedUser/Services/UserBackendService+Dummy.swift

/// Dummy backend service that sources data from a static JSON payload and maps it to our models.
struct DummyUserBackendService: UserBackendService {
    /// JSON payload representing a single user coming from a backend.
    /// Keys match the DTO below. This is intentionally static for the demo.
    private(set) var dummyJSON: String = """
    {
      "name": "Aurora",
      "lastName": "Borealis",
      "dressColor": "blue",
      "preferredTirePressure": 2.4
    }
    """
}

// MARK: - - Conversion helpers

extension DummyUserBackendService {
    func initialCarplayUser() async -> CarplayUser {
        let dto = loadDummyUser()
        return CarplayUser(
            name: dto.name,
            lastName: dto.lastName,
            dressColor: mapColor(dto.dressColor),
            preferredTirePressure: dto.preferredTirePressure
        )
    }

    func initialCompanionUser() async -> CompanionAppUser {
        let dto = loadDummyUser()
        return CompanionAppUser(
            name: dto.name,
            lastName: dto.lastName,
            dressColor: mapColor(dto.dressColor)
        )
    }
}
