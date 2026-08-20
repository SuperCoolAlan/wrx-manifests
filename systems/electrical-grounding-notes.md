# Electrical Grounding & Big 3 Notes — 04 WRX + EJ257 Build

**Date:** 2026-05-24
**Build:** 2004 USDM WRX wagon + 2005-era EJ257 + 06 STI intake
**Context:** High-output alternator (250A class) + 600-700W RMS audio install

## OEM Ground Points — 2004 WRX Engine Bay

Confirmed from 2004 Impreza FSM (Wiring Section G1870GE7), Turbo (WRX/STI) diagrams. FSM labels: **GE** = engine, **GB** = body.

| # | FSM | Location | OEM gauge | Big 3 action |
|---|---|---|---|---|
| 1 | **GE-1** | Battery– → engine block (big lug on driver-side bell housing/starter area, under TMIC). Main battery-to-engine cable. | ~6 AWG | **Supplement with 1/0 OFC** — parallel from batt– lug to same engine lug |
| 2 | **GB-1** | Battery– → driver-side inner fender (pigtail off main neg cable, near battery tray) | ~10-12 AWG | **Supplement with 4 AWG marine tinned** — chassis return path is lower-current than engine return, so 4 AWG is sufficient; saves cost vs 1/0 |
| 3 | **GE-2** | Braided strap from rear of driver-side cylinder head / intake-manifold stud → firewall/chassis | ~8 AWG braided | **Supplement with 4-6 AWG braided** — NOT 1/0; this is low-current sensor return |
| 4 | **GB-2** | Front body ground, passenger side near horn/headlight area | ~12-14 AWG | **Skip** — low-current accessory ground only, not Big 3 relevant |

**Transmission ground:** MT WRX has NO dedicated heavy trans-to-chassis strap. Trans grounds through bell housing bolts → engine block → GE-1. No separate Big 3 candidate.

**No OEM grounds at strut towers or pitch stop bracket.** Those are aftermarket-only additions.

## The Big 3 Wiring Plan

Three new runs, **gauged by current path**:

1. **Battery+ → Alternator B+ stud** — **1/0 marine tinned red** (~5 ft) + **250-300A ANL fuse near battery+**. Carries full alternator output.
2. **Battery– → Engine block (GE-1)** — **1/0 marine tinned black** (~12 in). Returns full alternator + cranking current. Stays 1/0.
3. **Battery– → Chassis (GB-1)** — **4 AWG marine tinned black** (~8 in). Chassis return is lower-current (lights, fans, accessories) — 4 AWG is sufficient and saves cost.

**Optional Big 3+1:** Supplement GE-2 with 4-6 AWG braided strap (engine block → chassis behind intake). Highest-return add-on for HO alternator builds — improves ECU/sensor ground cleanliness on the Link G4X (knock, MAP, O2 readings).

### Cable budget

| Build level | Cable needed |
|---|---|
| Strict Big 3 (B+ + GE-1 in 1/0; GB-1 in 4 AWG) | **6 ft red 1/0 + 1-2 ft black 1/0 + 1-2 ft black 4 AWG** |
| Big 3 + GE-2 supplement | Above + 2 ft 4 AWG (or 4-6 AWG braided) |
| Big 3 + GE-2 + audio amp grounds | **6 ft red 1/0 + 3 ft black 1/0 + 8 ft black 4 AWG** (Boss + RF amp grounds rolled in) |

### Cable type decision (2026-05-31)

**Pick: Marine-grade tinned copper battery cable (Ancor or equivalent, UL 1426 certified).**

Why marine tinned beats the alternatives for engine bay use:

| Cable | Insulation | Tinned | Engine bay verdict |
|---|---|---|---|
| **Marine tinned (Ancor)** | 105°C dry / 75°C wet (UL 1426) | ✅ | Best fit. Engineered for hot/wet/vibrating bilges = engine bay spec. ~$3-4/ft. |
| SGX automotive cable | 125°C XLPE | Optional | Highest temp rating but coarser strand, fewer colors. Also fine. |
| Welding cable | 90-105°C EPDM | ❌ Bare copper | Cheaper but bare copper terminals tarnish in 2-3 yrs from humidity/road salt |
| Audio OFC (Down4Sound, Knu, etc.) | 75-105°C PVC | Often ✅ | Pays for unmeasurable copper purity. PVC insulation softens at hottest spots. Tinning is the actual feature you want — marine has it at half the price. |
| THHN building wire | 90°C | ❌ | Wrong product. Cracks under vibration. |

