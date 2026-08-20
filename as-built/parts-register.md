<!-- GENERATED FROM parts.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-parts-register.py -->

# Aftermarket Parts Register

**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · 2011 6MT/DCCD · 05-07 STi knuckles all corners · 5x114.3 · 500whp target, mostly track

> **This is the deviations map, not just an inventory.** Every row marks a place the OEM manual is now wrong. The **Supersedes** column links each part to the FSM section it invalidates, keeping the binder and the car reconciled.

**Source of truth:** [`parts.csv`](parts.csv) — edit that, then regenerate.
**Confidence:** ✅ confirmed · ⚠️ recorded but unverified · ❓ needs confirmation

**111 parts** — 81 installed · 19 to-buy · 2 undecided · 2 fabricate · 2 verify-existing · 1 deferred · 1 planned · 1 sell · 1 spare · 1 in-stock

---

## Engine — Lower Internals · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ❓ | Coolant hose kit | Roger Clark Motorsport / Samco V8 12-hose kit 02-05 WRX/STI | OEM hoses | *[verify-existing]* Covers Modine + turbo coolant hoses - confirm whether owned |
| ✅ | Crank + cam seals | Subaru OEM | OEM | Crank seal + 4 cam seals |
| ✅ | Crank pulley | Perrin Lightweight | OEM crank pulley | DECISION REVERSED 2026-08-20: running the Perrin already installed rather than buying the Fluidampr. Mitigated by conventional OEM flywheel (avoids lightweight-pulley + lightweight-flywheel combo). Reversible - front-of-engine job |
| ✅ | Crank pulley bolt | Subaru OEM 12369AA011 | OEM bolt | NEW BOLT INSTALLED 2026-08-20. Angle-tightened spec: 44 Nm then 65-75 deg. Confirm it was tightened to the angle spec not just the 44 Nm preload |
| ✅ | Crankshaft | Subaru OEM 12200AA430 | OEM WRX crank | Nitride-treated STi |
| ✅ | Drain plug crush washers | Subaru OEM 803916010 |  | *[to-buy]* 10-pack. New washer every change per IAG |
| ✅ | Harmonic damper | Fluidampr 531101 | Perrin lightweight pulley | *[deferred]* NOT BUYING for now - see crank pulley row. Original 2026-07-02 rationale: torsional harmonics at 500whp threaten rod/main bearings |
| ✅ | Main bearings | King STDX | OEM | Mains fine-tuned by mixing shell halves; see as-built-engine-specs.md |
| ✅ | Oil filters | Wix 57712XP | OEM filter | *[to-buy]* x5 for break-in schedule. IAG specifies OEM or Wix XP. 23 psi bypass. PRE-FILL before install |
| ✅ | Oil pump | Subaru 15010AA360 | 10mm OEM pump | 11mm high-volume |
| ✅ | Pistons | Manley 612000C-4 | OEM pistons | EJ257 99.75mm std stroke std bore 8.5:1 dish |
| ⚠️ | Radiator hoses | Mishimoto Silicone upper + lower | OEM hoses | Already owned |
| ✅ | Rod bearings | King STD | OEM | Ran STD rod bearings |
| ✅ | Rods | Manley 15024-4 H-Tuff | OEM rods |  |
| ✅ | Timing belt kit | Cosworth / RCM High Grip tensioner + Cosworth belt | OEM timing kit | Kevlar belt 300pct stronger than OE |
| ✅ | Water pump + thermostat | Roger Clark Motorsport Black Series 3-Port | OEM water pump/thermostat | Cast impeller + 70C low-temp thermostat; 3-Port USDM manual |

