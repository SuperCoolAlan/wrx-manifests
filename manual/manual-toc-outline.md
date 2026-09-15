# Build Manual — Table of Contents Outline (DRAFT v0.1)

**Date started:** 2026-08-19
**Purpose:** Assembled service manual for a mixed-year build. Portions of several OEM FSMs plus aftermarket docs, printed and bound together.

> **Organizing principle: by SYSTEM, not by donor year.**
> When you're working on the car you know what system you're touching, not what year the part came from. Every section header carries a **[SOURCE]** tag naming which manual that section was printed from. The alternative (organize by donor year) makes you already know the answer before you can look it up.

---

## PART 0 — FRONT MATTER

*The most-used pages in the book. Keep them at the front, ideally laminated.*

### 0.1 Build Identity Card
One page, front-and-center:
- VIN / chassis: **2004 USDM WRX wagon, GG chassis**
- Engine: **custom-built 2005-era EJ257, single AVCS**
- Transmission: **2011 6MT w/ DCCD**
- ECU: **Link (standalone)** — not OEM
- Bolt pattern: **5x114.3, all four corners**
- Wheel/tire sizes, alignment spec, corner weights (if known)

### 0.2 Source Manual Legend ★
Define every source document + assign each a **color code and a letter prefix** for page numbering. Suggested:

| Code | Source | Covers |
|---|---|---|
| **A** | 2004 WRX FSM (GG wagon) | Body, interior, chassis, HVAC, base electrical |
| **B** | 2005 STi FSM | Engine mechanical (sole source), engine harness, suspension cross-ref |
| **C** | 2007 FSM | Brakes (06-07 WRX 4/2-pot calipers), ABS, front/rear susp (STi knuckle side), cluster, wheel/tire |
| **D** | 2011 STI FSM | 6MT, DCCD, R180 — **verification only.** The 2007 modular PDFs are the readable working proxy; the 2011 monolith has no bookmarks |
| **E** | Link ECU docs | Engine management *(already printed)* |
| **F** | iWire DCCD docs | DCCD controller |
| **G** | Link CAN Lambda docs | Wideband |
| **H** | Aftermarket component docs | IAG, APS, Perrin, KNS, DW, Aeromotive, etc. |
| **X** | **Custom / Alan-authored** | Splices, deviations, as-built notes |

### 0.3 System → Source Year Matrix ★★
**The single most valuable page in the book.** One table: every system, which manual governs it, any exception.

| System | Governing source | Notes / exceptions |
|---|---|---|
| Body, glass, interior, HVAC | A (2004) | Wagon-specific — sedan pages will mislead |
| Chassis wiring / body harness | A (2004) | See PART 6 for splice deviations |
| Engine mechanical | B (2005) | Short block **and heads** — single AVCS. Sole mechanical source; the 2007 ME(H4DOTC) was removed 2026-09-02 |
| Engine harness | B (2005) | Spliced to A at the bulkhead |
| Cooling hard lines | A (2004) | 04 crossover + bypass pipes verified by mockup |
| Brakes — calipers | C (2007) | 06-07 WRX 4/2-pot. Rotors are KNS aftermarket, see H |
| Parking brake | A (2004) | Original 2004 cables, verified holding on the KNS discs |
| ABS | A (2004) | Module is the original 2004 unit. Only the front sensors are STi-era |
| Transmission / DCCD / driveline | 2007 modular (proxy) | Unit **is** a 2011 6MT — verify torques/fluid against D |
| Front knuckles / hubs | C (2007) + B (2005) | **05-07 STi knuckles — GD-era, NOT GR.** 28313FE060 |
| Rear diff (R180) | 2007 modular (proxy) | Came with the 2011 6MT — ratios match |
| Rear hubs / knuckles | C (2007) + B (2005) | **05-07 STi both sides** |
| Suspension | **A + B + C — all three** | 2004 = wagon subframe/links/sway bars + wagon torque values. 2007/2005 = STi knuckle, hub, bearing. You straddle both branches |
| Engine management | E (Link) | **OEM ECU sections are void — do not print** |
| Fuel system | H + X | Almost fully aftermarket |
| Oiling | H + X | IAG pan + AOS |

### 0.4 Fluids & Capacities — MERGED ★
**Do not print any single year's fluid page.** They conflict. Build one custom table:
- Engine oil — spec + capacity (IAG pan changes capacity vs stock — **measure and record**)
- Coolant — capacity changed by FMIC routing + ECFT
- **Transmission — 2011 6MT spec, NOT 2004 5MT.** Different fluid, different capacity.
- **DCCD / center diff** — per D
- Rear diff — R180 per D
- Brake fluid — track spec (RBF600/660 or SRF), not OEM DOT3
- Power steering, clutch

