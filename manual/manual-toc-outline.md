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
| **B** | 2005 FSM *(STI or WRX — CONFIRM which you have)* | Engine mechanical, engine harness |
| **C** | 2006-07 WRX FSM | Brakes (4/2-pot calipers) |
| **D** | 2011 STI FSM | 6MT, DCCD, driveline, hubs/knuckles, R180 |
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
| Engine mechanical | B (2005) | **Confirm head casting first — see 0.6** |
| Engine harness | B (2005) | Spliced to A at the bulkhead |
| Cooling hard lines | A (2004) | 04 crossover + bypass pipes verified by mockup |
| Brakes — calipers | C (2006-07) | Rotors are KNS aftermarket, see H |
| Transmission / DCCD / driveline | D (2011) | |
| Front knuckles / hubs | D (2011) | GR knuckles |
| Rear diff (R180) / rear hubs | D (2011) | |
| Suspension | A (2004) | Verify — knuckle change may affect front |
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
- **OPEN: engine head casting.** Build notes record both "05-era EJ257" and "V25B (2007) heads." This decides whether head/valvetrain work follows the 2005 or 2007 FSM. **Resolve before printing PART 1.**

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
- 4.2 Intake manifold + throttle body *(note year ambiguity: 05 vs 06)*
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
- 6.3 Grounding map *(pull from `electrical-grounding-notes.md`)*
- 6.4 Charging system — alternator decision + spec *(see `alternator-decision-notes.md`)*
- 6.5 Battery relocation + tray *(3D Prints notes)*
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
- 9.1 Suspension *(A, verify against GR knuckle change)*
- 9.2 Steering
- 9.3 **Brakes — calipers** *(C: 2006-07 WRX 4-pot front / 2-pot rear)*
- 9.4 **Brakes — rotors** *(H: KNS4651 front, KNS4656 rear)* + `brake-notes.md`
- 9.5 Brake hydraulics, master cylinder, stainless lines
- 9.6 **[X] Planned upgrade path** — 08-14 STI Brembo swap
- 9.7 Wheels, tires, hubs — **5x114.3 conversion notes**
- 9.8 ABS *(A — confirm it still functions post-swap)*

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

1. **Which 2005 FSM do you have — STI or WRX?** Determines source B.
2. **Engine harness origin** — 2005 STI or WRX? Affects PART 6 splice reference diagrams.
3. **Head casting** — resolve the 05 vs V25B/07 ambiguity before printing PART 1 (see 0.6).
4. Do you have a **2006-07 WRX FSM** for the brake section, or work from C-equivalent aftermarket info?
5. **Single volume or garage + trackside split?**
6. Any **suspension** changes, or is it still 2004-spec besides the knuckles?
