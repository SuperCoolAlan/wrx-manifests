<!-- GENERATED FROM parts.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-parts-register.py -->

# Aftermarket Parts Register

**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · 2011 6MT/DCCD · 05-07 STi knuckles all corners · 5x114.3 · 500whp target, mostly track

> **This is the deviations map, not just an inventory.** Every row marks a place the OEM manual is now wrong. The **Supersedes** column links each part to the FSM section it invalidates, keeping the binder and the car reconciled.

**Source of truth:** [`parts.csv`](parts.csv) — edit that, then regenerate.
**Confidence:** ✅ confirmed · ⚠️ recorded but unverified · ❓ needs confirmation

**64 parts** — 54 installed · 4 to-buy · 2 sell · 1 undecided · 1 fabricate · 1 planned · 1 spare

---

## Engine — Lower Internals · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Crankshaft | Subaru OEM 12200AA430 | OEM WRX crank | Nitride-treated STi |
| ⚠️ | Harmonic damper | Fluidampr 531101 | OEM crank pulley | *[to-buy]* Supersedes Perrin lightweight pulley; internally balanced |
| ✅ | Main bearings | King STDX | OEM | Mains fine-tuned by mixing shell halves; see as-built-engine-specs.md |
| ✅ | Oil pump | Subaru 15010AA360 | 10mm OEM pump | 11mm high-volume |
| ✅ | Pistons | Manley 612000C-4 | OEM pistons | EJ257 99.75mm std stroke std bore 8.5:1 dish |
| ✅ | Rod bearings | King STD | OEM | Ran STD rod bearings |
| ✅ | Rods | Manley 15024-4 H-Tuff | OEM rods |  |

## Engine — Heads & Valvetrain · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Camshafts | Subaru OEM |  | Stage 2 considered not fitted |
| ✅ | Valve springs + retainers | Manley 22180-16 | OEM springs | Titanium retainers |
| ❓ | Valves | Cosworth UNKNOWN | OEM valves | PN not recorded |

## Oiling · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Air-oil separator | IAG AOS | Entire OEM PCV system | **FSM: LU PCV content void; all OEM PCV hoses removed** · Cap PCV portions of 21141AA131 |
| ✅ | Oil pan | IAG | OEM pan | **FSM: Changes oil capacity - measure and record** |
| ✅ | Oil pressure sender | remote | OEM switch location | Firewall mounted 2026-08-20; torque 25 Nm; THREE BOND 1324 |

## Turbo · Induction · Exhaust · Binder TAB 3

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ❓ | Blow-off valve | UNDECIDED | OEM BPV | *[undecided]* Kit shipped w Turbosmart Race Port VTA - presence unconfirmed; see Linear CPU-36 |
| ✅ | Header | Perrin Equal Length | OEM manifold | 304SS welded merge 4-2-1; 14pct larger primaries; 2-4 track seasons |
| ⚠️ | Intake | AEM Fender intake | OEM airbox |  |
| ✅ | Intercooler | APS D/R 725 FMIC | OEM TMIC | **FSM: IN TMIC content void; hood scoop freed** · Core 28x9.5x4.5 bar-and-plate |
| ✅ | TGV | DELETED | OEM TGVs | **FSM: IN TGV content void** · Used |
| ✅ | Turbo inlet | Oversized | OEM inlet | Has recirc return bung |
| ✅ | Turbocharger | Forced Performance FP Red | OEM VF-series | Journal vs ball bearing UNKNOWN - affects oil restrictor sizing |
| ✅ | Uppipe | PLM 38mm EWG | OEM uppipe | Bundle price with wastegate; 2-bolt flange matches Perrin collector |
| ✅ | Wastegate | TiAL MVS 38mm | OEM internal WG | Spring pressure UNKNOWN - record when fitted |

