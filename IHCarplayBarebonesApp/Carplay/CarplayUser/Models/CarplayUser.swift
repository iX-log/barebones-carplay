struct CarplayUser: Codable, Equatable, Sendable {
    var name: String
    var lastName: String
    var dressColor: DressColor

    /// Preferred tire pressure (bar)
    var preferredTirePressure: Double?
}
