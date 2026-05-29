// Track.swift — kerngegevensmodel
// Spiegel van Android v1.10.0 TrackId-consolidatie.

import Foundation

public struct TrackId: Hashable, Codable, Sendable {
    public let provider: Provider
    public let nativeId: String

    public enum Provider: String, Codable, Sendable {
        case spotify, deezer, youtube, local
    }

    public init(provider: Provider, nativeId: String) {
        self.provider = provider
        self.nativeId = nativeId
    }
}

public struct Track: Identifiable, Codable, Sendable {
    public let id: TrackId
    public var title: String
    public var artist: String
    public var durationMs: Int
    public var localFileURL: URL?
    public var albumArtURL: URL?
    public var embeddedArt: Data?

    public init(
        id: TrackId,
        title: String,
        artist: String,
        durationMs: Int,
        localFileURL: URL? = nil,
        albumArtURL: URL? = nil,
        embeddedArt: Data? = nil
    ) {
        self.id = id
        self.title = title
        self.artist = artist
        self.durationMs = durationMs
        self.localFileURL = localFileURL
        self.albumArtURL = albumArtURL
        self.embeddedArt = embeddedArt
    }
}