## Fuel System · Binder TAB 4

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | FPR / flex bracket | Custom | Washer bottle location | *[fabricate]* Washer system deleted |
| ✅ | Flex fuel sensor |  | n/a new capability | *[to-buy]* Bench-tested; mounts on new FPR bracket |
| ✅ | Fuel lines | Red Horse 235 series -6AN 15ft | OEM hard/soft lines | *[to-buy]* ECO+FKM E85-safe liner; SS under-braid + nylon jacket |
| ✅ | Fuel pressure regulator | Aeromotive 15633 | OEM FPR | Plus Aeromotive gauge 40.90 |
| ✅ | Fuel pump | DeatschWerks | OEM pump | **FSM: FU pump content void; FPCM bypassed** · See fuel-pump-isolator-notes.md |
| ⚠️ | Fuel rails | Aeromotive | OEM rails | CONFLICT - 2020-21 sheet says Early IAG fuel rail; needs 2x ORB-to-AN adapters |
| ❓ | Injectors | UNKNOWN | OEM injectors | Installed - brand and size not recorded |

## Engine Management · Electrical · Binder TAB 7

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | AFR gauge | Innovate MTX-L |  | Separate from CAN Lambda |
| ✅ | Battery relocation | Custom 3D-printed tray | Stock location | Cavity 236x182mm |
| ✅ | DBW pedal | Subaru 36010FE020 |  | 05 STi drive-by-wire |
| ✅ | DCCD controller | iWire Spiider | OEM DCCD control | Functional test needed at commissioning |
| ✅ | ECU | Link | OEM ECU 22611AJ242 | **FSM: ALL OEM ECU / OBD-II / immobilizer sections VOID** |
| ✅ | Engine harness | Subaru 2005 STi | 04 GG body harness | **FSM: WI diagrams do not describe this car** · Merged by iWire |
| ✅ | Gauge cluster | Subaru 07 STi | 04 WRX cluster | **FSM: Print IDI from 2007 manual not 2004** |
| ⚠️ | Gauges | Prosport boost/fuel/oil/volt |  |  |
| ✅ | Harness merge | iWire |  | Includes DCCD Spiider and VSS Pro |
| ✅ | MAP sensor | Omni Power MAP-STI-4BR | OEM 2.5-bar Denso | 4-bar; cal 11.97 psia/V +0.506 offset |
| ✅ | VSS | iWire VSS Pro |  | Speedo correction for 6MT |
| ✅ | Wideband | Link CAN Lambda | OEM front O2 | *[to-buy]* Post-turbo bung |

## Drivetrain · Binder TAB 4

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Clutch | ACT Heavy Duty Performance Street | OEM | Under 5k mi at install - CONFLICTS with disc is low; verify 240mm not 230mm |
| ✅ | Clutch actuation | Subaru 2004 pedal/MC/hard pipe/slave |  | Both pull type 1.7 ratio 130-135mm; fork+throwout must be 6MT |
| ⚠️ | Driveshaft | Hybrid 07 STi + wagon | OEM | Assembled from forum research; length and splines verified |
| ✅ | Engine mounts | Torque Solution | OEM | **FSM: TS torque spec governs over FSM** |
| ✅ | Flywheel | Subaru Conventional 6MT | 5MT flexible flywheel | Not interchangeable with 5MT |
| ✅ | Rear differential | Subaru R180 | R160 | Came with trans - ratios match |
| ✅ | Transmission | Subaru 2011 STi 6MT DCCD | 04 WRX 5MT | **FSM: Trans fluid = 2011 spec NOT 2004** · 97k miles at install; bundle |

## Brakes · Binder TAB 5

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Brake lines | StopTech Stainless | OEM rubber | Front 59.66 rear 65.55 |
| ✅ | Brembo upgrade | Brembo 04-07 STI | 4/2-pot calipers | *[planned]* GD-era NOT 08-14 - knuckles are 05-07 STi |
| ✅ | Front calipers | Subaru 2007 WRX Limited 4-pot | 02-05 single-pot slider | **FSM: Print BR from 2007 manual** · Included pads and hardware |
| ✅ | Front rotors | KNS / DBA KNS4651 | OEM rotors | Std WRX size; enlarged centre bore; dual-drilled 5x100/5x114.3 |
| ✅ | Rear calipers | Subaru 2007 WRX Limited 2-pot | 02-05 single-pot |  |
| ✅ | Rear rotors | KNS / DBA KNS4656 | OEM rotors | 06-07 WRX OD with R180 STi parking brake drum |

