# PRINT INDEX — Build Manual Binder

**Updated:** 2026-09-02  ·  Tick boxes as you print.

> **Supersedes `print-manifest.md`**, which has been retired. Its unique content — the 2011 section map — is folded in at the bottom of this file.

Source archive: Dropbox `WRX.zip` → `2004 / 2005 / 2007 Service Manual` (modular) + `2011 Service Manual` (monolith).

**Config this manual documents:** 2004 GG wagon · **V25B STi Cosworth heads** on a 2005-era EJ257 single-AVCS (Alan-built) · FP Red · E85 · Link G4X · **Singer 200A alternator** · 2011 6MT + DCCD · **05-07 STi knuckles all four corners** · wagon lateral links + wagon sway bars · BC coilovers · 06-07 WRX 4/2-pot calipers + KNS rotors · 5x114.3 · catless downpipe + XForce 3in cat-back

Full component detail: [`../as-built/parts-register.md`](../as-built/parts-register.md) (202 parts)

---

## TAB 1 — FRONT MATTER

*Most-used pages. Print on heavy stock.*

> ⚠ **Both marked rows are superseded and are reference-only.**
> **Fluids** are all decided and none match the OEM table — Motul break-in 10W-40 → 300V 5W-40, Motul Gear 300 75W-90, ATE Typ 200, Asian-formula coolant. See the merged table in TAB 9.
> **Periodic maintenance** is being rewritten for track use; the OEM interval table does not apply to a 500whp E85 track car. Consider printing PM thin or skipping it — it is 42 pages.

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 5 | Identification (VIN/chassis) | 2004 | `ID Identification.pdf` |
| ☐ | 7 | Notes & symbols | 2004 | `NT Note.pdf` |
| ☐ | 1 | Precautions | 2004 | `PC Precaution.pdf` |
| ☐ | 7 | Specs — WRX baseline | 2004 | `SPC Specs.pdf` |
| ☐ | 16 | Specs — STi figures | 2005 | `SPC Specs.pdf` |
| ☐ | 7 | Recommended Materials (fluids) ⚠ | 2004 | `RM Recommended Mat.pdf` |
| ☐ | 42 | Periodic Maintenance ⚠ | 2004 | `PM Periodic Maint.pdf` |
| | **85** | | | *subtotal* |

## TAB 2 — ENGINE (2005 STi = EJ257, single AVCS)

> ✅ **SETTLED 2026-09-02 — the 2005 `ME(STi)` section is the only mechanical source.**
> Heads are **V25B STi Cosworth** and the casting is 2007-era, but the engine is **single AVCS** — which is what the 2005 STi section documents, and what the engine was assembled to. Configuration governs, not casting date.
>
> ⚠ **The 2007 `ME(H4DOTC)` section was REMOVED 2026-09-02 (−102 pp). Do not re-add it.** Its stated justification did not survive checking against the actual PDFs: con rod 52 N·m and 44 N·m are present in the 2005 section too, and A/C hoses appear in neither. Worse, it is the **combined WRX/STi book**, so its default torque is the EJ255 WRX figure with the STi value as a footnoted exception — the crankshaft/flywheel spec reads `T2: 72 (Except for STI)` / `75 (STI model)`, where **the 2005 STi section simply gives 75**. Its T-code numbering also differs (24.5 N·m is `T4` in 2005, `T5` in 2007), so a T-number cannot be carried between the two books.
> ⚠ **Do NOT reach for a 2008+ manual** — dual AVCS arrived on the 2008 STi and does not describe this engine.

*Use the 2005 **(STi)** sections throughout this tab — the 2005 **(H4DOTC)** files are the WRX EJ255 and do not describe this engine.*

*Engine is **single AVCS** — intake only, one solenoid per head, which is what the 2005 STi section documents. **Dual AVCS arrived on the 2008 STi — do not use a 2008+ manual here.***

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 93 | Mechanical — whole engine, short block + heads ★★ | 2005 STi | `ME(STi) 04 Mechanical.pdf` |
| ☐ | 22 | Lubrication | 2005 STi | `LU(STi) 07 Lubrication.pdf` |
| ☐ | 17 | Intake | 2005 STi | `IN(STi) 03 Intake.pdf` |
| ☐ | 7 | Ignition | 2005 STi | `IG(STi) 09 Ignition.pdf` |
| ☐ | 64 | Fuel Injection (reference) | 2005 STi | `FU(STi) Fuel Injection.pdf` |
| ☐ | 20 | Emission Control | 2005 STi | `EC(STi) 02 Emission Control.pdf` |
| | **223** | | | *subtotal* |

## TAB 3 — COOLING / EXHAUST  ⚠ STi versions are 1-page stubs

