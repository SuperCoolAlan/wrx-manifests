# Aftermarket Parts Register

**Updated:** 2026-08-20
**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · 2011 6MT/DCCD · 05-07 STi knuckles all corners · 5x114.3 · 500whp target, mostly track

> **This is the deviations map, not just an inventory.** Every row marks a place the OEM manual is now wrong. The **Supersedes** column is the point — it links each part to the FSM section it invalidates, so the binder and the car stay reconciled.

**Confidence key:** ✅ confirmed · ⚠️ recorded but unverified · ❓ needs confirmation

---

## 1 · Engine — Lower Internals · Binder TAB 2

| Part | Brand / Model | PN | Supersedes | Notes | ✓ |
|---|---|---|---|---|:-:|
| Crankshaft | Subaru OEM **nitride-treated STi** | 12200AA430 | OEM WRX crank | Flatirons Tuning | ✅ |
| Pistons | **Manley** 612000C-4 | 612000C-4 | OEM pistons | EJ257, 99.75mm std stroke, std bore, **8.5:1 dish** | ✅ |
| Rods | **Manley H-Tuff** | 15024-4 | OEM rods | | ✅ |
| Rod bearings | **King STD** | — | OEM | | ✅ |
| Main bearings | **King STDX** | — | OEM | Note: STD rods + STDX mains | ✅ |
| Oil pump | **11mm** | 15010AA360 | 10mm OEM | Higher volume | ✅ |
| Harmonic damper | **Fluidampr** | 531101 | OEM crank pulley | Chosen over Perrin lightweight — see §7 | ⚠️ |

⚠ **Machine shop note:** *"Cylinder wall boring didn't match the pistons — just did them all to the same size."* **Record actual measured bore + clearances here.**

## 2 · Engine — Heads & Valvetrain · TAB 2

| Part | Brand / Model | PN | Supersedes | Notes | ✓ |
|---|---|---|---|---|:-:|
| Valve springs + retainers | **Manley**, titanium retainers | 22180-16 | OEM springs | | ✅ |
| Valves | **Cosworth** | ❓ | OEM valves | PN not recorded | ❓ |
| Cams | OEM | — | — | Stage 2 considered, not fitted | ⚠️ |
| Head casting | ❓ **05-era vs V25B (2007)** | — | — | **Build notes record both — resolve. Decides which FSM head/valvetrain section governs.** | ❓ |

## 3 · Oiling · TAB 2

| Part | Brand / Model | Supersedes | FSM impact | ✓ |
|---|---|---|---|:-:|
| Oil pan | **IAG** | OEM pan | **Changes oil capacity** — measure and record | ✅ |
| Air-oil separator | **IAG AOS** | **Entire OEM PCV system** | `LU` PCV content void. All OEM PCV hoses removed. Cap PCV portions of 21141AA131. | ✅ |
| Oil pressure sender | Remote, firewall-mounted | OEM switch location | Installed 2026-08-20. Torque 25 N·m, THREE BOND 1324 | ✅ |

## 4 · Turbo · Induction · Exhaust · TAB 3

| Part | Brand / Model | Supersedes | Notes | ✓ |
|---|---|---|---|:-:|
| Turbocharger | **FP Red** | OEM VF-series | Journal vs BB bearing ❓ — affects oil restrictor sizing | ✅ |
| Header | **Perrin EL** (equal length) | OEM manifold | 304 SS, welded merge, 4-2-1, 14% larger primaries. $300 used. **Annual collector inspection; 2-4 track seasons expected** | ✅ |
| Uppipe | **PLM 38mm EWG** | OEM uppipe | 2-bolt header flange matches Perrin collector | ✅ |
| Wastegate | **TiAL MVS 38mm** | OEM internal WG | Spring pressure ❓ — record when fitted | ✅ |
| Intercooler | **APS D/R 725 FMIC** | OEM TMIC | Core 28"×9.5"×4.5" bar-and-plate. **TMIC deleted → hood scoop free** | ✅ |
| BOV | ❓ **undecided** | OEM BPV | Kit shipped w/ Turbosmart Race Port (VTA) — presence unconfirmed. See Linear CPU-36 | ❓ |
| TGV | **Deleted** | OEM TGVs | `IN` TGV content void | ✅ |
| Intake | **AEM fender intake** | OEM airbox | | ⚠️ |
| Turbo inlet | Oversized, w/ recirc bung | OEM inlet | | ✅ |

