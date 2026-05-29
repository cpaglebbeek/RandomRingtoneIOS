# Openstaande Acties — RandomRingtoneIOS

> Laatst bijgewerkt: 2026-05-29 — newp-bootstrap skeleton compleet

## Fase 1 — Architectuur-onderzoek + vastlegging-gates (volgend)

### Onderzoek
- [ ] **OPEN-1 onderzoek**: research-doc per route (A t/m F) in `docs/ringtone-set-research.md`; conclusie + voorkeur (29-5)
- [ ] **OPEN-5 onderzoek**: SwiftData vs Core Data afweging in `docs/persistence-choice.md` (29-5)
- [ ] **OPEN-6 onderzoek**: background-strategie in `docs/background-rotation.md` (29-5)

### Vastlegging-gates (afdwingbaar vóór fase 2)
Uit sanitycheck 29-5 — gaten op logisch-functioneel en conceptueel-technisch niveau:
- [ ] **`docs/PRINCIPLES.md`** aanmaken — ontwerp- en architectuur-principes voor iOS-port; relatie tot Android-zus en ecosysteem (29-5)
- [ ] **`docs/DEPENDENCIES.md`** aanmaken — per module welke shared assets/services/data; oorzaak-gevolg matrix (29-5)
- [ ] **`docs/USER_JOURNEYS.md`** aanmaken — Android-flows als referentie overnemen + iOS-verschillen markeren (29-5)

### Afronding
- [ ] **ARCHITECTURE.md verfijnen** na onderzoeks-uitkomsten + § 10 uitgestelde-docs updaten (29-5)
- [ ] **Sanitycheck herhalen** na fase 1 docs — doel: 90%+ conform (29-5)

## Fase 2 — Code (open)

- [ ] **Mac met Xcode regelen** (huidig: niet aanwezig) — buildbaarheid voorwaarde
- [ ] **Xcode-project genereren** (XcodeGen of handmatig) wanneer Mac beschikbaar
- [ ] **Codenaam-pool kiezen** (OPEN-3) vóór eerste echte release
- [ ] **v0.1.0**: Spotify-playlist downloaden + lokale library tonen
- [ ] **v0.2.0**: Deezer-integratie
- [ ] **v0.3.0**: YouTube via Y2Mate

## Ecosysteem (parallel, in `Meta_RandomRingtone`)

- [ ] **OPEN-2** licentiekeuze (AGPL-3.0 voorstel) — beide platforms gelijk
- [ ] **OPEN-4** distributiekeuze (hangt af van OPEN-1 uitkomst)
- [ ] **D1-portal**: iOS-tabblad toevoegen op icthorse.nl/D1/RandomRingtone/ wanneer iOS substantieel is

## Skeleton-completion check (newp fase N+1)

- [ ] `/sanitycheck` draaien op RandomRingtoneIOS + Meta_RandomRingtone (29-5, in deze sessie)
