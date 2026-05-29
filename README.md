# RandomRingtoneIOS

iOS-versie van **RandomRingtone** — een app die je beltoon automatisch wisselt op basis van streaming-playlists (Spotify, Deezer, YouTube).

> **Status: SKELETON v0.0.1** — alleen documentatie + SwiftPM-layout, nog geen werkende code.

## Ecosysteem

Onderdeel van [`Meta_RandomRingtone`](https://github.com/cpaglebbeek/Meta_RandomRingtone). Zus-platform:
- [`RandomRingtone`](https://github.com/cpaglebbeek/RandomRingtone) — Android (Kotlin/Compose, LIVE v1.11.0)

## Stack

- **Taal:** Swift 5.9+
- **UI:** SwiftUI
- **Min iOS:** 16.0
- **Package manager:** SwiftPM (skeleton-fase) → Xcode-project bij fase 2

## Belangrijkste architecturele open vraag

iOS heeft **geen publieke API** om de systeem-beltoon te wijzigen. Er is aangenomen dat er een werkbare weg is — methode TBD. Zie [`CONFLICTS.md`](./CONFLICTS.md) **OPEN-1**.

## Project-fasen

| Fase | Beschrijving | Status |
|---|---|---|
| 0 | Skeleton: repo + docs + SwiftPM-layout | ✅ 2026-05-29 |
| 1 | Architectuur-onderzoek: target-mapping + OPEN-1 onderzoek | volgend |
| 2 | Minimum viable downloader (Spotify/Deezer) | open |
| 3 | Ringtone-set integratie (afhankelijk van OPEN-1 uitkomst) | open |
| 4 | Polish + distributie (TestFlight / AltStore) | open |

## Documentatie

- [`ARCHITECTURE.md`](./ARCHITECTURE.md) — target-mapping vs Android + 4-lagen-model
- [`BUGLIST.md`](./BUGLIST.md) — bug-tracking
- [`RELEASES.md`](./RELEASES.md) — release-historie + codenamen
- [`CONFLICTS.md`](./CONFLICTS.md) — architecturele afwegingen + open vragen
- [`ACTIONS.md`](./ACTIONS.md) — openstaande acties

## License

Nog geen LICENSE. Volgt ecosysteem-beslissing (zie `Meta_RandomRingtone/ROADMAP.md` OPEN-2).
