// TrackTests.swift — smoke test, model encodings

import XCTest
@testable import RandomRingtoneCore

final class TrackTests: XCTestCase {

    func testTrackIdRoundTrip() throws {
        let original = TrackId(provider: .spotify, nativeId: "abc123")
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(TrackId.self, from: data)
        XCTAssertEqual(decoded, original)
    }

    func testTrackInitialization() {
        let track = Track(
            id: TrackId(provider: .deezer, nativeId: "999"),
            title: "Higher Love",
            artist: "Whitney Houston",
            durationMs: 240_000
        )
        XCTAssertEqual(track.title, "Higher Love")
        XCTAssertEqual(track.id.provider, .deezer)
        XCTAssertNil(track.localFileURL)
    }

    func testStubRingtoneSetterReturnsOpen1() async throws {
        let setter = StubRingtoneSetter()
        let track = Track(
            id: TrackId(provider: .local, nativeId: "x"),
            title: "t", artist: "a", durationMs: 0
        )
        let result = try await setter.setRingtone(track: track)
        XCTAssertFalse(result.succeeded)
        XCTAssertEqual(result.methodUsed, .stub)
        XCTAssertNotNil(result.userInstructions)
    }
}