## Engine — Heads & Valvetrain · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Camshafts | Subaru OEM |  | Stage 2 considered not fitted |
| ✅ | Cylinder heads | Cosworth | OEM heads | **FSM: Head/valvetrain FSM section governed by casting - STILL UNRESOLVED** · COSWORTH HEADS. Ported and polished; flows matched between banks; milled to allow larger cams |
| ✅ | Head gaskets | Subaru OEM | OEM | OEM head gaskets. Sound pairing with ARP studs - factory multi-layer gaskets are well regarded and the studs provide the clamp |
| ✅ | Head machining - valve spring seats |  | OEM seats | VALVE SPRING SEATS MODIFIED (deeper) to accept taller Manley springs and allow more lift. DECK SURFACE NOT MILLED - so compression stays at the 8.5:1 from the Manley dish pistons and cam timing geometry is unchanged |
| ✅ | Head porting | Cosworth Port + polish + flow matched | OEM ports | Flows matched between banks. Shop/who performed NOT RECORDED |
| ✅ | Head studs | ARP | OEM TTY head bolts | ARP STUDS CONFIRMED 2026-08-20. Resolves the main reliability concern at 500whp on E85 - OEM TTY bolts are the known weak point for head lift. Exact ARP kit PN not recorded |
| ✅ | Valve springs + retainers | Manley 22180-16 | OEM springs | Titanium retainers |
| ❓ | Valve stem seals | UNKNOWN | OEM | Replaced during build? Not recorded |
| ⚠️ | Valves | Oversized - brand TBD | OEM valves | OVERSIZED. Intake/exhaust sizes and material NOT RECORDED |

## Oiling · Binder TAB 2

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | AVCS oil feed line LH (driver) | Subaru OEM | OEM oil pipe LH | INSTALLED 2026-08-20. FSM item 27 Oil pipe LH |
| ✅ | AVCS oil feed line RH (passenger) | HEL HEL-OF34 stainless braided | OEM oil pipe RH | *[to-buy]* FSM item 29 Oil pipe RH. Fitment 06-14 WRX / 04-21 STI / 05-09 LGT / 04-08 FXT - spans both head generations so unaffected by the open head-casting question. Use HEL sealing washers + HEL torque NOT the FSM figure. Clamp to prevent braid abrasion against wiring/coolant hoses |
| ✅ | Air-oil separator | IAG AOS | Entire OEM PCV system | **FSM: LU PCV content void; all OEM PCV hoses removed** · Cap PCV portions of 21141AA131 |
| ⚠️ | Air-oil separator | IAG Street Series V2 | OEM PCV | USED great condition w/ all lines; PN verification pending |
| ✅ | Heat sleeve | DEI Reflective 5/8in ID 3ft | n/a new | *[to-buy]* For IAG AOS lines; share purchase with fuel lines |
| ✅ | Oil dipstick tube | Subaru OEM STI/J3 |  | Tube only - verify dipstick rod separately |
| ✅ | Oil drain T-fitting | TBD | n/a new | *[to-buy]* Merges turbo oil drain + IAG AOS drain into one return |
| ✅ | Oil filler neck | Subaru OEM J3 | OEM | 02-07 WRX/STI |
| ✅ | Oil pan | IAG | OEM pan | **FSM: Changes oil capacity - measure and record** |
| ✅ | Oil pickup tube | IAG | Moroso unit | Moroso didn't fit the IAG pan |
| ✅ | Oil pressure sender | remote | OEM switch location | Firewall mounted 2026-08-20; torque 25 Nm; THREE BOND 1324 |
| ✅ | Turbo oil DRAIN line | IAG Stainless braided -10AN | OEM drain | *[to-buy]*  |
| ✅ | Turbo oil supply line | Forced Performance FP Turbo Oil Supply Line - EJ | OEM feed line | Stainless braided; brand-matched to FP Red |

