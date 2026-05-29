# Sources/RandomRingtoneIOS

Skeleton-source. Module-indeling:

- `App/` — entry-point + root view (placeholder)
- `Models/` — `Track`, `Playlist`, `RingtoneSchedule`, `TrackId`
- `Stores/` — persistence (leeg tot OPEN-5 beslissing)
- `Services/` — `RingtoneSetter` protocol + stub; later: `SpotifyClient`, `DeezerClient`, `Y2MateClient`
- `Views/` — SwiftUI views (leeg)

> Skeleton bouwt niet als app: `Package.swift` definieert alleen een library-target. Pas in fase 2 wordt een Xcode app-target toegevoegd.