*The STi files here just say 'refer to H4DOTC'. Print the H4DOTC versions.*

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 34 | Cooling ★ | 2005 H4DOTC | `CO(H4DOTC) Cooling.pdf` |
| ☐ | 14 | Exhaust ★ | 2005 H4DOTC | `EX(H4DOTC) Exhaust.pdf` |
| ☐ | **22** | **Starting / Charging** | **2005 H4SO** | `SC(H4SO) Starting-Charging.pdf` |
| | **70** | | | *subtotal* |

> The cooling circuit is **common across 04-07**, so this section applies regardless of the intake manifold's year. Hard lines are the reused 04 WRX parts (crossover `14050AA451`, bypass `14065AA250`), both physically verified. Superseded by aftermarket only at the radiator (Mishimoto), pump/thermostat (RCM + 70 °C) and the FMIC-changed bleed high point.
>
> ⚠ **`SC(H4DOTC)` is ALSO a stub — do not print it.** It is 2 pages saying *"Specifications for Turbo model are included in SC(H4SO) section."* The cross-reference chain is SC(STi) → SC(H4DOTC) → **SC(H4SO)**. Only the H4SO file has content.
>
> ⚠ **Charging content is partly superseded** — the alternator is a **Singer 200A/220A peak with a 14.8V regulator**, not the 90A OEM unit. Use these pages for wiring topology and starter procedures, not for output specs.
>
> ⚠ **`EX` is now largely reference-only.** The exhaust is entirely aftermarket end to end: Perrin EL header → PLM 38mm EWG uppipe → FP Red → **catless** downpipe → XForce 3in cat-back. Print it thin.

## TAB 4 — DRIVETRAIN (6MT + DCCD)

*2007 modular PDFs are the readable proxy; verify specs against the 2011 monolith.*

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 126 | 6MT Trans & Diff ★★ | 2007 | `6MT Manual Trans & Diff.pdf` |
| ☐ | 50 | Control Systems — DCCD ★ | 2007 | `CS Control Systems.pdf` |
| ☐ | 38 | Clutch — 6MT side ★ | 2007 | `CL Clutch System.pdf` |
| ☐ | 34 | Clutch — 2004 actuation specs ★ | 2004 | `CL Clutch System.pdf` |
| ☐ | 58 | Differentials (R180) | 2007 | `DI Differentials.pdf` |
| ☐ | 46 | Drive Shaft / axles | 2007 | `DS Drive Shaft.pdf` |
| | **318** | | | *subtotal* |

## TAB 5 — BRAKES

*Calipers are 06-07 WRX, so the 2007 manual governs. Rotors are KNS aftermarket.*

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 58 | Brakes ★★ | 2007 | `BR Brake.pdf` |
| ☐ | 10 | **Parking Brake — THE ONE TO USE** (cables are 2004) | **2004** | `PB Parking Brake.pdf` |
| ☐ | 10 | Parking Brake — cross-check, STi-era rear discs | 2007 | `PB Parking Brake.pdf` |
| ☐ | 24 | **ABS — THE ONE TO USE** (module is the 2004 unit) ★ | **2004** | `ABS.pdf` |
| ☐ | 22 | ABS — cross-check, STi-era wheel speed sensors | 2007 | `ABS.pdf` |
| | **124** | | | *subtotal* |

> ✅ **SETTLED 2026-09-02 — the 2004 ABS section governs.** The module, hydraulic unit and diagnostics are the original 2004 chassis parts. Only the front wheel-speed sensors are 05-07 STi knuckle parts, and both were adapted to mate the 04 harness (one full aftermarket sensor on the 01-06 Impreza pattern, one OEM knuckle sensor with a transplanted connector — `parts.csv:202-203`). 2007 is a sensor-side cross-check only.

## TAB 6 — SUSPENSION  ⚠ MIXED: STi knuckles + wagon links

*Print BOTH the STi and Except-STi branches — you straddle them.*

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 26 | Front Susp — STi knuckle/hub ★★ | 2007 | `FS Front Suspension.pdf` |
| ☐ | 28 | Front Susp — cross-ref | 2005 | `FS Front Suspension.pdf` |
| ☐ | **28** | **Front Susp — WAGON chassis side** | **2004 GG** | `FS Front Suspension.pdf` |
| ☐ | 18 | Rear Susp — STi knuckle/hub ★★ | 2007 | `RS Rear Suspension.pdf` |
| ☐ | 20 | Rear Susp — cross-ref | 2005 | `RS Rear Suspension.pdf` |
| ☐ | **20** | **Rear Susp — WAGON chassis side** | **2004 GG** | `RS Rear Suspension.pdf` |
| ☐ | 60 | Power Steering (rack is the original 2004 unit) | 2004 | `PS Power Assisted System (Power Steering).pdf` |
| ☐ | 10 | Wheel & Tire (5x114.3) | 2007 | `WT Wheel & Tire .pdf` |
| | **210** | | | *subtotal* |

