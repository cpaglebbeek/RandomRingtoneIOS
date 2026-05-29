// Playlist.swift — playlist-aggregatie

import Foundation

public struct Playlist: Identifiable, Codable, Sendable {
    public let id: UUID
    public var name: String
    public var source: Source
    public var tracks: [Track]
    public var schedule: RingtoneSchedule?

    public enum Source: String, Codable, Sendable {
        case spotify, deezer, youtube, local
    }

    public init(
        id: UUID = UUID(),
        name: String,
        source: Source,
        tracks: [Track] = [],
        schedule: RingtoneSchedule? = nil
    ) {
        self.id = id
        self.name = name
        self.source = source
        self.tracks = tracks
        self.schedule = schedule
    }
}

public struct RingtoneSchedule: Codable, Sendable {
    public var mode: Mode
    public var intervalSec: Int?
    public var perContactBindings: [String: TrackId]  // ContactID → TrackId

    public enum Mode: String, Codable, Sendable {
        case random
        case sequential
        case perContact
    }

    public init(mode: Mode, intervalSec: Int? = nil, perContactBindings: [String: TrackId] = [:]) {
        self.mode = mode
        self.intervalSec = intervalSec
        self.perContactBindings = perContactBindings
    }
}