### 0.5 Torque Spec Quick Reference — MERGED
Same problem: parts that look identical across years have different torque values. Pull per-system from the governing manual and consolidate. Flag any value where you had to choose between sources.

### 0.6 Known Deviations from OEM ★
> **Now backed by `parts-register.md`** — the register's "Supersedes" column IS this page. Every aftermarket part marks an FSM section that is wrong. Print the register here rather than maintaining two lists.

The "this car is not stock" page. Anything where following the FSM literally would be wrong.
- No OEM ECU — all ECU/immobilizer/OBD sections void
- FPCM bypassed (see `fuel-pump-isolator-notes.md`) — expect P0230/P1230 on OEM ECU
- OEM PCV deleted, replaced by IAG AOS
- TGV deletes installed
- FMIC, not TMIC — hood scoop repurposed
- Brake rotors are KNS gravel-spec, not OEM
- **RESOLVED 2026-08-20: head casting is V25B** (Cosworth V25B STi one side, OEM head ported to match the other), corroborated by the casting mark in `cooling-system-notes.md`. Single AVCS, intake only.
  - ✅ **SETTLED 2026-09-02: head and valvetrain work follows the 2005 `ME(STi)` section, and it is now the only mechanical source.** The casting is 2007-era but the engine is **single AVCS**, which is what the 2005 STi section documents and what the engine was built to. Configuration governs, not casting date.
  - The 2007 `ME(H4DOTC)` section was **removed (−102 pp)** after its cross-check justification was checked against the PDFs and did not hold: the specs cited as exclusive to it are in the 2005 section too, and as the combined WRX/STi book its default torque is the EJ255 figure with the STi value footnoted (`T2: 72 Except-STI / 75 STI`) where the 2005 section simply gives 75. **Do not use a 2008+ manual — dual AVCS.**

### 0.7 How to Use This Manual
Color code key, page numbering scheme, what to do when two sources disagree (rule: the governing source in 0.3 wins; if still ambiguous, note it in PART 10).

---

## PART 1 — ENGINE, MECHANICAL  *[SOURCE: B]*
- 1.1 Engine identification, casting marks, AVCS configuration
- 1.2 Short block — specs, clearances, torque sequences
- 1.3 Cylinder heads, valvetrain, **valve lash procedure + shim chart**
- 1.4 Timing system — belt, tensioner, AVCS
- 1.5 Crank pulley / Fluidampr
- 1.6 Removal & installation
- 1.7 **[X] As-built spec sheet** — your own build numbers, clearances, what's sealed

## PART 2 — LUBRICATION  *[SOURCE: B + H + X]*
- 2.1 Oil pump, pickup, galleries *(B)*
- 2.2 **IAG oil pan** — install, capacity, baffling *(H)*
- 2.3 **IAG AOS** — routing, service, catch interval *(H)*
- 2.4 Oil cooler / thermostat, if fitted
- 2.5 **[X] PCV delete map** — what's capped and why

## PART 3 — COOLING  *[SOURCE: A + H + X]*
- 3.1 Coolant flow diagram *(pull from `cooling-system-notes.md`)*
- 3.2 Hard lines — crossover, bypass, upper pipe assembly, w/ part numbers
- 3.3 Radiator, fans, ECFT
- 3.4 Thermostat, water pump
- 3.5 Bleeding procedure — **custom, FMIC + ECFT changes the high point**

## PART 4 — INDUCTION, TURBO, EXHAUST  *[SOURCE: H + X]*
- 4.1 Intake tract, TGV delete
- 4.2 Intake manifold + throttle body — **STI manifold, exact year unconfirmed (05 vs 06).** Bounded question: it does **not** affect cooling (the circuit is common across these years) and the crossover/bypass pipes are already verified fitted. Matters only if ordering manifold-specific gaskets or TGV/PCV parts.
- 4.3 **FP Red turbo** — specs, oil/coolant feed, service
- 4.4 EWG uppipe + TiAL MVS wastegate
- 4.5 Perrin EL header — **collector inspection interval**
- 4.6 Downpipe, exhaust
- 4.7 **APS DR725 FMIC** — piping map, coupler/clamp inventory *(H)*
- 4.8 Boost control strategy *(cross-ref E)*

## PART 5 — FUEL SYSTEM  *[SOURCE: H + X]*
- 5.1 System diagram — tank → pump → filter → flex sensor → rails → FPR → return
- 5.2 DW pump + **FPCM bypass wiring** *(X — critical, non-OEM)*
- 5.3 Aeromotive rails, FPR, adapters
- 5.4 Red Horse 235 hose — routing, clamps, heat shielding
- 5.5 Flex fuel sensor — install, calibration, bench-test results
- 5.6 Injectors
- 5.7 **E85 handling, storage, and service cautions**