> **Three years, each doing a different job:** 2004 = wagon subframe, link mounting, wagon/Except-STi torques (links are 30 N·m, not 45). 2007/2005 = STi knuckle, hub and bearing procedures.

## TAB 7 — ELECTRICAL / WIRING

*Merge is done. These are for future troubleshooting, not install.*

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 198 | Body harness — 2004 GG | 2004 | `WI Wiring Sys.pdf` |
| ☐ | 220 | Engine harness — 2005 STi | 2005 | `WI Wiring Sys.pdf` |
| ☐ | 20 | Instrument cluster (07 STi) | 2007 | `IDI Instrument-Driver Info.pdf` |
| ☐ | 30 | Lighting | 2004 | `LI Lighting Sys.pdf` |
| | **468** | | | *subtotal* |

## TAB 8 — BODY / INTERIOR (wagon)

*Print sparingly. Trim removal is the genuinely useful part.*

| ✓ | Pages | Section | Source | File |
|:-:|--:|---|---|---|
| ☐ | 60 | Exterior / Interior Trim | 2004 | `EI Ext Int Trim.pdf` |
| ☐ | 22 | Body Structure | 2004 | `BS Body Structure.pdf` |
| ☐ | 34 | Glass / Windows / Mirrors | 2004 | `GW Glass-Win-Mir.pdf` |
| | **116** | | | *subtotal* |

---

## TAB 9 — CUSTOM (write these yourself; no FSM page covers them)

| ✓ | Document | Where it lives now |
|:-:|---|---|
| ☐ | **★ Aftermarket parts register** (128 parts) | ✅ **written** — [`../as-built/parts-register.md`](../as-built/parts-register.md). Doubles as the deviations map. |
| ☐ | **As-built engine spec** — bearing clearances, machining | ✅ **written** — [`../as-built/as-built-engine-specs.md`](../as-built/as-built-engine-specs.md) |
| ☐ | Hardware & small-parts reference (seals, bushings, connectors) | ✅ **written** — [`../as-built/hardware-reference.md`](../as-built/hardware-reference.md) |
| ☐ | **Commissioning checklist** (pre-first-start → shakedown) | ✅ **written** — [`../procedures/commissioning-checklist.md`](../procedures/commissioning-checklist.md) |
| ☐ | Sequenced build task list | ✅ **written** — [`../procedures/build-todo.md`](../procedures/build-todo.md) |
| ☐ | Break-in protocol (IAG 4-fill) | ✅ **written** — [`../procedures/break-in-protocol.md`](../procedures/break-in-protocol.md) |
| ☐ | **Big 3 charge wiring + grounding map** | ✅ **written** — [`../systems/electrical-grounding-notes.md`](../systems/electrical-grounding-notes.md) (revised 2026-09-02). Print with the topology diagram: https://claude.ai/code/artifact/48d2bb6d-593b-402a-b8e7-9dbb591cb25f |
| ☐ | Brake plan + KNS rotor PNs | ✅ **written** — [`../systems/brake-notes.md`](../systems/brake-notes.md) |
| ☐ | Suspension: BC spec, bushing re-torque, alignment targets | ✅ **written** — [`../systems/suspension-notes.md`](../systems/suspension-notes.md) |
| ☐ | Drivetrain: clutch actuation, fork question, ratios | ✅ **written** — [`../systems/drivetrain-notes.md`](../systems/drivetrain-notes.md) |
| ☐ | Cooling flow diagram + hard line PNs | ✅ **written** — [`../systems/cooling-system-notes.md`](../systems/cooling-system-notes.md) |
| ☐ | Build identity card | ✅ **generated** — `build-readfirst.py` → `TAB0a_READ-FIRST.pdf` |
| ☐ | **System → Source Year matrix** | ✅ **generated** — `build-toc.py` → `TAB0_CONTENTS.pdf` |
| ☐ | **Merged fluids & capacities table** | ✅ **generated** — `build-fluids.py` → `TAB0b_FLUIDS.pdf` |
| ☐ | **Merged torque spec table** | ⏳ **to write** — collect from each governing section |
| ☐ | Harness splice map | 🔶 **partly done** — `build-aswired.py` → `TAB7a_AS-WIRED.pdf` from `wiring.csv` (29 deviations). Still to add: the photoset `Sandoval_Harness Merge Pictures.zip` (20 shots) and the handwritten Link pin notes |
| ☐ | Link ECU docs | already printed — insert here |
| ☐ | DCCDPro controller / iWire VSS Pro docs | request from iWire if not on hand |
| ☐ | Track-event checklist + service log | ⏳ blank pages, bound in |