## Suspension · Chassis · Binder TAB 6

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Coilovers | BC Racing BR series | OEM struts/springs | **FSM: OEM strut/spring FSM pages void** · PN F-02-BR vs F-03-BR UNKNOWN; camber plates built in; stock rates 8kg/mm F 6kg/mm R |
| ⚠️ | Front ball joint | Subaru 20206AJ000 | OEM | Generic GD-era - verify taper seats in STi housing |
| ✅ | Front knuckles | Subaru 28313FE060 | 04 WRX knuckles | **FSM: Print FS from 2005/2007 not 2004** · 05-07 STi; chosen to preserve GD geometry; gives 5x114.3 |
| ✅ | Front wheel bearing | Subaru 28373FE000 | OEM |  |
| ✅ | Lateral links | Subaru Wagon non-STi RETAINED |  | **FSM: Use Wagon/Except-STi torque values** · STi knuckles on wagon links - rear camber NOT factory adjustable |
| ✅ | Rear knuckles | Subaru 05-07 STi both sides | 04 GG wagon knuckles | L 184.32 R 233.32 |
| ❓ | Stabilizer bars | UNKNOWN |  | Wagon STi or aftermarket - unknown |

---

## Wear & consumable items — track maintenance view

| Item | Interval | System |
|---|---|---|
| Front calipers (Subaru) | Piston/boot check | brakes |
| Front rotors (KNS / DBA) | Thickness per event | brakes |
| Rear rotors (KNS / DBA) | Thickness per event | brakes |
| Wideband (Link) | Sensor service life | ecu-electrical |
| Turbocharger (Forced Performance) | Shaft play periodic | induction |
| Header (Perrin) | Annual collector inspection | induction |
| Air-oil separator (IAG) | Drain per interval | oiling |

---

## Not installed — spares / sell

| Part | Brand / Model | Status | Notes |
|---|---|---|---|
| Crank pulley | Perrin Lightweight | sell | Superseded by Fluidampr |
| ECU | Subaru 22611AJ242 | sell | 04 STi - superseded by Link |
| Clutch fork + throwout | Subaru 5MT | spare | MUST NOT be used with 6MT |

---

## Open items — needs confirmation

- [ ] ❓ **Valves** (engine-heads) — PN not recorded
- [ ] ❓ **Injectors** (fuel) — Installed - brand and size not recorded
- [ ] ❓ **Blow-off valve** (induction) — Kit shipped w Turbosmart Race Port VTA - presence unconfirmed; see Linear CPU-36
- [ ] ❓ **Stabilizer bars** (suspension) — Wagon STi or aftermarket - unknown
- [ ] ⚠️ **Clutch** (drivetrain) — Under 5k mi at install - CONFLICTS with disc is low; verify 240mm not 230mm
- [ ] ⚠️ **Driveshaft** (drivetrain) — Assembled from forum research; length and splines verified
- [ ] ⚠️ **Gauges** (ecu-electrical) — unverified
- [ ] ⚠️ **AFR gauge** (ecu-electrical) — Separate from CAN Lambda
- [ ] ⚠️ **Camshafts** (engine-heads) — Stage 2 considered not fitted
- [ ] ⚠️ **Harmonic damper** (engine-lower) — Supersedes Perrin lightweight pulley; internally balanced
- [ ] ⚠️ **Fuel rails** (fuel) — CONFLICT - 2020-21 sheet says Early IAG fuel rail; needs 2x ORB-to-AN adapters
- [ ] ⚠️ **Intake** (induction) — unverified
- [ ] ⚠️ **Coilovers** (suspension) — PN F-02-BR vs F-03-BR UNKNOWN; camber plates built in; stock rates 8kg/mm F 6kg/mm R
- [ ] ⚠️ **Front ball joint** (suspension) — Generic GD-era - verify taper seats in STi housing

---

## Querying

```sh
# everything still to buy
awk -F, 'NR==1||$8=="to-buy"' as-built/parts.csv | column -t -s,

# anything unconfirmed
grep -E 'unknown|unverified' as-built/parts.csv

# one system
grep '^brakes,' as-built/parts.csv

# find a part number
grep -i 'KNS4651' as-built/parts.csv
```
