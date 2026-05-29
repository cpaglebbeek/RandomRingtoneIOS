// RingtoneSetter.swift — protocol voor ringtone-set
// Implementatie hangt af van OPEN-1 (zie CONFLICTS.md).
// Verschillende routes (GarageBand-export, Shortcuts, alarm-pivot, etc.) krijgen
// elk een aparte conformante struct zodra fase 1 een keuze maakt.

import Foundation

public protocol RingtoneSetter {
    /// Stel een track in als de "actieve" beltoon volgens de gekozen iOS-strategie.
    /// - Returns: succes-status + uitleg voor de user (welke handmatige stappen nodig zijn).
    func setRingtone(track: Track) async throws -> RingtoneSetResult
}

public struct RingtoneSetResult: Sendable {
    public let succeeded: Bool
    public let userInstructions: String?  // nil = volledig automatisch
    public let methodUsed: Method

    public enum Method: String, Sendable {
        case garageBandExport
        case shortcuts
        case alarmPivot
        case notificationSound
        case tonesDirectory
        case m4rShare
        case stub  // skeleton-fase
    }
}

/// Skeleton-implementatie: doet niets, geeft alleen aan dat OPEN-1 nog open is.
public struct StubRingtoneSetter: RingtoneSetter {
    public init() {}

    public func setRingtone(track: Track) async throws -> RingtoneSetResult {
        return RingtoneSetResult(
            succeeded: false,
            userInstructions: "OPEN-1: ringtone-set methode nog niet gekozen. Zie CONFLICTS.md.",
            methodUsed: .stub
        )
    }
}