Sources:
- **Ancor 1/0 tinned battery cable** — West Marine, Defender Marine, Amazon (~$3.50/ft, red/black/yellow stocked)
- **Genuine Dealz** (online) — by-the-foot marine tinned, multiple colors
- **Pacer Group** — wholesale marine cable

Avoid: random eBay "marine" cable without UL 1426 certification; any CCA (copper-clad aluminum) at any price.

### Hardware checklist — FINAL ORDER (2026-05-24)

| Item | Qty | Notes |
|---|---|---|
| 1/0 AWG marine tinned **red** (Ancor or equiv) | **6 ft** | B+ run (alt to battery+) — 5 ft + 1 ft margin |
| 1/0 AWG marine tinned **black** | **3 ft** | GE-1 supplement (engine block return, full alt current) — 1-2 ft + margin |
| 4 AWG marine tinned **black** | **8 ft** | GB-1 (1 ft) + GE-2 supplement (2 ft) + Boss R1100M amp ground (2 ft) + RF P400-4 amp ground (2 ft) + 1 ft margin |
| 250-300A ANL fuse + holder | 1 | Near battery+, mandatory safety |
| 1/0 ring terminals | 6× | Big 3 ends (3 runs × 2 ends each) |
| 4 AWG ring terminals | 6× | Amp grounds (2 ends × 2 amps) + GE-2 (2 ends) |
| Adhesive-lined 3:1 heat shrink (variety pack) | 1 | Over every crimp + 1 in cable |
| PET split braid loom 1/2" nominal | **25 ft** | For 1/0 Big 3 engine bay runs (~7 ft used, rest for future projects). PET = 125°C continuous, standard engine bay loom |
| PET split braid loom 1/4" nominal | **25 ft** | For 4 AWG GE-2 supplement + future amp ground loom (~2 ft used, rest for spares) |
| Star washers | 8× | Chassis ground points |
| Dielectric grease | 1 tube | All ground point contact surfaces |
| Crimper | 1 | **Renting hydraulic crimper** (decided 2026-05-24). Amazon mechanical 1/0 crimper user purchased is backup / for smaller gauges. |

**DIY total budget:** ~$110-170

**Decision (2026-05-24):** Going DIY route, not the JS Alternators Big 3 kit. Reasons:
- JS kit does NOT include an ANL fuse (mandatory safety component at 250A)
- DIY saves ~$10 overall vs adding a separate fuse to the kit
- DIY allows right-sized cable lengths (~8 ft) vs kit overbudget (~14 ft)
- DIY allows choice of marine-grade tinned cable (better fit for engine bay than welding cable OR audio OFC — see cable type decision above)
- DIY allows consolidating one order to also cover:
  - Audio amplifier ground cable (gauge to match existing amp power run)
  - 4-6 AWG braided strap for GE-2 supplement

## Cable Length — ESTIMATES, NOT VERIFIED

### ⚠️ Status: pending physical string mock-up

All cable lengths in the hardware checklist are **rough estimates from engine bay geometry**, NOT forum-verified measurements. Earlier versions of these notes cited specific lengths (e.g., "7.5 in for GB-1, 12 in for GE-2") attributed to the ClubWRX irvin787878 thread. Honest correction (2026-05-31):

- NASIOC thread #2098818 — confirmed contains NO length measurements (verified 2026-05-31)
- ClubWRX irvin787878 thread — Google snippet surfaced numbers ("1x 7.5 in, 2x 15.0 in, 1x 11.0 in...") but the full thread is now behind a paywall; mapping those snippet numbers to specific runs was an **inference**, not a verbatim quote
- No verified per-run cut list exists in the sources actually consulted

### Real verification step before cutting

**String mock-up.** With engine in (or alt/battery+ positions marked):

1. Tie paracord to battery+ terminal post
2. Route the paracord along the actual path each cable will take, following firewall, around hoses, secured points
3. Snip paracord at destination (alt B+ stud, engine block lug, fender stud, etc.)
4. Measure the snipped paracord
5. Add ~6 in margin per run for crimping slack + future re-routing

### Engine bay geometry — rough estimates only

