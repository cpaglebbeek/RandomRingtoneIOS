---
date: 2026-05-29
slug: newp-bootstrap
ecosystem: RandomRingtone
platform: iOS
type: newp
status: done
resume: ""
---

# Sessie 2026-05-29 — RandomRingtoneIOS newp bootstrap

Zie ook `Meta_RandomRingtone/prompts/2026-05-29-ios-port-bootstrap.md` voor de ecosysteem-brede sessie-MD (waarom iOS, waarom apart repo).

## Wat deze sessie hier neerzet

- SwiftPM-skeleton (Package.swift, iOS 16+, macOS 13+)
- Module-dirs: `App/`, `Models/`, `Stores/`, `Services/`, `Views/`
- Initial code-stubs:
  - `Models/Track.swift` (TrackId + Track)
  - `Models/Playlist.swift` (Playlist + RingtoneSchedule)
  - `Services/RingtoneSetter.swift` (protocol + StubRingtoneSetter voor OPEN-1)
  - `App/RandomRingtoneApp.swift` (placeholder, niet @main in skeleton-fase)
- Smoke-test: `Tests/RandomRingtoneIOSTests/TrackTests.swift` (3 testen)
- Documentatie-skelet: README, CLAUDE, ARCHITECTURE, BUGLIST, RELEASES, CONFLICTS, ACTIONS, VERSION

## Wat deze sessie expliciet NIET doet

- Geen Xcode-project (geen Mac beschikbaar, valt onder fase 2)
- Geen LICENSE (OPEN-2)
- Geen ringtone-set implementatie (OPEN-1)
- Geen UI (Views-dir leeg, alleen placeholder)
- Geen externe dependencies

## Vervolg

`ACTIONS.md` § Fase 1.
