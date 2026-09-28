/// SharedCarplay/SharedUser/Services/UserBackendService.swift

import Foundation

// MARK: - Backend service abstraction

/// A tiny service that supplies user models to the store. In production this could call your network layer.
protocol UserBackendService: Sendable {
    /// Returns the initial CarPlay user model (async for future network-backed implementations).
    func initialCarplayUser() async -> CarplayUser
    /// Returns the initial Companion app user model (async for future network-backed implementations).
    func initialCompanionUser() async -> CompanionAppUser
}