## Turbo · Induction · Exhaust · Binder TAB 3

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ❓ | BOV adapter | TBD |  | *[undecided]* Sheet says not needed if going bung-to-hose direct - depends on final BOV choice |
| ❓ | Blow-off valve | TBD | OEM BPV | *[undecided]* NOT DECIDED. Build sheet records a leaning toward pure-recirc hose-mount (Turbosmart/GFB/Forge) but Alan confirms not final. Must hold 30+ psi. See CPU-36 |
| ✅ | Cold air intake | AEM 21-474 | OEM airbox | PN CORRECTED 2026-08-20 (sheet said 21-477). Listed for 02-05 WRX not STI but TEST FITTED OK. Filter relocates outside engine bay. Mates to FP 84mm inlet via silicone reducing coupler |
| ✅ | Exhaust gaskets - most joints | Subaru OEM / aftermarket | OEM gaskets | *[in-stock]* IN STOCK 2026-08-20: header-to-head / header-to-uppipe / uppipe-to-turbo / downpipe-to-midpipe |
| ❓ | Gasket - turbo to downpipe | TBD | OEM gasket | *[verify-existing]* NOT CONFIRMED - check stock. Match to the actual FP Red turbine outlet flange before ordering; a stock-location turbo usually takes the OEM 02-07 WRX/STI gasket but verify against the housing |
| ✅ | Header | Perrin Equal Length | OEM manifold | 304SS welded merge 4-2-1; 14pct larger primaries; 2-4 track seasons |
| ✅ | Intercooler | APS D/R 725 FMIC | OEM TMIC | **FSM: IN TMIC content void; hood scoop freed** · Core 28x9.5x4.5 bar-and-plate |
| ✅ | TGV deletes | IAG | OEM TGVs | **FSM: IN TGV content void** · IAG TGV deletes. Bought used. Holes drilled slightly to bolt to the intake manifold |
| ✅ | Turbo inlet | Forced Performance FP 8005010A 84mm | OEM inlet | 84mm silicone; fits FP 84mm FAP cover; has recirc return bung + Mishimoto BPV recirc hose |
| ✅ | Turbocharger | Forced Performance FP STi Red HTZ R690701874 | OEM VF-series | USED. HTZ variant - older proven design w/ journal-bearing option; CONFIRM bearing type for oil restrictor sizing |
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
| ✅ | Alternator | Michael Singer 200A / 220A peak - 128.5mm Denso hairpin 6-phase | OEM 90A 23700AA430 | *[to-buy]* DECIDED 2026-08-20. Denso case direct replacement for 23700AA430. 150A IDLE output. 14.8V regulator - specced by Singer knowing battery is Interstate MTX-35 AGM. Supersedes DC Power 180A and JS 250A. Confirm pulley with builder for belt sizing |
| ✅ | Battery | Interstate MTX-35 AGM Group 35 | OEM battery | ENGINE BAY - OEM LOCATION (corrected 2026-08-20; was wrongly recorded as relocated to rear) |
| ✅ | Battery tray | Custom 3D print ASA | OEM tray 82122AA031/032 | Engine bay. Cavity 236x182mm. Integrated platform for 2x Blue Sea 5001 MEGA fuse holders. Retains stock J-hook strap clamp |
| ✅ | Belt - A/C | Bando or Mitsuboshi 4PK895 (352K4) | OEM belt | *[to-buy]* REAR belt (crank > A/C > idler). 4 ribs 895mm. Subaru OEM equiv 73323AC000. Tension 350-450 N |
| ✅ | Belt - alternator + power steering | Bando or Mitsuboshi 5PK875 (344K5) | OEM belt | *[to-buy]* FRONT belt. 5 ribs 875mm. Gates equiv K050345. Tension 490-640 N. Alternator is its own tensioner |
| ✅ | Big 3 wiring upgrade | Knukonceptz / Stinger / Sky High 1/0 AWG OFC 3-cable kit | OEM charging cables | *[to-buy]*  |
| ✅ | DBW pedal | Subaru 36010FE020 |  | 05 STi drive-by-wire |
| ✅ | DCCD controller | iWire Spiider | OEM DCCD control | Functional test needed at commissioning |
| ✅ | ECU | Link Engine Management G4X Fury SubaruLink / WRXLink WRX104X 224-4000 | OEM ECU 22611AJ242 | **FSM: ALL OEM ECU / OBD-II / immobilizer sections VOID** · PnP to factory ECU case; quote AS-0001 |
| ✅ | Engine harness | Subaru 2005 STi | 04 GG body harness | **FSM: WI diagrams do not describe this car** · Merged by iWire |
| ✅ | Flex fuel QD adapters | Russell / Earl's 3/8in QD to -6AN x2 | n/a new | *[to-buy]*  |
| ✅ | Flex fuel sensor | Continental PPA-IGF35 / GM 13577429 | n/a new | *[to-buy]* Both labels; ethanol content sensor |
| ✅ | Flex sensor bracket | DIY 3D-printed ASA black | n/a new | *[fabricate]* M6 brass heat-set inserts |
| ⚠️ | Fuel pressure sensor | TBD per Ben 0-150 PSI 1/8in NPT 0.5-4.5V | n/a new | *[to-buy]* Single-function NOT Bosch combined |
| ✅ | Gauge cluster | Subaru 07 STi | 04 WRX cluster | **FSM: Print IDI from 2007 manual not 2004** |
| ⚠️ | Gauges | Prosport boost/fuel/oil/volt |  |  |
| ✅ | Harness merge | iWire |  | Includes DCCD Spiider and VSS Pro |
| ✅ | Ignition coils | NGK | OEM coils | Brand-matched to ILTR7L8R plugs |
| ⚠️ | MAF sensor | Hitachi OE / Subaru OEM 22680AA380 / 22680AA38A |  | *[to-buy]* RETAINED for IAT element in speed density mode - verify exact PN |
| ✅ | MAP sensor | Omni Power MAP-STI-4BR | OEM 2.5-bar Denso | 4-bar; cal 11.97 psia/V +0.506 offset |
| ✅ | Oil pressure sensor | Prosport 0-100 PSI 1/8in NPT 0.5-4.5V | OEM switch | 24in hose w/ M18x1.5 galley adapter - confirms galley + header bung thread |
| ✅ | Spark plugs | NGK ILTR7L8R | OEM plugs | One heat range colder for E85 at 500whp |
| ✅ | VSS | iWire VSS Pro |  | Speedo correction for 6MT |
| ✅ | Wideband | Link CAN Lambda | OEM front O2 | *[to-buy]* Post-turbo bung |
| ✅ | Wideband O2 sensor | Bosch LSU 4.9 | OEM front O2 | *[to-buy]* For Link CAN Lambda |

