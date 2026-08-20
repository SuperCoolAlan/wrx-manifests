<!-- GENERATED FROM parts.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-parts-register.py -->

# Aftermarket Parts Register

**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · 2011 6MT/DCCD · 05-07 STi knuckles all corners · 5x114.3 · 500whp target, mostly track

> **This is the deviations map, not just an inventory.** Every row marks a place the OEM manual is now wrong. The **Supersedes** column links each part to the FSM section it invalidates, keeping the binder and the car reconciled.

**Source of truth:** [`parts.csv`](parts.csv) — edit that, then regenerate.
**Confidence:** ✅ confirmed · ⚠️ recorded but unverified · ❓ needs confirmation

**78 parts** — 67 installed · 5 to-buy · 2 sell · 1 undecided · 1 fabricate · 1 planned · 1 spare

---

## Engine — Lower Internals · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Crank + cam seals | Subaru OEM | OEM | Crank seal + 4 cam seals |
| ✅ | Crankshaft | Subaru OEM 12200AA430 | OEM WRX crank | Nitride-treated STi |
| ⚠️ | Harmonic damper | Fluidampr 531101 | OEM crank pulley | *[to-buy]* Supersedes Perrin lightweight pulley; internally balanced |
| ✅ | Main bearings | King STDX | OEM | Mains fine-tuned by mixing shell halves; see as-built-engine-specs.md |
| ✅ | Oil pump | Subaru 15010AA360 | 10mm OEM pump | 11mm high-volume |
| ✅ | Pistons | Manley 612000C-4 | OEM pistons | EJ257 99.75mm std stroke std bore 8.5:1 dish |
| ✅ | Rod bearings | King STD | OEM | Ran STD rod bearings |
| ✅ | Rods | Manley 15024-4 H-Tuff | OEM rods |  |
| ✅ | Timing belt kit | Cosworth / RCM High Grip tensioner + Cosworth belt | OEM timing kit | Kevlar belt 300pct stronger than OE |
| ✅ | Water pump + thermostat | Roger Clark Motorsport Black Series 3-Port | OEM water pump/thermostat | Cast impeller + 70C low-temp thermostat; 3-Port USDM manual |

## Engine — Heads & Valvetrain · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Camshafts | Subaru OEM |  | Stage 2 considered not fitted |
| ✅ | Valve springs + retainers | Manley 22180-16 | OEM springs | Titanium retainers |
| ❓ | Valves | Cosworth UNKNOWN | OEM valves | PN not recorded |

## Oiling · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | AVCS oil feed lines | Subaru OEM | OEM | *[to-buy]* Driver side ordered; passenger side TBD - OEM or HEL braided |
| ✅ | Air-oil separator | IAG AOS | Entire OEM PCV system | **FSM: LU PCV content void; all OEM PCV hoses removed** · Cap PCV portions of 21141AA131 |
| ✅ | Oil dipstick tube | Subaru OEM STI/J3 |  | Tube only - verify dipstick rod separately |
| ✅ | Oil pan | IAG | OEM pan | **FSM: Changes oil capacity - measure and record** |
| ✅ | Oil pickup tube | IAG | Moroso unit | Moroso didn't fit the IAG pan |
| ✅ | Oil pressure sender | remote | OEM switch location | Firewall mounted 2026-08-20; torque 25 Nm; THREE BOND 1324 |
| ✅ | Turbo oil supply line | Forced Performance FP Turbo Oil Supply Line - EJ | OEM feed line | Stainless braided; brand-matched to FP Red |

## Turbo · Induction · Exhaust · Binder TAB 3

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ❓ | Blow-off valve | UNDECIDED | OEM BPV | *[undecided]* Kit shipped w Turbosmart Race Port VTA - presence unconfirmed; see Linear CPU-36 |
| ✅ | Header | Perrin Equal Length | OEM manifold | 304SS welded merge 4-2-1; 14pct larger primaries; 2-4 track seasons |
| ✅ | Intake | AEM 21-477 / 21-477C | OEM airbox | Cold air intake 02-07 WRX/STI - verify exact PN |
| ✅ | Intercooler | APS D/R 725 FMIC | OEM TMIC | **FSM: IN TMIC content void; hood scoop freed** · Core 28x9.5x4.5 bar-and-plate |
| ✅ | TGV | DELETED | OEM TGVs | **FSM: IN TGV content void** · Used |
| ✅ | Turbo inlet | Forced Performance FP 8005010A 84mm | OEM inlet | 84mm silicone; fits FP 84mm FAP cover; has recirc return bung + Mishimoto BPV recirc hose |
| ✅ | Turbocharger | Forced Performance FP Red | OEM VF-series | Journal vs ball bearing UNKNOWN - affects oil restrictor sizing |
| ✅ | Uppipe | PLM 38mm EWG | OEM uppipe | Bundle price with wastegate; 2-bolt flange matches Perrin collector |
| ✅ | Wastegate | TiAL MVS 38mm | OEM internal WG | Spring pressure UNKNOWN - record when fitted |