## 5 · Fuel System · TAB 4

| Part | Brand / Model | Supersedes | Notes | ✓ |
|---|---|---|---|:-:|
| Fuel pump | **DeatschWerks** | OEM pump | **FPCM bypassed** — see `fuel-pump-isolator-notes.md` | ✅ |
| Fuel rails | **Aeromotive** | OEM rails | Need 2× ORB-to-AN adapters | ✅ |
| FPR | **Aeromotive 15633** | OEM FPR | + Aeromotive gauge | ✅ |
| Fuel lines | **Red Horse 235**, -6AN, 15 ft | OEM hard/soft lines | ECO+FKM E85-safe liner, SS under-braid + nylon jacket | ✅ |
| Flex fuel sensor | — | n/a (new capability) | Bench-tested. Mounts on new FPR bracket | ✅ |
| Injectors | ❓ | OEM injectors | **Installed — brand/size not recorded** | ❓ |
| FPR / flex bracket | **Custom, fabricated** | Washer bottle location | Washer system deleted | ⏳ |

## 6 · Engine Management · Electrical · TAB 7

| Part | Brand / Model | Supersedes | FSM impact | ✓ |
|---|---|---|---|:-:|
| ECU | **Link** standalone | OEM ECU (04 STi 22611AJ242) | **All OEM ECU / OBD-II / immobilizer sections VOID** | ✅ |
| Wideband | **Link CAN Lambda** | OEM front O2 | Post-turbo bung | ✅ |
| MAP sensor | **Omni MAP-STI-4BR** 4-bar | OEM 2.5-bar Denso | Cal: **11.97 psia/V, +0.506 offset** | ✅ |
| Harness | **2005 STi**, merged to 04 GG body | — | **`WI` diagrams do not describe this car.** iWire merge, $2,134.97 | ✅ |
| DCCD controller | **iWire DCCD Spiider** | OEM DCCD control | | ✅ |
| VSS | **iWire VSS Pro** | — | Speedo correction for 6MT | ✅ |
| Gauge cluster | **07 STi** | 04 WRX cluster | **Print `IDI` from 2007 manual, not 2004** | ✅ |
| Gauges | **Prosport** boost / fuel press / oil press / volt | — | | ⚠️ |
| AFR gauge | **Innovate MTX-L** | — | Separate from CAN Lambda | ⚠️ |
| Battery | **Relocated to rear cargo**, 3D-printed tray | Stock location | Cavity 236×182mm | ✅ |

## 7 · Drivetrain · TAB 4

| Part | Brand / Model | Supersedes | Notes | ✓ |
|---|---|---|---|:-:|
| Transmission | **2011 STi 6MT w/ DCCD** | 04 WRX 5MT | $3,400 bundle, 97k mi at install. **Fluid = 2011 spec** | ✅ |
| Rear diff | **R180** (came with trans) | R160 | **Ratios match — same donor set** | ✅ |
| Clutch | **ACT Heavy Duty Performance Street** | OEM | <5k mi at install ⚠️ vs "disc is low" — reconcile. **Verify 240mm not 230mm** | ⚠️ |
| Flywheel | **Conventional**, 6MT donor | 5MT flexible | Not interchangeable | ✅ |
| Clutch actuation | **2004 pedal/MC/hard pipe + slave retained** | — | Both pull type, 1.7 ratio, 130-135mm stroke. **Fork + throwout must be 6MT** | ✅ |
| Driveshaft | **Hybrid** 07 STi + wagon/2011 | OEM | Assembled from forum research; length + splines verified | ⚠️ |
| Engine mounts | **Torque Solution** | OEM | $123.99. **TS torque spec governs over FSM** | ✅ |

## 8 · Brakes · TAB 5