> **15 of 19 already exist** in the repo, and TAB 0 / 0a / 0b / 7a are generated PDFs. The binder's custom section is a printing job now, not a writing job.

## Printing — colour / mono split

**Print the colour set and the mono set separately.** Only the generated pages use colour; the FSM pages are black line art apart from the amber source-year stamp in the footer, which greyscales to a legible dark grey. `build-colorsplit.py` writes both files and `print-plan.json`:

| Set | File | Pages | Sheets |
|---|---|--:|--:|
| **Colour** | `print/WRX-BINDER-COLOR.pdf` | 22 | **11** |
| Mono | `print/WRX-BINDER-MONO.pdf` | 1656 | 828 |

**Collating is trivial — no interleaving.** Every colour page is either front matter or a tab cover, so each one drops in front of its tab:

| Colour sheet(s) | Goes in front of |
|---|---|
| `TAB0a` READ-FIRST (3 pp), `TAB0` CONTENTS (6 pp), `TAB0b` FLUIDS (1 p), `TAB7a` AS-WIRED (3 pp) | the whole binder, in that order |
| 1 cover each | TABs 1, 2, 3, 4, 5, 6, 8 |
| **2** covers | TAB 7 (it carries the most traps) |

> Since the colour set is only 11 sheets, this is the cheap place to also use **heavy stock** — it is exactly the TAB 0 / cover material already flagged as highest-touch.

## Page Budget

**FSM sections above: 1665 pages** single-sided ≈ **833 sheets** duplexed, per the built `manual/print/manifest.json`. The assembled `WRX-BINDER.pdf` is **1678 pages** including tab covers and the generated front matter.

*2026-09-15:* **−270** `GD(STi)` General Description — OEM ECU DTC criteria, void on the Link (1935 → 1665).

*Changes on 2026-09-02, measured from `manifest.json` rather than hand-counted:*

| Δ | Section | Why |
|--:|---|---|
| **+48** | 2004 GG `FS` + `RS` | wagon chassis side — build script printed them, this index had omitted them |
| **+10** | 2004 `PB Parking Brake` | cables are the 2004 originals |
| **+24** | 2004 `ABS` | module is the 2004 chassis unit |
| **−102** | 2007 `ME(H4DOTC)` | justification did not survive checking — see TAB 2 |
| **−20** | | *net: 1955 → 1935* |

> ⚠ **Do not edit the page budget by hand** — the figure above is read from the built `manifest.json`. The long-standing "1904" in earlier revisions never reconciled with what the build script actually produced.

### Deliberately NOT printed

| Pages | Section | Why |
|--:|---|---|
| 270 | General Description (STi) | OEM ECU DTC detecting criteria — void, you run Link |
| 364 | Engine Diagnostics (STi) | OBD-II DTC trees — void, you run Link |
| 342 | Engine Diagnostics (H4DOTC) | same |
| 80 | ABS Diagnostics | print only if ABS faults appear |
| 72 | 6MT Diagnostics | print if needed |
| 20 | Airbag / SRS | track car |
| 74 | Airbag Diagnostics | track car |
| 46 | HVAC | bulky, rarely needed |
| 10 | Cruise Control | no OEM ECU |
| 22 | Immobilizer | deleted with OEM ECU |
| 20 | Seats |  |
| 10 | Sunroof |  |
| 12 | Entertainment |  |
| **1342** | | *saved* |

Skipping these saves **1342 pages** — roughly 45% of what a full print would be.

---

## 2011 Manual — section map (folded in from the retired `print-manifest.md`)

The 2011 PDF is **3,350 pages with no bookmarks**. A text scan of page codes produced **958 transitions**, meaning sections are heavily interleaved — so treat this as a hint, **not** as print ranges. Verify any range visually before printing.

| Code | First page | Section |
|---|--:|---|
| CL | 93 | Clutch |
| BR | 99 | Brake |
| PB | 103 | Parking Brake |
| FS | 104 | Front Suspension |
| DS | 106 | Drive Shaft |
| DI | 233 | Differentials |
| **CS** | **1531** | **Control Systems (DCCD)** |
| WI | 1768 | Wiring |
| TC | 1991 | Transfer Case |

**Recommendation stands:** use the **2007 modular PDFs** as the readable working documents for 6MT and DCCD — they are clean, standalone, and the same DCCD 6MT family. Dip into the 2011 monolith only to verify specific torque values and fluid specs.
