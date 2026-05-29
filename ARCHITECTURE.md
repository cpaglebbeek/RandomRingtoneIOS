# ARCHITECTURE — RandomRingtoneIOS

> Skeleton-fase. Dit document is een **target-mapping** vs de werkende Android-app, niet een implementatie-beschrijving. Wordt verfijnd in fase 1.

## 1. Doel

iOS-app die — net als de Android-versie — automatisch de beltoon wisselt op basis van een playlist (Spotify / Deezer / YouTube). Logisch gegevensmodel en UX-flow blijven herkenbaar; technische realisatie gebruikt iOS-native API's.

## 2. Lagen (vergelijking)

| Laag | Android (Kotlin/Compose) | iOS (Swift/SwiftUI) — voorstel |
|---|---|---|
| UI | Jetpack Compose | SwiftUI |
| State | ViewModel (AAC) + StateFlow | `@Observable` / `@State` / `@Environment` |
| Storage local | Room (DB v7) + filesDir | SwiftData (iOS 17+) of Core Data; FileManager |
| Network | OkHttp + Retrofit | URLSession + Codable |
| Playlist providers | WebView (Spotify OAuth), Y2Mate (YouTube), Deezer publieke API | WKWebView, dezelfde Y2Mate-proxy, Deezer onveranderd |
| Background work | WorkManager | BGTaskScheduler |
| Ringtone-set | `RingtoneManager.setActualDefaultRingtoneUri()` | **TBD — geen public API (OPEN-1)** |
| File access | Storage Access Framework | Files-app / iCloud / FileManager |

## 3. Module-indeling (voorlopig)

```
Sources/RandomRingtoneIOS/
├── App/          # @main entry, root view, dependency-injection root
├── Models/       # Track, Playlist, RingtoneConfig (Codable)
├── Stores/       # SwiftData/Core Data stores per entiteit
├── Services/     # SpotifyClient, DeezerClient, Y2MateClient, RingtoneSetter
└── Views/        # SwiftUI Views per scherm
```

Tests: `Tests/RandomRingtoneIOSTests/`.

## 4. Gegevens-model (logisch)

Identiek aan Android v1.10.0 TrackId-consolidatie:

```
Playlist {
  id: UUID
  name: String
  source: enum { spotify, deezer, youtube, local }
  tracks: [Track]
  schedule: RingtoneSchedule?  // optional
}

Track {
  id: TrackId            // gedeeld id-format met Android (provider-prefix + native-id)
  title: String
  artist: String
  durationMs: Int
  localFileURL: URL?
  albumArtURL: URL?
  embeddedArt: Data?     // bij MP3-download via ID3v2 APIC
}

RingtoneSchedule {
  mode: enum { random, sequential, perContact }
  intervalSec: Int?
  perContactBindings: [ContactID: TrackId]
}
```

## 5. Provider-vergelijking

| Provider | Android-implementatie | iOS-aanpak | Risico |
|---|---|---|---|
| Spotify | WebView-OAuth, scrape playlist-pagina | WKWebView idem; eventueel later officiële iOS SDK | Apple kan WebView-scraping in review afwijzen |
| Deezer | publieke REST API, geen auth | `URLSession` + `Codable` | Laag |
| YouTube via Y2Mate | YTConverter + Y2Mate v2 protocol | Zelfde Y2Mate-protocol, native HTTP | Y2Mate-protocol-wijziging (3e dit jaar — zie Android #59 #72 R12) |

## 6. Ringtone-set (OPEN-1)

iOS heeft historisch geen public ringtone-API. Bekende routes (te onderzoeken):

| Route | Idee | Risico |
|---|---|---|
| A. GarageBand-export | User exporteert MP3 → GarageBand → "Share as Ringtone" | Handmatige stappen, niet automatisch |
| B. Shortcuts-integratie | App publiceert "Set Ringtone"-shortcut → Shortcuts app heeft mogelijk private hook? | Onbekend of dat bestaat |
| C. Alarm-pivot | App is geen ringtone-app maar wekker; gebruikt eigen audio-engine | Verandert product |
| D. Focus / Notification-sound | Eigen notification sounds per app/contact instellen via Communication Notifications | Beperkt scope |
| E. Tones-app | Tones in `~/Library/Tones/` plaatsen via gesigneerde provisioning | Vereist enterprise / jailbreak |
| F. .m4r-file delen | App genereert .m4r, user importeert via iTunes-sync of macOS | Macnodig, jaren geen iTunes meer op moderne workflows |

**Beslissing:** wordt in fase 1 onderzocht. Tot dan: skeleton aanhouden, geen aanname vastleggen.

## 7. Build- en distributie-overwegingen

- **Skeleton-fase:** geen build. Alleen SwiftPM-layout + Package.swift.
- **Fase 2+:** vereist Mac met Xcode (huidig: niet aanwezig). XcodeGen-generated project of handmatig .xcodeproj.
- **Signing:** persoonlijk Apple Developer account ($99/jaar) of free provisioning (7-dagen-installs).
- **Distributie:** TestFlight (officieel, review) of AltStore/sideload (geen review).

## 8. Verschillen die NIET later op te lossen zijn

- Background-ringtone-rotatie zonder user-tap is op iOS niet betrouwbaar (BGTaskScheduler is opportunistisch). Android `AlarmManager` is exacter.
- Geen `BroadcastReceiver`-equivalent → push-driven updates moeilijker.
- Sandboxing strikter → geen toegang tot system-tones-directory zonder enterprise.

## 9. Open architectuur-vragen (samenvatting)

| ID | Vraag | Plaats |
|---|---|---|
| OPEN-1 | Ringtone-set methode | dit doc § 6 + CONFLICTS.md |
| OPEN-2 | Licentie | Meta_RandomRingtone ROADMAP |
| OPEN-3 | Codenaam-pool iOS | Meta_RandomRingtone STATUS |
| OPEN-4 | Distributie-kanaal | dit doc § 7 + Meta_RandomRingtone STATUS |
| OPEN-5 | SwiftData vs Core Data | dit doc § 2 |
| OPEN-6 | Background-rotatie strategie | dit doc § 8 |
