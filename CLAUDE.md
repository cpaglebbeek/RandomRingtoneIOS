# CLAUDE.md — RandomRingtoneIOS

iOS-port van RandomRingtone. Skeleton-fase.

## Verhouding tot ecosysteem

- **Top-master:** `Meta_Master` (globale source of truth)
- **Sub-master:** `Meta_RandomRingtone` (ecosysteem-laag, gedeelde roadmap)
- **Zus-repo:** `RandomRingtone` (Android, LIVE) — `/Users/christian/Documents/Gemini_Projects/RandomRingtone`

## Sessie-startprotocol

1. `git -C /Users/christian/Documents/Gemini_Projects/Meta_Master pull`
2. `git -C /Users/christian/Documents/Gemini_Projects/Meta_RandomRingtone pull`
3. `git -C /Users/christian/Documents/Gemini_Projects/RandomRingtoneIOS pull`
4. Lees `ACTIONS.md` voor openstaand werk

## Versie-strategie

- **Semver met +0.0.1 bump bij elke bugfix** (universele iCt Horse regel)
- Codenamen: pool nog niet vastgelegd (OPEN-3 in `Meta_RandomRingtone`)
- Build-nummers: monotoon stijgend, gedeeld over branches

## Stack-regels

- Swift 5.9+, SwiftUI, iOS 16+
- Geen UIKit tenzij strikt nodig (legacy API's)
- Geen externe dependencies bij skeleton; bij fase 2 alleen via SwiftPM
- Geen Objective-C++

## Documentatie-regels

- Elke architectuurbeslissing → `ARCHITECTURE.md` of nieuw doc in `docs/`
- Elke bug → `BUGLIST.md` (genummerd, status: OPEN/FIXED)
- Elke release → `RELEASES.md` (build-nummer + codenaam + datum)
- Elk conflict / open vraag → `CONFLICTS.md` met OPEN-N id
- Elke sessie → `prompts/YYYY-MM-DD-<slug>.md`

## WhatIf-protocol

Geldt onverkort. Geen code zonder akkoord op plan.

## Veiligheid

- Geen wachtwoorden / API-keys in source — gebruik `Config.local.swift` (gitignored)
- Geen `.p12` / `.mobileprovision` committen
- Signing-credentials buiten repo (later: keychain of `local.properties`-equivalent)

## Geen Mac-fase

Tot er een Mac met Xcode beschikbaar is, blijft het skeleton **niet-buildbaar**. Code wordt logisch geschreven (review-baar) maar pas gevalideerd zodra Xcode beschikbaar is.
