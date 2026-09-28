import Foundation

/// SharedCarplay/SharedUser/Services/UserBackendService+Decoding.swift

/// Data Transfer Object used only for decoding backend JSON.
struct BackendUserDTO: Codable, Sendable {
    let name: String
    let lastName: String
    let dressColor: String
    let preferredTirePressure: Double?
}

// MARK: - Helpers

extension DummyUserBackendService {
    /// Decodes the static JSON into a DTO. Falls back to a safe default if decoding fails.
    func loadDummyUser() -> BackendUserDTO {
        let data = Data(dummyJSON.utf8)
        do {
            return try JSONDecoder().decode(BackendUserDTO.self, from: data)
        } catch {
            // Fallback to a sensible default in case of decoding errors
            return BackendUserDTO(name: "Rapunzel", lastName: "Letdownyourhair", dressColor: "pink", preferredTirePressure: 2.0)
        }
    }

    /// Maps a string color from the backend into our `DressColor` domain type.
    /// Extend this as you add more colors.
    func mapColor(_ s: String) -> DressColor {
        switch s.lowercased() {
        case "pink": return .pink
        case "blue": fallthrough
        default: return .blue
        }
    }
}