## Drivetrain · Binder TAB 4

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Clutch | ACT Heavy Duty Performance Street | OEM | Under 5k mi at install - CONFLICTS with disc is low; verify 240mm not 230mm |
| ✅ | Clutch actuation | Subaru 2004 pedal/MC/hard pipe/slave |  | Both pull type 1.7 ratio 130-135mm; fork came with the 2011 6MT so is 6MT spec |
| ⚠️ | Clutch release fork | Subaru 2011 6MT OEM | 5MT fork | Came with the 2011 6MT swap - almost certainly correct; confirm PN at next clutch job |
| ⚠️ | Driveshaft | Hybrid 07 STi + wagon | OEM | Assembled from forum research; length and splines verified |
| ✅ | Engine mounts | Torque Solution | OEM | **FSM: TS torque spec governs over FSM** |
| ✅ | Flywheel | Subaru Conventional 6MT donor | 5MT flexible flywheel | INSTALLED AND COMPLETE confirmed 2026-08-20. OEM 6MT conventional - NOT the ACT/Fidanza/Exedy options still listed on the build sheet. Not interchangeable with 5MT flexible type |
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
| ⚠️ | PS pump rebuild kit | Nelson Seals / Gates FKM Viton kit or Gates 348827 |  | *[to-buy]* Likely needed |
| ⚠️ | Power steering pump | Subaru OEM 34430-FE040 |  | Multiple pumps on hand - inspect to pick best; same PN across 04-07 turbo EJ |
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
| Wideband O2 sensor (Bosch) | Sensor service life | ecu-electrical |
| Oil filters (Wix) | Every oil change | engine-lower |
| Drain plug crush washers (Subaru OEM) | Every oil change | engine-lower |
| Turbocharger (Forced Performance) | Shaft play periodic | induction |
| Header (Perrin) | Annual collector inspection | induction |
| Air-oil separator (IAG) | Drain per interval | oiling |
| Air-oil separator (IAG) | Drain per interval | oiling |