These are the numbers in the hardware checklist below, but treat them as upper-bound estimates pending the mock-up:

| Run | Estimated length | Confidence |
|---|---|---|
| Batt+ → Alt B+ (1/0 red) | 5-6 ft | Rough — single longest routed run; biggest mock-up benefit |
| Batt– → GE-1 engine block (1/0 black) | 1-2 ft | Higher confidence — battery and engine lug are nearby |
| Batt– → GB-1 fender (4 AWG black) | <1 ft | Higher confidence — fender stud is right next to battery |
| Back of head → firewall GE-2 (4 AWG) | 1-2 ft | Medium — verify head stud and firewall ground location |
| Boss amp ground (4 AWG) | 1.5-2 ft | Depends on amp location → seat rail bolt distance |
| RF amp ground (4 AWG) | 1.5-2 ft | Same |

## Audio SQ Considerations

**Big 3 does NOT directly help amplifier noise floor.** Two separate concerns:

| Concern | Lives where | What helps |
|---|---|---|
| Source-side ground (alt + battery) | Engine bay | Big 3 |
| Sink-side ground (amplifier) | Amp mounting location | Amp ground at the amp, not engine bay |

### For amp SQ (independent of Big 3)

1. **Amp ground at the amp, done right:**
   - Short (under 18 in)
   - Same gauge as power cable
   - Bolted to **bare chassis metal** (scrape paint, star washer, dielectric grease)
   - Structural body bolt if amp is in trunk

**Amp ground plan for this build (2026-05-24):** Two short runs of **4 AWG** to **seat rail bolts**:
- Boss R1100M (sub amp) → nearest seat rail bolt (~18-24 in)
- Rockford Fosgate Punch P400-4 (4-ch) → nearest seat rail bolt (~18-24 in)

Seat rail bolts are excellent ground points — bolted directly into chassis sub-frame, no paint to scrape (factory bare metal contact), structural integrity.

2. **RCA cable routing:**
   - **Opposite side of car from power cable**
   - Don't bundle RCAs with power runs
   - Twisted-pair shielded RCAs preferred

3. **Common ground reference between headunit and amp:**
   - Whine often = ground potential difference
   - Optional: thick "audio common ground" wire from amp ground point up to headunit chassis ground

4. **Capacitor (1F):** Not useful for SQ — only for SPL transient peaks. **Skipped** per alternator decision.

### What Big 3 + GE-2 DOES help for the build

- **ECU/Link G4X sensor cleanliness** — knock, MAP, O2 readings reference engine ground. Cleaner ground = cleaner tune data.
- **Voltage stability at alternator output** — keeps 14.X V rail steady under load. Indirect audio benefit (amps perform best at design voltage).

### Skip for SQ

- Strut tower ground chains
- Intake manifold ground chains
- Multiple novel engine bay grounds — diminishing returns + ground-loop risk

### Modern consensus

**Strict Big 3 + supplement OEM ground points at same lugs.** Don't add many novel grounds. The "ground every strut tower" approach is older car-audio wisdom from early 2000s — still works but considered overkill outside SQ-competition builds.

## Battery Selection (2026-05-31)

**Pick:** Interstate MTX-AGM **Group 35** via Costco/Interstate dealer plug (~50% off retail). **LOCKED.**

### Why Group 35 (not 51R downsize)

Group 51R was considered for ~15 lb weight savings but **rejected** 2026-05-31:
- 15 lbs in the engine bay nose is meaningful for time-attack builds, not for a 500whp street/track WRX
- 51R retrofit requires PRL billet tie-down (~$50) — narrower battery doesn't engage OEM clamp
- 51R AGM units have shorter heat-soak life (2-3 yrs) vs Group 35 AGM (4-6 yrs)
- 51R gives up ~50% reserve capacity — meaningful audio buffer reduction for cranked peaks
- Costco plug pricing on Group 35 dominates the value math; 51R loses its only competitive angle

Physical fitment context (kept for future reference):
- Group 35: 9.06 × 6.88 × 8.88", 40-45 lbs, drops in OEM tray + clamp
- Group 51R: 9.37 × 5.06 × 8.81", 20-30 lbs, needs PRL tie-down adapter

### Why AGM (vs flooded / lithium / gel)