## Fuel System · Binder TAB 4

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | FPR / flex bracket | Custom | Washer bottle location | *[fabricate]* Washer system deleted |
| ✅ | Flex fuel sensor |  | n/a new capability | *[to-buy]* Bench-tested; mounts on new FPR bracket |
| ✅ | Fuel filter | DeatschWerks 8-03-110-010K-6 | OEM filter | 10 micron; -6AN ports (NOT -010K-8) |
| ✅ | Fuel lines | Red Horse 235 series -6AN 15ft | OEM hard/soft lines | *[to-buy]* ECO+FKM E85-safe liner; SS under-braid + nylon jacket |
| ✅ | Fuel pressure regulator | Aeromotive 15633 | OEM FPR | Plus Aeromotive gauge 40.90 |
| ✅ | Fuel pump | DeatschWerks DW400 9-401-1041 | OEM pump | **FSM: FU pump content void; FPCM bypassed** · 415 LPH BRUSHED motor (not brushless); see fuel-pump-isolator-notes.md |
| ✅ | Fuel pump hardwire kit | DeatschWerks FPHWK-10-HD | OEM pump wiring | High-current 10 AWG heavy duty relay kit battery-direct |
| ⚠️ | Fuel rails | Aeromotive | OEM rails | CONFLICT - 2020-21 sheet says Early IAG fuel rail; needs 2x ORB-to-AN adapters |
| ✅ | Injectors | DeatschWerks DW1500 16M-07-1500-4 | OEM injectors | Set of 4; sized per tuner for 500whp E85 |

## Engine Management · Electrical · Binder TAB 7

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | AFR gauge | Innovate MTX-L |  | Separate from CAN Lambda |
| ✅ | Battery relocation | Custom 3D-printed tray | Stock location | Cavity 236x182mm |
| ✅ | DBW pedal | Subaru 36010FE020 |  | 05 STi drive-by-wire |
| ✅ | DCCD controller | iWire Spiider | OEM DCCD control | Functional test needed at commissioning |
| ✅ | ECU | Link Engine Management G4X Fury SubaruLink / WRXLink WRX104X 224-4000 | OEM ECU 22611AJ242 | **FSM: ALL OEM ECU / OBD-II / immobilizer sections VOID** · PnP to factory ECU case; quote AS-0001 |
| ✅ | Engine harness | Subaru 2005 STi | 04 GG body harness | **FSM: WI diagrams do not describe this car** · Merged by iWire |
| ✅ | Gauge cluster | Subaru 07 STi | 04 WRX cluster | **FSM: Print IDI from 2007 manual not 2004** |
| ⚠️ | Gauges | Prosport boost/fuel/oil/volt |  |  |
| ✅ | Harness merge | iWire |  | Includes DCCD Spiider and VSS Pro |
| ✅ | Ignition coils | NGK | OEM coils | Brand-matched to ILTR7L8R plugs |
| ✅ | MAP sensor | Omni Power MAP-STI-4BR | OEM 2.5-bar Denso | 4-bar; cal 11.97 psia/V +0.506 offset |
| ✅ | Oil pressure sensor | Prosport 0-100 PSI 1/8in NPT 0.5-4.5V | OEM switch | 24in hose w/ M18x1.5 galley adapter - confirms galley + header bung thread |
| ✅ | Spark plugs | NGK ILTR7L8R | OEM plugs | One heat range colder for E85 at 500whp |
| ✅ | VSS | iWire VSS Pro |  | Speedo correction for 6MT |
| ✅ | Wideband | Link CAN Lambda | OEM front O2 | *[to-buy]* Post-turbo bung |

## Drivetrain · Binder TAB 4

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Clutch | ACT Heavy Duty Performance Street | OEM | Under 5k mi at install - CONFLICTS with disc is low; verify 240mm not 230mm |
| ✅ | Clutch actuation | Subaru 2004 pedal/MC/hard pipe/slave |  | Both pull type 1.7 ratio 130-135mm; fork came with the 2011 6MT so is 6MT spec |
| ⚠️ | Clutch release fork | Subaru 2011 6MT OEM | 5MT fork | Came with the 2011 6MT swap - almost certainly correct; confirm PN at next clutch job |
| ⚠️ | Driveshaft | Hybrid 07 STi + wagon | OEM | Assembled from forum research; length and splines verified |
| ✅ | Engine mounts | Torque Solution | OEM | **FSM: TS torque spec governs over FSM** |
| ✅ | Flywheel | Subaru Conventional 6MT | 5MT flexible flywheel | Not interchangeable with 5MT |
| ✅ | Pitch stop mount | Perrin Red N2 polyurethane | OEM pitch stop | Billet body; 90a + 70a bushings |
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
| ✅ | Stabilizer bars | Subaru Wagon |  | **FSM: Use Wagon/Except-STi torque values** · Wagon bars confirmed 2026-08-20; front 20mm rear 17mm vs STi 19/20 |

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
- [ ] ❓ **Blow-off valve** (induction) — Kit shipped w Turbosmart Race Port VTA - presence unconfirmed; see Linear CPU-36
- [ ] ⚠️ **Clutch** (drivetrain) — Under 5k mi at install - CONFLICTS with disc is low; verify 240mm not 230mm
- [ ] ⚠️ **Clutch release fork** (drivetrain) — Came with the 2011 6MT swap - almost certainly correct; confirm PN at next clutch job
- [ ] ⚠️ **Driveshaft** (drivetrain) — Assembled from forum research; length and splines verified
- [ ] ⚠️ **Gauges** (ecu-electrical) — unverified
- [ ] ⚠️ **AFR gauge** (ecu-electrical) — Separate from CAN Lambda
- [ ] ⚠️ **Camshafts** (engine-heads) — Stage 2 considered not fitted
- [ ] ⚠️ **Harmonic damper** (engine-lower) — Supersedes Perrin lightweight pulley; internally balanced
- [ ] ⚠️ **Fuel rails** (fuel) — CONFLICT - 2020-21 sheet says Early IAG fuel rail; needs 2x ORB-to-AN adapters
- [ ] ⚠️ **AVCS oil feed lines** (oiling) — Driver side ordered; passenger side TBD - OEM or HEL braided
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