## PART 6 — ELECTRICAL & WIRING ★★  *[SOURCE: A + B + X]*
> **The hardest and most valuable part of this book.** OEM diagrams alone will actively mislead you here, because the whole point is that two harnesses were spliced. Budget the most custom drawing time for this section.
- 6.1 **[X] Splice map — 2004 GG body harness ↔ 2005 engine harness.** Every splice: location, wire colors both sides, pin numbers, method. Photograph each one.
- 6.2 **[X] Bulkhead / firewall pass-through inventory**
- 6.3 **Grounding map + Big 3 charge wiring** *(pull from `systems/electrical-grounding-notes.md` — revised 2026-09-02)*. Print the **topology diagram** with it: https://claude.ai/code/artifact/48d2bb6d-593b-402a-b8e7-9dbb591cb25f
  - ⚠ Two corrections landed 2026-09-02 that invalidate any earlier printout: **GE-1/GB-1 are harness ground eyelets, not the battery cables**, and the **chassis run is 1/0, not 4 AWG**. Reprint 6.3 if an older copy is in the binder.
  - Include the **ABYC ampacity table** (105 °C, inside engine spaces) — it is the reasoning behind every gauge in this build, and it is not in the FSM.
  - Note that the FSM **does not draw the heavy battery cables at all**; the GE/GB scheme is harness only. Landing points are identified on the car.
- 6.4 Charging system — Singer 200A spec + **fuse sizing rationale** *(see `systems/alternator-decision-notes.md` + the fusing section of the grounding notes)*
  - Key point worth its own paragraph: **a fuse protects the cable, not the source** — 225A on 1/0, 125A on the 4 AWG audio feed.
  - **WI-17 (binder 7-19 / 7-217):** the OEM alternator B+ is 2× 8 AWG to the **main fuse box**, downstream of SBF-1 (80A turbo). Do not delete it.
- 6.5 Battery relocation + tray *(3D Prints notes)* — include the **bridge bus bar** fabrication spec; the fuse-holder platform geometry lives in `battery-tray-mtx35.scad`
- 6.6 Body electrical, lighting, gauges *(A — 2004 wagon)*
- 6.7 **[X] Deleted / abandoned circuits** — what's cut, capped, or dead-ended and why *(FPCM, immobilizer, OEM ECU pins)*
- 6.8 Fuse and relay map — **annotated for changes**

## PART 7 — ENGINE MANAGEMENT  *[SOURCE: E + G]*
*Link docs already printed — insert here as a tabbed block.*
- 7.1 Link ECU — install, pinout, base config
- 7.2 **Link CAN Lambda** — wiring, CAN setup, sensor service life
- 7.3 Sensor inventory + calibrations *(4-bar MAP: 11.97 psia/V, +0.506 offset; flex sensor; etc.)*
- 7.4 **[X] Tune revision log** — date, tuner, what changed, datalog filename
- 7.5 Break-in protocol *(from `break-in-protocol.md`)*

## PART 8 — DRIVETRAIN  *[SOURCE: D + F]*
- 8.1 **2011 6MT** — identification, service, fluid *(D)*
- 8.2 Clutch, flywheel, hydraulics
- 8.3 **DCCD — OEM function** *(D)*
- 8.4 **iWire DCCD controller** — wiring, modes, operation *(F)*
- 8.5 Front diff, center diff
- 8.6 **R180 rear diff** + mounting *(D)*
- 8.7 Axles, driveshaft — **note any mixed-year or custom-length parts**
- 8.8 **[X] Swap-specific notes** — crossmember, mounts, shifter linkage, anything fabricated

## PART 9 — CHASSIS  *[SOURCE: A + C + D + H]*
- 9.1 Suspension — **three years, each doing a different job.** *(A: wagon subframe, link mounting, wagon/Except-STi torque values — 30 N·m on links, not 45. C+B: 05-07 STi knuckle, hub, bearing procedures.)* BC coilovers supersede all OEM strut/spring pages.
- 9.2 Steering
- 9.3 **Brakes — calipers** *(C: 2006-07 WRX 4-pot front / 2-pot rear)*
- 9.4 **Brakes — rotors** *(H: KNS4651 front, KNS4656 rear)* + `brake-notes.md`
- 9.5 Brake hydraulics, master cylinder, stainless lines
- 9.6 **[X] Upgrade path — DROPPED 2026-09-02.** Scope is now pads, fluid and front ducts on the 4/2-pot setup. *(If revisited: the bolt-on caliper is the **04-07 GD-era STI Brembo**, NOT 08-14 GR — knuckles are 05-07 STi. It also forces a wheel purchase; see `brake-notes.md`.)*
- 9.7 Wheels, tires, hubs — **5x114.3 conversion notes.** Wheels identified 2026-09-02: **17x8 ET55, 15-21 WRX (VA) base wheel**, 10.5 kg, OEM tire size 235/45-17. *(Wheel & Tire prints from C because the car is 5x114.3; the 2004 pages are 5x100 and do not apply. Note that C describes STi-era wheels, not these.)*
- 9.8 ABS *(A — 2004)* — ✅ **SETTLED 2026-09-02.** Module, hydraulic unit and diagnostics are the original 2004 chassis parts. Only the front wheel-speed sensors are 05-07 STi knuckle parts, both adapted to mate the 04 harness; the 2007 section is printed as a sensor-side cross-check only. Confirm ABS still functions post-swap.

