<!-- GENERATED FROM parts.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-parts-register.py -->

# Aftermarket Parts Register

**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · 2011 6MT/DCCD · 05-07 STi knuckles all corners · 5x114.3 · 500whp target, mostly track

> **This is the deviations map, not just an inventory.** Every row marks a place the OEM manual is now wrong. The **Supersedes** column links each part to the FSM section it invalidates, keeping the binder and the car reconciled.

**Source of truth:** [`parts.csv`](parts.csv) — edit that, then regenerate.
**Confidence:** ✅ confirmed · ⚠️ recorded but unverified · ❓ needs confirmation

**198 parts** — 148 installed · 20 to-buy · 15 in-stock · 3 undecided · 3 fabricate · 3 verify-existing · 2 not-fitted · 1 deferred · 1 planned · 1 sell · 1 spare

---

## Engine — Lower Internals · Binder TAB 2 · recorded spend $1,953.03

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
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
| ✅ | Rod bearings | King STD | OEM | Ran STD rod bearings |
| ✅ | Rods | Manley 15024-4 H-Tuff | OEM rods |  |
| ✅ | Timing belt kit | Cosworth / RCM High Grip tensioner + Cosworth belt | OEM timing kit | Kevlar belt 300pct stronger than OE |

## Engine — Heads & Valvetrain · Binder TAB 2 · recorded spend $277.18

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | AVCS solenoids | Subaru OEM (used) |  | **FSM: SINGLE AVCS - intake only, one per head** · Came with the used V25B heads. UNTESTED - verify cam angle response on first start |
| ⚠️ | Camshafts | Subaru OEM |  | Stage 2 considered not fitted |
| ✅ | Combustion chamber cc matching |  |  | CHAMBERS EQUALISED - confirmed 2026-08-20. Compression is even bank to bank; nothing asymmetric to warn Ben about. Measured cc figures TEARDOWN-GATED |
| ✅ | Cylinder head - one side | Cosworth V25B STi | OEM head | **FSM: Use ME(STi) 2005 for head work - that is what the build followed** · GENUINE COSWORTH V25B STi head. Casting RESOLVED 2026-08-20 - V25B specifically - corroborates cooling-system-notes.md V25B casting mark. Which side (LH/RH) not recorded |
| ✅ | Cylinder head - other side | OEM ported to match | OEM head | OEM head PORTED TO MATCH the Cosworth side. This is why flows were matched - it was a matching exercise not a matched pair |
| ✅ | Head gaskets | Subaru OEM | OEM | OEM head gaskets. Sound pairing with ARP studs - factory multi-layer gaskets are well regarded and the studs provide the clamp |
| ✅ | Head machining - valve spring seats |  | OEM seats | VALVE SPRING SEATS MODIFIED (deeper) to accept taller Manley springs and allow more lift. DECK SURFACE NOT MILLED - so compression stays at the 8.5:1 from the Manley dish pistons and cam timing geometry is unchanged |
| ✅ | Head porting | Cosworth Port + polish + flow matched | OEM ports | **FSM: Use ME(STi) 2005 for head work - that is what the build followed** · Flows matched between banks. Shop/who performed NOT RECORDED |
| ✅ | Head studs | ARP | OEM TTY head bolts | ARP STUDS CONFIRMED 2026-08-20. Resolves the main reliability concern at 500whp on E85 - OEM TTY bolts are the known weak point for head lift. Exact ARP kit PN not recorded |
| ✅ | Valve retainers | Cosworth PR7561 | OEM retainers | Titanium. Note: mixed with Manley springs - confirm they were fitted as a matched combination |
| ✅ | Valve springs | Manley 22180-16 | OEM springs | Spring seats machined deeper to accept them |
| ✅ | Valve stem seals | NEW - brand not recorded | OEM seals | NEW SEALS FITTED FOR THIS BUILD - confirmed 2026-08-20. Brand/PN not recorded (teardown-gated) but the fact they are new is the part that matters |
| ⚠️ | Valves | Oversized - brand TBD | OEM valves | OVERSIZED - believed +1mm (recollection |

## Oiling · Binder TAB 2 · recorded spend $98.40

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | AVCS banjo bolt RH - SHORTENED 4mm | Subaru OEM, modified |  | *[fabricate]* **FSM: Not a stock-length fastener** · MODIFIED PART: shortened 4mm to suit the HEL fitting, which is 4mm shorter than OEM. Do NOT replace with a stock-length bolt - it will bottom before clamping the banjo. CPU-84 |
| ✅ | AVCS oil feed line LH (driver) | Subaru OEM | OEM oil pipe LH | OEM line retained. Mixed on purpose - OEM driver side, HEL braided passenger side |
| ✅ | AVCS oil feed line RH (passenger) | HEL HEL-OF34 stainless braided | OEM oil pipe RH | PURCHASED - kit is a pair, one used. Line fitted; BANJO BOLT STILL NEEDS SHORTENING 4mm because the HEL fitting is 4mm shorter than OEM. See CPU-84 |
| ✅ | Air-oil separator | IAG Street Series V2 | Entire OEM PCV system | **FSM: LU PCV content void; all OEM PCV hoses removed** · USED great condition w/ all lines; drain per interval; cap PCV portions of 21141AA131 |
| ✅ | Breather hose - crank port to Y fitting | 3/4in ID |  | *[to-buy]* Crank breather port -> OEM plastic Y fitting -> IAG AOS. MUST be oil-resistant: NBR/nitrile or fluorosilicone-lined. NOT plain silicone - it swells in oil vapour. Measure the run AFTER the turbo is mounted. CPU-38 |
| ✅ | Heat sleeve | DEI 1in ID | n/a new | *[in-stock]* IN HAND 2026-08-21, 1in ID - supersedes the 5/8in figure previously recorded. Clears the 5/8in ID turbo oil drain comfortably. CHECK the 3/4in ID breather hose: its OD can reach 1in, which would be a marginal fit. For AOS and turbo lines near the header/uppipe |
| ✅ | Oil dipstick tube | Subaru OEM STI/J3 |  | Tube only - verify dipstick rod separately |
| ✅ | Oil drain T-fitting | TBD | n/a new | *[to-buy]* Merges turbo oil drain + IAG AOS drain into one return |
| ✅ | Oil filler neck | Subaru OEM J3 | OEM | 02-07 WRX/STI |
| ✅ | Oil pan | IAG | OEM pan | **FSM: Changes oil capacity - measure and record** |
| ✅ | Oil pickup tube | IAG | Moroso unit | Moroso didn't fit the IAG pan |
| ✅ | Oil pressure sender | remote | OEM switch location | Firewall mounted 2026-08-20; torque 25 Nm; THREE BOND 1324 |
| ✅ | Turbo oil DRAIN line | IAG 5/8in ID - IAG stainless braided -10AN | OEM drain | *[to-buy]* 5/8in ID confirmed 2026-08-21. -10AN is the matching AN size. Needs continuous fall to the pan - CPU-32 |
| ✅ | Turbo oil supply line | Forced Performance FP Turbo Oil Supply Line - EJ | OEM feed line | Stainless braided; brand-matched to FP Red |
| ✅ | Y breather fitting | Subaru OEM |  | *[in-stock]* For the IAG AOS install. Fit AFTER the turbo is in - it is in the way otherwise |

## Cooling · Binder TAB 3

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Coolant | Asian-formula - local store GREEN preferred (matches OEM era) |  | *[to-buy]* PLAN 2026-08-20: Asian-class from a local store |
| ✅ | Coolant bypass pipe | Subaru OEM 14065AA250 | OEM | 04 WRX / 04-05 STi. Runs under/behind the intake manifold to the water pump inlet |
| ✅ | Coolant crossover pipe (front) | Subaru OEM 14050AA451 | OEM | 04 WRX pipe - supersedes AA450. Physically verified to fit EJ257 + STi manifold |
| ❓ | Coolant hose kit | Roger Clark Motorsport / Samco V8 12-hose kit 02-05 WRX/STI | OEM hoses | *[verify-existing]* Covers Modine + turbo coolant hoses. Alan believes the silicone lines are all on hand - CONFIRM |
| ✅ | Cooling fans + shrouds | Subaru OEM | OEM fans | OEM fans and shrouds retained. CONFIRMED 2026-08-20: OEM shroud mounts directly to the Mishimoto MMRAD-WRX-01. Fan control still to be wired to the Link (CPU-46) |
| ✅ | Engine coolant filler tank (ECFT) | Mishimoto | OEM plastic ECFT | MISHIMOTO ECFT - confirmed 2026-08-20. Aluminium; replaces the OEM plastic tank (a known age/heat failure point). The ECFT is the small high-mounted reservoir serving as the system HIGH POINT - the turbo sits above the radiator filler neck so filling and bleeding both happen here. Pairs with the Mishimoto radiator |
| ✅ | Radiator | Mishimoto MMRAD-WRX-01 Performance Aluminum | OEM radiator | 2-row 1.65in thick full aluminium brazed core. Fits 01-07 WRX/STi MANUAL. Inlet/outlet 1.5in. INCLUDES TWO 1.3 BAR CAPS - one-way for the radiator and two-way for the ECFT; NOT interchangeable. 1.3 bar is well above OEM ~0.9 bar - fine here because the ECFT is the aluminium Mishimoto not the OEM plastic tank |
| ✅ | Radiator caps (x2) | Mishimoto 1.3 bar - supplied with MMRAD-WRX-01 | OEM caps | ONE-WAY cap on the radiator / TWO-WAY cap on the ECFT. Fitting them backwards stops the system drawing coolant back on cooldown or relieving properly |
| ⚠️ | Radiator hoses | Mishimoto Silicone upper + lower | OEM hoses | Already owned |
| ✅ | Upper pipe assembly (Pipe-Water Tank) | Subaru OEM 21141AA131 | OEM 21141AA122 | 06-14 era - matches V25 head PCV port layout. PCV portions to be CAPPED (IAG AOS replaces OEM PCV); only the ECFT-to-bypass coolant passage is used |
| ✅ | Water pump + thermostat | Roger Clark Motorsport Black Series 3-Port | OEM water pump/thermostat | Cast impeller + 70C low-temp thermostat; 3-Port USDM manual |

## Turbo · Induction · Exhaust · Binder TAB 3 · recorded spend $2,301.00

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Anti-seize - exhaust | Nickel-based |  | *[in-stock]* Used on the header nuts. Nickel not copper - holds up past header flange temperatures |
| ❓ | BOV adapter | TBD |  | *[undecided]* Sheet says not needed if going bung-to-hose direct - depends on final BOV choice |
| ❓ | Blow-off valve | TBD | OEM BPV | *[undecided]* NOT DECIDED. Build sheet records a leaning toward pure-recirc hose-mount (Turbosmart/GFB/Forge) but Alan confirms not final. Must hold 30+ psi. See CPU-36 |
| ⚠️ | Boost control solenoid (EBCS) | GrimmSpeed (believed) 3-port |  | **FSM: Factory 2-port EBCS content VOID** · 3-port on EXTERNAL gate. Confirm brand/PN and Link output frequency with tuner |
| ✅ | Cat-back exhaust | XForce E4-SW05-MP01-CBS | OEM cat-back | **FSM: EX section largely void aft of the turbo** · 3in diameter throughout - ALL EXHAUST JOINTS ARE 3in so no reducers needed. Includes the midpipe. RAW 409 STAINLESS - will surface-rust cosmetically (not 304). Centre hot-dog resonator + oval rear muffler. Twin 80mm tips. WRX/STI MANUAL ONLY. XForce note: some setups need an E4-SW05-C1 connecting pipe when running a standalone cat |
| ✅ | Cold air intake | AEM 21-474 | OEM airbox | PN CORRECTED 2026-08-20 (sheet said 21-477). Listed for 02-05 WRX not STI but TEST FITTED OK. Filter relocates outside engine bay. Mates to FP 84mm inlet via silicone reducing coupler |
| ⚠️ | Downpipe | UNKNOWN brand | OEM downpipe | **FSM: EX + EC sections void aft of turbo; no rear O2 / no cat monitoring** · CATLESS - confirmed 2026-08-20. 3in matching the cat-back. BRAND NOT RECORDED - check the part itself. Turbo-to-downpipe hardware in stock. Relevant to CPU-74 registration/inspection |
| ✅ | Exhaust gaskets - most joints | Subaru OEM / aftermarket | OEM gaskets | NEW gaskets used at the header 2026-08-20 |
| ✅ | Exhaust manifold nuts (x6) | Subaru OEM 902370029 |  | **FSM: T3 = 35 N.m (26 ft-lb) per EX(H4DOTC)-4 STI model** · NEW, set of 6 from the dealer. Fitted 2026-08-20 with NICKEL anti-seize onto the reused OEM cylinder head studs. Perrin spec governs if it differs from OEM 35 N.m |
| ✅ | Exhaust manifold studs (EXISTING REUSED) | Subaru OEM 800910550 (10x41) or 800910680 if ever needed |  | **FSM: STI exploded view EX(H4DOTC)-4** · OEM studs in the CYLINDER HEADS, reused - none purchased. Two PNs seen for replacements, MEASURE before ordering |
| ❓ | Gasket - turbo to downpipe | TBD | OEM gasket | *[verify-existing]* NOT CONFIRMED - check stock. Match to the actual FP Red turbine outlet flange before ordering; a stock-location turbo usually takes the OEM 02-07 WRX/STI gasket but verify against the housing |
| ✅ | Header | Perrin Equal Length | OEM manifold | 304SS welded merge 4-2-1; 14pct larger primaries; 2-4 track seasons |
| ✅ | Header bung plug + crush washer | M18 x 1.5 |  | *[to-buy]* Crush washer IN TRANSIT 2026-08-21. Plug the Perrin ELH bung BEFORE the uppipe goes on - CPU-20 |
| ✅ | Intercooler | APS D/R 725 FMIC | OEM TMIC | **FSM: IN TMIC content void; hood scoop freed** · Core 28x9.5x4.5 bar-and-plate |
| ✅ | Midpipe | XForce part of E4-SW05-MP01-CBS | OEM midpipe | INCLUDED IN THE XFORCE CAT-BACK - not a separate part. The downpipe-to-midpipe joint is therefore downpipe-to-catback |
| ✅ | TGV deletes | IAG | OEM TGVs | **FSM: IN TGV content void** · IAG TGV deletes. Bought used. Holes drilled slightly to bolt to the intake manifold |
| ✅ | Turbo inlet | Forced Performance FP 8005010A 84mm | OEM inlet | 84mm silicone; fits FP 84mm FAP cover; has recirc return bung + Mishimoto BPV recirc hose |
| ✅ | Turbocharger | Forced Performance FP STi Red HTZ R690701874 | OEM VF-series | USED. HTZ variant - older proven design w/ journal-bearing option; CONFIRM bearing type for oil restrictor sizing |
| ✅ | Uppipe | PLM 38mm EWG | OEM uppipe | Bundle price with wastegate; 2-bolt flange matches Perrin collector |
| ✅ | Wastegate | TiAL MVS 38mm | OEM internal WG | Spring pressure UNKNOWN - record when fitted |
| ✅ | Wastegate spring stack | TiAL Black + Blue = 1.2 bar / 17.4 psi |  | *[in-stock]* **FSM: Sets MINIMUM boost - cannot run below this** · QUEUED to install. This is the boost FLOOR. See BOOST FLOOR note - reconsider for break-in |

## Fuel System · Binder TAB 4 · recorded spend $60.00

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | FPR / flex bracket | Custom | Washer bottle location | *[fabricate]* Washer system deleted |
| ✅ | Fuel filter | DeatschWerks 8-03-110-010K-6 | OEM filter | 10 micron; -6AN ports (NOT -010K-8) |
| ✅ | Fuel lines | Red Horse 235 series -6AN 15ft | OEM hard/soft lines | *[to-buy]* ECO+FKM E85-safe liner; SS under-braid + nylon jacket |
| ✅ | Fuel pressure regulator | Aeromotive 15633 | OEM FPR | Plus Aeromotive gauge 40.90 |
| ✅ | Fuel pump | DeatschWerks DW400 9-401-1041 | OEM pump | **FSM: FU pump content void; FPCM bypassed** · 415 LPH BRUSHED motor (not brushless); see fuel-pump-isolator-notes.md |
| ✅ | Fuel pump hardwire kit | DeatschWerks FPHWK-10-HD | OEM pump wiring | High-current 10 AWG heavy duty relay kit battery-direct |
| ✅ | Fuel rails | Aeromotive AER14134 | OEM rails | CONFLICT RESOLVED 2026-08-20: the 20-21 wagon sheet listed an "Early IAG fuel rail" - that is WRONG, it is Aeromotive. Confirm port thread (ORB size) before ordering -6AN adapters |
| ✅ | Injectors | DeatschWerks DW1500 16M-07-1500-4 | OEM injectors | Set of 4; sized per tuner for 500whp E85 |

## Engine Management · Electrical · Binder TAB 7 · recorded spend $7,840.62

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | AFR gauge | Innovate MTX-L |  | Separate from CAN Lambda |
| ✅ | Alternator | Michael Singer 200A / 220A peak - 128.5mm Denso hairpin 6-phase | OEM 90A 23700AA430 | *[in-stock]* **FSM: OEM 90A charging specs VOID - 150A at idle, 14.8V regulator** · IN HAND 2026-08-21, not yet mounted. Denso case, direct replacement for OEM 23700AA430. Mounting bolts NOT YET LOCATED - FSM spec 25 N.m per SC(H4SO)-15 |
| ❓ | Alternator mounting bolts | Subaru OEM PN not recorded |  | *[verify-existing]* **FSM: Generator install torque 25 N.m per SC(H4SO)-15** · NOT YET LOCATED 2026-08-21. Singer unit is a Denso-case direct replacement for 23700AA430, so OEM bolts should suit - CONFIRM boss thickness matches before torquing |
| ✅ | Battery | Interstate MTX-35 AGM Group 35 | OEM battery | ENGINE BAY - OEM LOCATION (corrected 2026-08-20; was wrongly recorded as relocated to rear) |
| ✅ | Battery tray | Custom 3D print ASA | OEM tray 82122AA031/032 | Engine bay. Cavity 236x182mm. Integrated platform for 2x Blue Sea 5001 MEGA fuse holders. Retains stock J-hook strap clamp |
| ✅ | Belt - A/C | Bando or Mitsuboshi 4PK895 (352K4) | OEM belt | *[to-buy]* REAR belt (crank > A/C > idler). 4 ribs 895mm. Subaru OEM equiv 73323AC000. Tension 350-450 N |
| ✅ | Belt - alternator + power steering | Bando or Mitsuboshi 5PK875 (344K5) | OEM belt | *[to-buy]* FRONT belt. 5 ribs 875mm. Gates equiv K050345. Tension 490-640 N. Alternator is its own tensioner |
| ✅ | Big 3 wiring upgrade | Knukonceptz / Stinger / Sky High 1/0 AWG OFC 3-cable kit | OEM charging cables | *[to-buy]*  |
| ✅ | CRUISE CONTROL | NOT FITTED | OEM cruise control | *[not-fitted]* **FSM: CC sections VOID** · iWire invoice line reads NO CRUISE - deliberately not wired during the harness merge |
| ⚠️ | Cam position sensor | Aftermarket - brand TBD |  | **FSM: T1 6.4 N.m per FU(H4DOTC)-7** · NEW but NOT OEM. SINGLE AVCS - confirm sensor count vs FSM dual-AVCS figures |
| ⚠️ | Coolant temp sensor (ECT) |  |  | NEW. Brand/PN not recorded |
| ⚠️ | Crank position sensor | Aftermarket - brand TBD |  | **FSM: T1 6.4 N.m per FU(H4DOTC)-7** · NEW but NOT OEM. Brand/PN not recorded - confirm |
| ✅ | DBW pedal | Subaru 36010FE020 |  | 05 STi drive-by-wire |
| ✅ | DBW pedal adapter plate | iWire |  | Needed to fit the 05 STi DBW pedal to the 04 chassis |
| ✅ | DCCD G sensor mount | DCCDPro |  | Accelerometer mount for DCCDPro automatic modes - no charge |
| ✅ | DCCD Spiider PnP kit | iWire w/ STi cluster |  | THE HARNESS KIT connecting the DCCDPro - a separate part from the controller. Source of the 'Spiider' name |
| ✅ | DCCD cluster jumper | iWire |  | Feeds the factory cluster DCCD display |
| ✅ | DCCD controller | DCCDPro with cluster output | OEM DCCD control electronics | **FSM: CS Control Systems describes factory control logic - superseded. Mechanical centre diff content still applies** · THE CONTROLLER. RETAINS THE FACTORY DCCD KNOB AND CLUSTER DISPLAY - 'with cluster output' plus the cluster jumper drive the factory readout. Adds automatic G-sensor modes on top. Functional test at commissioning |
| ✅ | ECU | Link Engine Management WRXLink WRX104X (224-4000) | OEM ECU 22611AJ242 | **FSM: ALL OEM ECU / OBD-II / immobilizer sections VOID** · Per invoice AS-0003 (2026-05-29). Installed INTO THE FACTORY ECU ENCLOSURE. Bench-activated with base map loaded READY TO RUN |
| ✅ | Engine harness | Subaru 2005 STi | 04 GG body harness | **FSM: WI diagrams do not describe this car** · Merged by iWire |
| ✅ | Flex fuel QD adapters | Russell / Earl's 3/8in QD to -6AN x2 | n/a new | *[to-buy]*  |
| ✅ | Flex fuel sensor | Continental PPA-IGF35 / GM 13577429 | n/a new | *[to-buy]* Ethanol content sensor; bench-tested; mounts on new FPR bracket |
| ✅ | Flex fuel sensor adapter | iWire rear O2 plug to Continental fuel sensor plug | OEM rear O2 sensor | **FSM: Rear O2 circuit repurposed for flex fuel** · Lets the flex sensor use the existing rear O2 circuit. B19 4-pin gray |
| ✅ | Flex sensor bracket | DIY 3D-printed ASA black | n/a new | *[fabricate]* M6 brass heat-set inserts |
| ⚠️ | Fuse - alternator / Big 3 charge cable | 250A |  | *[to-buy]* **FSM: Protects the 1/0 B+ run - MANDATORY** · NOT in stock. FORM FACTOR CONFLICT: grounding notes say 250-300A ANL, tray was designed for MEGA holders. Tray wins - buy MEGA |
| ⚠️ | Fuse - audio amp power cable | amperage TBD |  | *[to-buy]* NOT in stock. Size to the Boss R1100M + RF P400-4 power run. MEGA form factor to match holder |
| ✅ | Gauge cluster | Subaru 07 STi with OAT | 04 WRX cluster | **FSM: Print IDI from 2007 manual not 2004** · 07 STi cluster WITH outside air temp. iWire performed the swap (inv 5304) |
| ✅ | Gauge harness - 10P Mini UMNL2 plug | TE / Mouser 794196-1 |  | qty 2 |
| ✅ | Gauge harness - 4pos micro MNL top latch | TE / Mouser 2008571-4 |  | qty 1, black |
| ✅ | Gauge harness - header 10pos R/A dual row | TE / Mouser 1-770971-0 |  | Custom gauge harness BOM - qty 2 |
| ✅ | Gauge harness - header assy 4pos R/A | TE / Mouser 2-1445055-4 |  | qty 1 |
| ✅ | Gauge harness - micro MNL header single row | TE / Mouser 2-1445055-5 |  | qty 1 |
| ✅ | Gauge harness - pin contact 20-16 AWG | TE / Mouser 794230-1 |  | qty 35 |
| ✅ | Gauge harness - receptacle single row 5P | TE / Mouser 1445022-5 |  | qty 1 |
| ✅ | Gauge harness - socket contact 20-16 AWG | TE / Mouser 794231-1 |  | qty 35 |
| ✅ | Gauge harness - wire + PCBs | 16 AWG + XLPE |  | Also used: gauge harness PCBs, driver-side wheel well clips |
| ⚠️ | Gauges | Prosport boost/fuel/oil/volt |  |  |
| ✅ | Harness merge | iWire |  | Includes the DCCD controller and VSS Pro |
| ✅ | Ignition coils | NGK | OEM coils | Brand-matched to ILTR7L8R plugs |
| ✅ | Knock sensor | Subaru OEM |  | *[in-stock]* **FSM: FU(H4DOTC)-34: 24 N.m, cord exit 60 deg to engine rear** · NEW, on hand, NOT yet installed. Install before intake manifold goes on. CPU-82 |
| ✅ | Link CAN cable | Link Engine Management CANJST 5-pin 101-0197 |  |  |
| ✅ | Link XSL expansion loom | Link Engine Management 101-0106 |  | Terminated with a DTM06-8S connector by BW Tuning |
| ⚠️ | MAF sensor | Hitachi OE / Subaru OEM 22680AA380 / 22680AA38A |  | *[to-buy]* RETAINED for IAT element in speed density mode - verify exact PN |
| ✅ | MAP sensor | Omni Power MAP-STI-4BR | OEM 2.5-bar Denso | 4-bar; cal 11.97 psia/V +0.506 offset |
| ⚠️ | MEGA fuse holders (x2) | Blue Sea 5001-style |  | *[in-stock]* **FSM: n/a new capability** · Mount on the 3D-printed battery tray fuse platform (108x82mm cantilever, M8 studs). Fuse 1 alternator/Big 3, Fuse 2 audio amp |
| ✅ | Oil pressure sensor | Prosport 0-100 PSI 1/8in NPT 0.5-4.5V | OEM switch | 24in hose w/ M18x1.5 galley adapter - confirms galley + header bung thread |
| ✅ | Pressure sensors (x2) | LDM 8990150-0-150 - 0-150 psi standard | n/a new | TWO supplied on invoice AS-0003 - resolves the 'TBD per Ben' entries for BOTH fuel and oil pressure |
| ✅ | Spark plugs | NGK ILTR7L8R | OEM plugs | One heat range colder for E85 at 500whp |
| ✅ | TGV-to-pressure-sensor harness (x2) | BW Tuning custom expansion harness |  | Uses the vacated TGV locations for the pressure sensors |
| ✅ | Turbo-trans to DCCD-trans adapter | iWire |  | No charge |
| ✅ | VSS | iWire VSS Pro |  | Speedo correction for 6MT |
| ✅ | Wideband | Link Engine Management CAN Lambda 125-1000 | OEM front O2 | Post-turbo bung |
| ✅ | Wideband O2 sensor | Bosch LSU 4.9 | OEM front O2 | *[to-buy]* For Link CAN Lambda |

## Drivetrain · Binder TAB 4 · recorded spend $4,068.03

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Clutch | ACT Stage 2 - HD Performance Street | OEM | Stage 2 kit; supplied the throwout bearing |
| ✅ | Clutch actuation | Subaru 2004 pedal/MC/hard pipe/slave |  | Both pull type 1.7 ratio 130-135mm; fork came with the 2011 6MT so is 6MT spec |
| ✅ | Clutch line | Subaru 2004 WRX STOCK |  | Stock rubber line retained. Part of the 2004 5MT actuation set feeding the 6MT |
| ✅ | Clutch release fork | Subaru 2011 STi 6MT OEM | 5MT fork | CONFIRMED 2026-08-20: came off the 2011 6MT swap. Completes an internally-consistent 6MT release stack - 6MT flywheel + 6MT clutch + 6MT fork + 6MT bearing |
| ✅ | Differential CV axle seal | Subaru OEM 806732200 |  | Purchased x2 |
| ⚠️ | Driveshaft | Hybrid 07 STi + wagon | OEM | Assembled from forum research; length and splines verified |
| ✅ | Engine mounts | Torque Solution | OEM | **FSM: TS torque spec governs over FSM** |
| ✅ | Flywheel | Subaru Conventional 6MT donor | 5MT flexible flywheel | INSTALLED AND COMPLETE confirmed 2026-08-20. OEM 6MT conventional - NOT the ACT/Fidanza/Exedy options still listed on the build sheet. Not interchangeable with 5MT flexible type |
| ⚠️ | Front CV axle (new) | 667360 |  | Mixed new/used/refurb axle set across 2011 trans + R180 + 05-07 STi hubs. Fitment reported OK |
| ⚠️ | Front CV axle (refurbished) | PN not recorded |  | Refurb unit - brand/PN unknown |
| ⚠️ | Gasket kit |  |  | Contents not itemised in the source sheet |
| ✅ | Pitch stop mount | Perrin Red N2 polyurethane | OEM pitch stop | Billet body; 90a + 70a bushings |
| ⚠️ | Rear CV axle (new) | 667373 |  | Mixed axle set - fitment reported OK |
| ⚠️ | Rear CV axle (used) | PN not recorded |  | Used unit - brand/PN unknown |
| ✅ | Rear differential | Subaru R180 | R160 | Came with trans - ratios match |
| ✅ | Shifter + linkage | Subaru 2004 WRX STOCK |  | **FSM: 2004 shifter operates the 2011 6MT** · Connected and working |
| ✅ | Throwout bearing | ACT supplied in the Stage 2 clutch kit |  | 6MT-spec, came with the ACT kit. NOTE: the release FORK origin is still unknown - see clutch fork row |
| ✅ | Transmission | Subaru 2011 STi 6MT DCCD | 04 WRX 5MT | **FSM: Trans fluid = 2011 spec NOT 2004** · 97k miles at install; bundle |
| ⚠️ | Transmission CV axle seal (A) | Subaru OEM 806735300 |  | TWO different trans CV seal PNs on this build - confirm which side takes which |
| ⚠️ | Transmission CV axle seal (B) | Subaru OEM 806735290 |  | TWO different trans CV seal PNs on this build - confirm which side takes which |
| ✅ | Transmission crossmember | Subaru 2004 WRX - ORIGINAL CHASSIS |  | **FSM: 2004 crossmember carries the 2011 6MT** · Chassis crossmember RETAINED with the 6MT mount |
| ✅ | Transmission mount | Subaru 2011 STi 6MT |  | Came with the 6MT |

## Brakes · Binder TAB 5 · recorded spend $526.88

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Brake cover disk (dust shield) | Subaru OEM 26290FE020 |  | FE prefix = GD-era |
| ✅ | Brake lines | StopTech Stainless | OEM rubber | Front 59.66 rear 65.55 |
| ⚠️ | Brake pads | Hawk Performance compound TBD |  | Compound NOT yet identified - PN is printed on the pad backing plate and the box. Fronts are 4-pot, rears 2-pot (2007 WRX Limited) |
| ✅ | Brembo upgrade | Brembo 04-07 STI | 4/2-pot calipers | *[planned]* GD-era NOT 08-14 - knuckles are 05-07 STi |
| ✅ | Front calipers | Subaru 2007 WRX Limited 4-pot | 02-05 single-pot slider | **FSM: Print BR from 2007 manual** · Included pads and hardware |
| ✅ | Front rotors | KNS / DBA KNS4651 | OEM rotors | Std WRX size; enlarged centre bore; dual-drilled 5x100/5x114.3 |
| ✅ | Parking brake cables | Subaru 2004 WRX - ORIGINAL CHASSIS CABLES |  | **FSM: 2004 cables work with 05-07 STi rear knuckles - no swap needed** · VERIFIED HOLDING on the KNS rear discs. Despite the STi knuckle swap the chassis cables fit and function |
| ✅ | Rear calipers | Subaru 2007 WRX Limited 2-pot | 02-05 single-pot |  |
| ✅ | Rear rotors | KNS / DBA KNS4656 | OEM rotors | 06-07 WRX OD with R180 STi parking brake drum |

## Suspension · Chassis · Binder TAB 6 · recorded spend $1,308.13

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ⚠️ | Coilovers | BC Racing BR series | OEM struts/springs | **FSM: OEM strut/spring FSM pages void** · PN F-02-BR vs F-03-BR UNKNOWN; camber plates built in; stock rates 8kg/mm F 6kg/mm R |
| ✅ | DO NOT ORDER - hub gasket | Subaru 28015AA1108A |  | *[not-fitted]* DID NOT FIT. Recorded so it is not reordered |
| ⚠️ | Front ball joint | Subaru 20206AJ000 | OEM | Generic GD-era - verify taper seats in STi housing |
| ✅ | Front knuckles | Subaru 28313FE060 | 04 WRX knuckles | **FSM: Print FS from 2005/2007 not 2004** · 05-07 STi; chosen to preserve GD geometry; gives 5x114.3 |
| ✅ | Front wheel bearing | Subaru 28373FE000 | OEM |  |
| ✅ | Lateral link bushing | Subaru OEM 20251AA000 |  | **FSM: Re-torque at RIDE HEIGHT** |
| ✅ | Lateral links | Subaru Wagon non-STi RETAINED |  | **FSM: Use Wagon/Except-STi torque values** · STi knuckles on wagon links - rear camber NOT factory adjustable |
| ⚠️ | Left rear hub large bolt | Subaru OEM PN not recorded |  |  |
| ⚠️ | PS pump rebuild kit | Nelson Seals / Gates FKM Viton kit or Gates 348827 |  | *[to-buy]* Likely needed |
| ⚠️ | Power steering pump | Subaru OEM 34430-FE040 |  | Multiple pumps on hand - inspect to pick best; same PN across 04-07 turbo EJ |
| ✅ | Rear hub LH | Subaru 05-07 STi |  |  |
| ✅ | Rear hub RH | Subaru 05-07 STi |  |  |
| ⚠️ | Rear hub gaskets |  |  |  |
| ✅ | Rear knuckles | Subaru 05-07 STi both sides | 04 GG wagon knuckles | L 184.32 R 233.32 |
| ✅ | Rear wheel bearing (LH replacement) | Duralast DL516003 |  |  |
| ✅ | Stabilizer bars | Subaru Wagon |  | **FSM: Use Wagon/Except-STi torque values** · Wagon bars confirmed 2026-08-20; front 20mm rear 17mm vs STi 19/20 |
| ✅ | Steering column bushing | Subaru OEM 34361FC000 |  |  |
| ✅ | Steering rack | Subaru 2004 WRX STOCK |  | Original chassis rack retained |
| ⚠️ | Tires | PLACEHOLDER |  | Temporary - Alan: BS tires for now. Size not recorded. NOTE: rolling diameter feeds speedo calibration - recheck VSS/cluster (CPU-71) if tire size changes |
| ❓ | Wheel clearance for Brembo upgrade |  |  | *[undecided]* OPEN: do these wheels clear 326mm 04-07 STi Brembos? Clearing the current ~294mm setup does NOT confirm it. 32mm larger rotor and barrel shape matters as much as diameter - many 17in OEM wheels foul a Brembo caliper. VERIFY BEFORE BUYING CALIPERS |
| ⚠️ | Wheels | Subaru OEM (believed) year/model UNKNOWN | OEM wheels | Black. Believed OEM Subaru from a WRX. Bought cheap. CONFIRMED: clear the current hub + brake config (4/2-pot + ~294mm KNS rotors). UNKNOWN: diameter / width / offset / source year. 5x114.3 so likely 05-07 STi or 08+ WRX/STi. ID METHOD: spec is stamped or cast on the inner barrel or behind a spoke - look for 17x7 JJ + ET offset + Subaru PN |

## Fluids & Capacities

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Brake + clutch fluid | ATE Typ 200 DOT 4 |  | *[in-stock]* Brake system 500 mL, clutch 70 mL - SEPARATE circuits, each needs its own bleed. 1 L covers both with margin. CPU-53 + CPU-78 | IN HAND 2026-08-21, FCP Euro | FCP Euro lifetime replacement guarantee may cover refills - KEEP THE ORDER RECORDS |
| ✅ | Engine oil - break-in | Motul Break-In 10W-40 (108080) |  | *[in-stock]* Capacity is NOT the OEM figure - the IAG pan changes it. Fill to the dipstick and MEASURE. CPU-49 | IN HAND 2026-08-21, FCP Euro | FCP Euro lifetime replacement guarantee may cover refills - KEEP THE ORDER RECORDS |
| ⚠️ | Engine oil - synthetic | Motul 300V Competition 5W-40 (110817) |  | *[to-buy]* From 750 mi. HTHS 4.0. CPU-49 |
| ✅ | Gear oil - rear diff R180 | Motul Gear 300 75W-90 (105777) |  | *[in-stock]* 1.0 L / 1.1 qt - STi column. NOT 0.8 L, that is the R160. Torsen: NO friction modifier. CPU-51 | IN HAND 2026-08-21, FCP Euro | FCP Euro lifetime replacement guarantee may cover refills - KEEP THE ORDER RECORDS |
| ✅ | Gear oil - trans + centre diff + DCCD | Motul Gear 300 75W-90 (105777) |  | *[in-stock]* 4.1 L / 4.3 qt. ONE fill serves transmission + FRONT diff + DCCD - shared sump. CPU-50 | IN HAND 2026-08-21, FCP Euro | FCP Euro lifetime replacement guarantee may cover refills - KEEP THE ORDER RECORDS |
| ⚠️ | Power steering fluid | Dexron III ATF |  | *[to-buy]* 0.7 L / 0.7 qt. Subaru PS spec is Dexron ATF. CPU-54 |

## Assembly Tools (not on the car) · recorded spend $73.72

| ✓ | Part | Brand / Model / PN | Supersedes | Notes |
|:-:|---|---|---|---|
| ✅ | Clutch alignment tool | 3D printed Subaru Clutch Alignment Tool - 267427 |  | *[in-stock]* In 3D Prints/ |
| ✅ | Piston ring compressor | Company 23 |  | *[in-stock]*  |
| ✅ | Plastigage PL-X 0.018-0.045mm white |  |  | *[in-stock]* Bearing clearance check |
| ✅ | Seal puller |  |  | *[in-stock]*  |

---

## Wear & consumable items — track maintenance view

| Item | Interval | System |
|---|---|---|
| Front calipers (Subaru) | Piston/boot check | brakes |
| Front rotors (KNS / DBA) | Thickness per event | brakes |
| Rear rotors (KNS / DBA) | Thickness per event | brakes |
| Brake pads (Hawk Performance) | Track: inspect every event | brakes |
| Wideband (Link Engine Management) | Sensor service life | ecu-electrical |
| Wideband O2 sensor (Bosch) | Sensor service life | ecu-electrical |
| Oil filters (Wix) | Every oil change | engine-lower |
| Drain plug crush washers (Subaru OEM) | Every oil change | engine-lower |
| Gear oil - trans + centre diff + DCCD (Motul) | Track: inspect each event | fluids |
| Brake + clutch fluid (ATE) | Flush per track season | fluids |
| Engine oil - synthetic (Motul) | OCI 1200-1500 mi on E85 | fluids |
| Turbocharger (Forced Performance) | Shaft play periodic | induction |
| Header (Perrin) | Annual collector inspection | induction |
| Air-oil separator (IAG) | Drain per interval | oiling |

---

## Not installed — spares / sell

| Part | Brand / Model | Status | Notes |
|---|---|---|---|
| ECU | Subaru 22611AJ242 | sell | 04 STi - superseded by Link |
| Clutch fork + throwout | Subaru 5MT | spare | MUST NOT be used with 6MT |

---

## Open items — needs confirmation

- [ ] ❓ **Coolant hose kit** (cooling) — Covers Modine + turbo coolant hoses. Alan believes the silicone lines are all on hand - CONFIRM
- [ ] ❓ **Alternator mounting bolts** (ecu-electrical) — NOT YET LOCATED 2026-08-21. Singer unit is a Denso-case direct replacement for 23700AA430, so OEM bolts should suit - CONFIRM boss thickness matches before torquing
- [ ] ❓ **Blow-off valve** (induction) — NOT DECIDED. Build sheet records a leaning toward pure-recirc hose-mount (Turbosmart/GFB/Forge) but Alan confirms not final. Must hold 30+ psi. See CPU-36
- [ ] ❓ **BOV adapter** (induction) — Sheet says not needed if going bung-to-hose direct - depends on final BOV choice
- [ ] ❓ **Gasket - turbo to downpipe** (induction) — NOT CONFIRMED - check stock. Match to the actual FP Red turbine outlet flange before ordering; a stock-location turbo usually takes the OEM 02-07 WRX/STI gasket but verify against the housing
- [ ] ❓ **Wheel clearance for Brembo upgrade** (suspension) — OPEN: do these wheels clear 326mm 04-07 STi Brembos? Clearing the current ~294mm setup does NOT confirm it. 32mm larger rotor and barrel shape matters as much as diameter - many 17in OEM wheels foul a Brembo caliper. VERIFY BEFORE BUYING CALIPERS
- [ ] ⚠️ **Brake pads** (brakes) — Compound NOT yet identified - PN is printed on the pad backing plate and the box. Fronts are 4-pot, rears 2-pot (2007 WRX Limited)
- [ ] ⚠️ **Radiator hoses** (cooling) — Already owned
- [ ] ⚠️ **Driveshaft** (drivetrain) — Assembled from forum research; length and splines verified
- [ ] ⚠️ **Front CV axle (new)** (drivetrain) — Mixed new/used/refurb axle set across 2011 trans + R180 + 05-07 STi hubs. Fitment reported OK
- [ ] ⚠️ **Rear CV axle (new)** (drivetrain) — Mixed axle set - fitment reported OK
- [ ] ⚠️ **Front CV axle (refurbished)** (drivetrain) — Refurb unit - brand/PN unknown
- [ ] ⚠️ **Rear CV axle (used)** (drivetrain) — Used unit - brand/PN unknown
- [ ] ⚠️ **Transmission CV axle seal (A)** (drivetrain) — TWO different trans CV seal PNs on this build - confirm which side takes which
- [ ] ⚠️ **Transmission CV axle seal (B)** (drivetrain) — TWO different trans CV seal PNs on this build - confirm which side takes which
- [ ] ⚠️ **Gasket kit** (drivetrain) — Contents not itemised in the source sheet
- [ ] ⚠️ **Gauges** (ecu-electrical) — unverified
- [ ] ⚠️ **AFR gauge** (ecu-electrical) — Separate from CAN Lambda
- [ ] ⚠️ **MAF sensor** (ecu-electrical) — RETAINED for IAT element in speed density mode - verify exact PN
- [ ] ⚠️ **Crank position sensor** (ecu-electrical) — NEW but NOT OEM. Brand/PN not recorded - confirm
- [ ] ⚠️ **Cam position sensor** (ecu-electrical) — NEW but NOT OEM. SINGLE AVCS - confirm sensor count vs FSM dual-AVCS figures
- [ ] ⚠️ **Coolant temp sensor (ECT)** (ecu-electrical) — NEW. Brand/PN not recorded
- [ ] ⚠️ **MEGA fuse holders (x2)** (ecu-electrical) — Mount on the 3D-printed battery tray fuse platform (108x82mm cantilever, M8 studs). Fuse 1 alternator/Big 3, Fuse 2 audio amp
- [ ] ⚠️ **Fuse - alternator / Big 3 charge cable** (ecu-electrical) — NOT in stock. FORM FACTOR CONFLICT: grounding notes say 250-300A ANL, tray was designed for MEGA holders. Tray wins - buy MEGA
- [ ] ⚠️ **Fuse - audio amp power cable** (ecu-electrical) — NOT in stock. Size to the Boss R1100M + RF P400-4 power run. MEGA form factor to match holder
- [ ] ⚠️ **Valves** (engine-heads) — OVERSIZED - believed +1mm (recollection
- [ ] ⚠️ **Camshafts** (engine-heads) — Stage 2 considered not fitted
- [ ] ⚠️ **AVCS solenoids** (engine-heads) — Came with the used V25B heads. UNTESTED - verify cam angle response on first start
- [ ] ⚠️ **Engine oil - synthetic** (fluids) — From 750 mi. HTHS 4.0. CPU-49
- [ ] ⚠️ **Power steering fluid** (fluids) — 0.7 L / 0.7 qt. Subaru PS spec is Dexron ATF. CPU-54
- [ ] ⚠️ **Downpipe** (induction) — CATLESS - confirmed 2026-08-20. 3in matching the cat-back. BRAND NOT RECORDED - check the part itself. Turbo-to-downpipe hardware in stock. Relevant to CPU-74 registration/inspection
- [ ] ⚠️ **Boost control solenoid (EBCS)** (induction) — 3-port on EXTERNAL gate. Confirm brand/PN and Link output frequency with tuner
- [ ] ⚠️ **Coilovers** (suspension) — PN F-02-BR vs F-03-BR UNKNOWN; camber plates built in; stock rates 8kg/mm F 6kg/mm R
- [ ] ⚠️ **Front ball joint** (suspension) — Generic GD-era - verify taper seats in STi housing
- [ ] ⚠️ **Power steering pump** (suspension) — Multiple pumps on hand - inspect to pick best; same PN across 04-07 turbo EJ
- [ ] ⚠️ **PS pump rebuild kit** (suspension) — Likely needed
- [ ] ⚠️ **Wheels** (suspension) — Black. Believed OEM Subaru from a WRX. Bought cheap. CONFIRMED: clear the current hub + brake config (4/2-pot + ~294mm KNS rotors). UNKNOWN: diameter / width / offset / source year. 5x114.3 so likely 05-07 STi or 08+ WRX/STi. ID METHOD: spec is stamped or cast on the inner barrel or behind a spoke - look for 17x7 JJ + ET offset + Subaru PN
- [ ] ⚠️ **Tires** (suspension) — Temporary - Alan: BS tires for now. Size not recorded. NOTE: rolling diameter feeds speedo calibration - recheck VSS/cluster (CPU-71) if tire size changes
- [ ] ⚠️ **Left rear hub large bolt** (suspension) — unverified
- [ ] ⚠️ **Rear hub gaskets** (suspension) — unverified

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