| Part | Brand / Model | PN | Supersedes | Notes | ✓ |
|---|---|---|---|---|:-:|
| Front calipers | **2007 WRX Limited 4-pot** | — | 02-05 single-pot slider | Included pads + hardware | ✅ |
| Rear calipers | **2007 WRX Limited 2-pot** | — | 02-05 single-pot | | ✅ |
| Front rotors | **KNS / DBA gravel spec** | **KNS4651** | OEM | Std WRX size, **enlarged centre bore, dual-drilled 5x100/5x114.3** — the part that bridges 4-pot calipers to STi hubs. $200 | ✅ |
| Rear rotors | **KNS / DBA gravel spec** | **KNS4656** | OEM | 06-07 WRX OD + **R180 STi parking brake drum**. $180 | ✅ |
| Brake lines | **StopTech stainless** | OEM rubber | F $59.66 / R $65.55 | ✅ |

**Planned:** 04-07 STI Brembos (GD-era — **not** 08-14, because knuckles are 05-07 STi). See `brake-notes.md`.

## 9 · Suspension · Chassis · TAB 6

| Part | Brand / Model | PN | Supersedes | Notes | ✓ |
|---|---|---|---|---|:-:|
| Coilovers | **BC Racing BR series**, camber plates | ❓ F-02-BR vs F-03-BR | OEM struts/springs | **OEM strut/spring FSM pages void.** Stock rates 8kg/mm F, 6kg/mm R ⚠️ | ⚠️ |
| Front knuckles | **05-07 STi** | 28313FE060 | 04 WRX knuckles | Chosen to preserve GD geometry. **→ 5x114.3** | ✅ |
| Front hub/bearing | **05-07 STi** | 28373FE000 | OEM | | ✅ |
| Rear knuckles | **05-07 STi**, both sides | — | 04 GG wagon | eBay, L $184.32 / R $233.32 | ✅ |
| Lateral links | **Wagon (non-STi) retained** | — | — | ⚠️ **STi knuckles on wagon links — rear camber not factory adjustable** | ✅ |
| Ball joint | Generic GD-era | 20206AJ000 | OEM | ❓ Verify taper seats in STi housing | ⚠️ |
| Stabilizer bars | ❓ | — | — | **Wagon, STi, or aftermarket — unknown** | ❓ |

---

## Wear & consumable items — track maintenance view

*Same data, cut for what needs periodic attention.*

| Item | Interval | Source |
|---|---|---|
| **Perrin header collector** | Annual inspection; 2-4 season life | §4 |
| **IAG AOS** | Drain per interval | §3 |
| **Brake fluid** | Flush **before every event** | §8 |
| **Brake pads / rotors** | Per-event thickness + taper check | §8 |
| **Turbo shaft play** | Periodic | §4 |
| **Engine oil** | Early change after break-in, then per interval | §3 |
| **Exhaust fasteners** | Re-torque after heat cycles, then per event | §4 |
| **Suspension bushings** | ★ Re-torque at ride height before first drive | §9 |
| **Fuel filter** | After initial line flush, then per interval | §5 |

---

## Not installed — spares / sell

| Part | Status |
|---|---|
| **Perrin lightweight crank pulley** | Superseded by Fluidampr. Sell or spare. $75 FB bundle |
| **2004 STi ECU** 22611AJ242 | Superseded by Link. $180 |
| **Valve shims** | eBay listing in progress |
| **5MT clutch fork / throwout** | Must NOT be used with 6MT |

---

## Open items — needs confirmation

- [ ] **Head casting** — 05-era vs V25B (2007)? Decides FSM section for head work
- [ ] **Injector brand + size**
- [ ] **BC coilover PN** — F-02-BR vs F-03-BR
- [ ] **Cosworth valve PN**
- [ ] **Stabilizer bars** — wagon / STi / aftermarket
- [ ] **FP Red bearing type** — journal vs ball bearing (oil restrictor sizing)
- [ ] **ACT disc diameter** — 240mm vs 230mm
- [ ] **Wastegate spring pressure**
- [ ] **Intake manifold year** — 05 vs 06 STi
- [ ] Actual measured bore + bearing clearances

---

## ⚠ Sources of truth — avoid drift

Build data currently lives in **five** places:
1. This register ← **make this authoritative for what's ON the car**
2. Google Sheets master build spreadsheet (purchasing/status)
3. `20-21 2004 Wagon Build.xlsx` in Dropbox (historical, 2020-21 purchases)
4. Individual `.md` notes files (deep detail per system)
5. Linear project CPU (work tracking)

**Suggested split:** Linear = *what to do*. This register = *what is on the car*. The `.md` files = *why, and the detail*. Spreadsheets = *historical purchasing record*.