## PART 10 — BODY & INTERIOR  *[SOURCE: A]*
- Wagon-specific. Print sparingly — this is the bulkiest FSM section and the least likely to be needed.
- 10.1 Doors, glass, latches
- 10.2 Interior trim, seats, sill/panel removal *(useful — you route wiring through here)*
- 10.3 HVAC
- 10.4 Cargo area *(battery + FPCM live here)*

## PART 11 — MAINTENANCE & INSPECTION  *[SOURCE: X, merged]*
> No OEM schedule applies to this car. Write your own.
- 11.1 **Track-event checklist** — pre-event, between sessions, post-event
- 11.2 Consumable intervals — oil, brake fluid, pads, AOS drain, coolant
- 11.3 **Wear-item watch list** — header collector, turbo shaft play, rotor thickness, pad taper
- 11.4 Annual / off-season teardown items
- 11.5 **[X] Service log** — blank pages, bound in

## PART 12 — DIAGNOSTICS  *[SOURCE: E + X]*
- 12.1 Link fault codes + datalog interpretation *(OEM DTC tables are largely void)*
- 12.2 **[X] Known-quirks list** — expected non-faults for this build
- 12.3 Troubleshooting trees for the custom systems (fuel, splices, DCCD)

## APPENDICES
- **A1** Master parts list w/ part numbers *(from build spreadsheet)*
- **A2** Vendor + source contacts
- **A3** Torque spec master table
- **A4** Wiring diagram foldouts
- **A5** Photo log — as-built reference shots
- **A6** Blank note pages

---

## PRODUCTION NOTES

**Don't glue it.** A 3-ring binder with tabbed dividers is the better call for this specific book:
- You will revise PART 6 and PART 7 repeatedly as the tune and wiring evolve
- Sections get pulled out and taken to the car, then put back
- Glued/perfect-bound pages won't lie flat on a fender

If you want something more permanent later, bind it once the build is actually finished.

**Other suggestions:**
- **Color-code by source** using colored paper or a header stripe. When two pages disagree, you instantly see which manual each came from.
- **Prefix page numbers by source letter** (A-142, D-17) so a loose page can always be refiled.
- Print **PART 0 and PART 6 double-sided on heavier stock** — highest-touch pages.
- Consider a **second slim "trackside" volume**: 0.1-0.6, PART 11, PART 12. The full book stays in the garage.
- Keep the source PDFs organized in a folder mirroring this TOC so reprints are trivial.

---

## OPEN QUESTIONS

1. ~~Which 2005 FSM — STI or WRX?~~ ✅ **STi.** The binder prints `ME(STi)`, `LU(STi)`, `FU(STi)` etc. from the 2005 STi Engine folder. `GD(STi)` is not printed (OEM DTC criteria, void on the Link).
2. ~~Engine harness origin~~ ✅ **2005 STi**, merged onto the 2004 GG body harness by iWire (`wiring-register.md`).
3. ~~Head casting~~ ✅ **V25B, resolved 2026-08-20.** But **which FSM governs head work is still open** — see 0.6.
4. ~~2006-07 WRX FSM for brakes?~~ ✅ **2007 FSM**, already in the source archive and printed as TAB 5.
5. **Single volume or garage + trackside split?** — still open.
6. ~~Suspension changes?~~ ✅ **Not 2004-spec.** BC coilovers (BR→DS, 05-07 STI/GDF application, built-in camber plates) + STi knuckles all four corners on retained wagon links and wagon sway bars.
7. ~~ABS source year~~ ✅ **2004, settled 2026-09-02.** See 9.8.
8. **OPEN (low priority) — intake manifold year.** The contradiction inside `cooling-system-notes.md` is resolved: the manifold year has **no cooling consequence** (Alan, 2026-09-02 — cooling circuit is common across these years), so that file no longer claims a year. The manifold's actual year is still unconfirmed and is now purely an induction question. See 4.2.
