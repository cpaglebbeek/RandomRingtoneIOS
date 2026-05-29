# CONFLICTS — RandomRingtoneIOS

Open architecturele afwegingen + onopgeloste design-keuzes.

## OPEN-1 — iOS ringtone-set methode

- **Gemeld:** 2026-05-29 (sessie newp ios-port-bootstrap)
- **Status:** OPEN — onderzoek in fase 1
- **Probleem:** iOS heeft geen publieke API om de systeem-beltoon te wijzigen. Kernfeature van RandomRingtone is precies dat.
- **Aanname gebruiker:** "ga uit van een manier dat het wel kan, al weet ik nog niet hoe" — we bouwen het skeleton vóórdat de methode bekend is.
- **Routes overwogen (zie ARCHITECTURE.md § 6):**
  - A. GarageBand-export (handmatig)
  - B. Shortcuts-integratie
  - C. Pivot naar alarm-app
  - D. Notification-sounds per contact
  - E. Tones-app (enterprise/jailbreak)
  - F. .m4r-bestand delen
- **Beslissing-deadline:** vóór start fase 2 (code)

## OPEN-2 — Licentie

- **Gemeld:** 2026-05-29
- **Status:** OPEN — ecosysteem-breed (zie `Meta_RandomRingtone/ROADMAP.md`)
- **Probleem:** Android-repo heeft geen LICENSE. iOS volgt dezelfde keuze. Andere iCt Horse projecten gebruiken AGPL-3.0.
- **Beslissing-deadline:** vóór eerste public release.

## OPEN-3 — Codenaam-pool iOS

- **Status:** OPEN — ecosysteem-breed (zie `Meta_RandomRingtone/STATUS.md`)
- Keuze tussen: delen met Android (Whitney Houston tracks) of eigen pool (bv. iconische albums / Apple-historie).

## OPEN-4 — Distributie-kanaal

- **Status:** OPEN — TestFlight (officieel, review-risico) vs AltStore/sideload (sneller, beperkter publiek)
- Hangt samen met OPEN-1: bij review-vriendelijke pivot (alarm-app) wordt TestFlight haalbaar.

## OPEN-5 — Persistence framework

- **Status:** OPEN — SwiftData (iOS 17+) vs Core Data
- SwiftData is moderner maar verhoogt min-iOS van 16 → 17.
- Beslissing nemen wanneer eerste persistente entiteit geschreven wordt.

## OPEN-6 — Background-rotatie strategie

- **Status:** OPEN — BGTaskScheduler is opportunistisch, niet exact. Android `AlarmManager` is precies.
- Mogelijk: silent push triggert app om ringtone-rotatie te triggeren? Of user-bound (alleen rotatie bij app-open)?