| Chemistry | Engine bay verdict |
|---|---|
| **AGM** | ✅ Sealed, vibration-resistant, handles 150-180°F heat, high charge acceptance for HO alternator |
| Flooded lead-acid | ❌ Vents acid, hates engine bay heat, plate stratification with HO alt |
| Lithium (LiFePO4) | ❌ Most cells derate above 140°F. Engine bay hits 160-200°F at heat-soak. Trunk-only chemistry. |
| Gel | ❌ Low charge acceptance, can't keep up with 200A alt |

### Why Interstate MTX-AGM specifically

- Plug pricing via Costco contact makes value math overwhelming
- Made by Clarios (parent of Optima/DieHard) — Interstate's AGM line has held up better than modern Optima
- Real-world reports: 4-6 yr life in performance applications with HO alternator
- Tier: upper-mid (Odyssey/Northstar are top-tier; Interstate sits comfortably below them but well above generic)

### Specs to confirm at counter

| Spec | Target |
|---|---|
| Chemistry | **AGM** (NOT MT or MTP flooded — Interstate's mainstream non-AGM line) |
| Group size | **35** (stock 04 WRX size, drops in OEM tray, no relocation) |
| CCA | ≥ 700 |
| Reserve capacity | ≥ 100 minutes |
| Warranty | 3-4 yr free replacement typical |

### Tier context (alternatives if Interstate plug falls through)

| Tier | Examples | Notes |
|---|---|---|
| **Top** (5+ yr life, race-proven) | Odyssey 35-PC1400T (~$320), Northstar | Best-in-class for high-output Subaru builds |
| **Upper-mid** (Interstate lands here) | **Interstate MTX-AGM35**, Deka Intimidator 9A35 (~$220), XS Power D925 (~$260) | Costco Duracell Platinum AGM Group 35 = rebadged Deka 9A35, often ~$180 |
| Mid | Duralast Platinum, DieHard Platinum | OK but not worth premium |
| Skip | Modern Optima YellowTop, generic CCA-only AGMs | Quality slipped post-Clarios acquisition |

## Whine Diagnostic Ladder (if needed post-install)

1. **RCA cable routing** (90% of whine fixes) — move to opposite side of car from power
2. **Amp ground quality** (8% of whine fixes) — re-do amp ground to bare metal, short run
3. **Common ground wire** between amp and headunit (2% — ground loop isolator approach)

Engine bay grounds are NOT on this ladder.

## Confidence / Source Flags

- **Confirmed:** GE-1, GE-2, GB-1, GB-2 labels from 2004 Impreza FSM PDF; XS Power BIG3XS kit BOM (14 ft) for pre-made-kit overbudget claim
- **Inferred:** OEM cable gauges (FSM doesn't publish AWG); GE-2 physical location at rear of driver head (forum-corroborated, not FSM-bolt-callout)
- **Estimated, NOT verified:** Per-run cable lengths (see "Cable Length — ESTIMATES, NOT VERIFIED" section above). Earlier notes attributed lengths to ClubWRX irvin787878 thread; that attribution was an inference from a Google snippet of a now-paywalled thread, not a verified verbatim cut list. String mock-up required before cutting.
- **Forum consensus:** Strict Big 3 + OEM supplements > many novel grounds; RCA routing as primary whine fix

## Sources

- [2004 Impreza FSM wiring volume (G1870GE7)](https://subaruport.ru/imp4/imp04_wir_1.pdf)
- [ClubWRX — DIY Big 3 and Grounding kit with pics (irvin787878)](https://www.clubwrx.net/threads/diy-big-3-and-grounding-kit-with-pics.134345282/)
- [NASIOC — Making big 3/grounding kit + upgrading alternator (thread 2098818)](https://forums.nasioc.com/forums/showthread.php?t=2098818)
- [NASIOC — Big 3 on 06 wagon with voltage gauge (unparent)](https://forums.nasioc.com/forums/showthread.php?t=...)
- [iWire Grounding Kit](https://iwireusa.com/products/grounding-kit)
- [Subaru OEM negative battery cable 02-07 (FastWRX)](https://www.fastwrx.com/products/subaru-negative-battery-cable-2002-2007-wrx-sti)

## Related Files

- Alternator decision: `alternator-decision-notes.md`
- Cooling system: `cooling-system-notes.md`
- Build memory: `/Users/alan/.claude/projects/-Users-alan-Documents-WRX/memory/project_engine_build.md`