---

## Not installed — spares / sell

| Part | Brand / Model | Status | Notes |
|---|---|---|---|
| ECU | Subaru 22611AJ242 | sell | 04 STi - superseded by Link |
| Clutch fork + throwout | Subaru 5MT | spare | MUST NOT be used with 6MT |

---

## Open items — needs confirmation

- [ ] ❓ **Valve stem seals** (engine-heads) — Replaced during build? Not recorded
- [ ] ❓ **Coolant hose kit** (engine-lower) — Covers Modine + turbo coolant hoses - confirm whether owned
- [ ] ❓ **Blow-off valve** (induction) — NOT DECIDED. Build sheet records a leaning toward pure-recirc hose-mount (Turbosmart/GFB/Forge) but Alan confirms not final. Must hold 30+ psi. See CPU-36
- [ ] ❓ **BOV adapter** (induction) — Sheet says not needed if going bung-to-hose direct - depends on final BOV choice
- [ ] ❓ **Gasket - turbo to downpipe** (induction) — NOT CONFIRMED - check stock. Match to the actual FP Red turbine outlet flange before ordering; a stock-location turbo usually takes the OEM 02-07 WRX/STI gasket but verify against the housing
- [ ] ⚠️ **Clutch** (drivetrain) — Under 5k mi at install - CONFLICTS with disc is low; verify 240mm not 230mm
- [ ] ⚠️ **Clutch release fork** (drivetrain) — Came with the 2011 6MT swap - almost certainly correct; confirm PN at next clutch job
- [ ] ⚠️ **Driveshaft** (drivetrain) — Assembled from forum research; length and splines verified
- [ ] ⚠️ **Gauges** (ecu-electrical) — unverified
- [ ] ⚠️ **AFR gauge** (ecu-electrical) — Separate from CAN Lambda
- [ ] ⚠️ **Fuel pressure sensor** (ecu-electrical) — Single-function NOT Bosch combined
- [ ] ⚠️ **MAF sensor** (ecu-electrical) — RETAINED for IAT element in speed density mode - verify exact PN
- [ ] ⚠️ **Valves** (engine-heads) — OVERSIZED. Intake/exhaust sizes and material NOT RECORDED
- [ ] ⚠️ **Camshafts** (engine-heads) — Stage 2 considered not fitted
- [ ] ⚠️ **Radiator hoses** (engine-lower) — Already owned
- [ ] ⚠️ **Fuel rails** (fuel) — CONFLICT - 2020-21 sheet says Early IAG fuel rail; needs 2x ORB-to-AN adapters
- [ ] ⚠️ **Air-oil separator** (oiling) — USED great condition w/ all lines; PN verification pending
- [ ] ⚠️ **Coilovers** (suspension) — PN F-02-BR vs F-03-BR UNKNOWN; camber plates built in; stock rates 8kg/mm F 6kg/mm R
- [ ] ⚠️ **Front ball joint** (suspension) — Generic GD-era - verify taper seats in STi housing
- [ ] ⚠️ **Power steering pump** (suspension) — Multiple pumps on hand - inspect to pick best; same PN across 04-07 turbo EJ
- [ ] ⚠️ **PS pump rebuild kit** (suspension) — Likely needed

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
