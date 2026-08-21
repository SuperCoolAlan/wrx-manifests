<!-- GENERATED FROM wiring.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-wiring-register.py -->

# As-Wired Register — harness deviations

> **The FSM wiring diagrams do not describe this car.** A 2005 STi engine harness was
> merged onto a 2004 GG body harness by iWire, and the factory ECU is gone. This register
> supersedes those diagrams for every circuit listed. Where a circuit is *not* listed,
> the FSM diagram still applies.

**21 recorded deviations** · ✅ confirmed · ⚠️ needs verification

**Pin-level detail recorded for 5 of 21 rows.** Rows without a connector/pin are system-level notes, not wiring instructions.

---

## Harness — what this car actually has

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | Engine harness base | — | **superseded** | 2005 STi engine harness merged onto 2004 GG body harness by iWire | Engine is an EJ257; body is a 2004 GG |
| | | | | FSM wiring diagrams do not describe this car | |

## Engine management

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | ECU | — | **superseded** | Factory ECU removed; Link WRXLink WRX104X (224-4000) in the factory enclosure | Standalone engine management |
| | | | | Bench-activated with base map loaded | |
| ✅ | Expansion loom | — | **added** | Link XSL Expansion Loom 101-0106 | Adds inputs/outputs beyond the base loom |
| ✅ | CAN bus | — | **added** | Link CANJST 5-pin cable 101-0197 | Connects CAN Lambda to the ECU |
| ✅ | Wideband | — | **added** | Link CAN Lambda 125-1000 in the POST-TURBO bung | Replaces both factory O2 circuits |
| | | | | Rear O2 deleted; catless | |
| ✅ | DBW pedal | — | **added** | Subaru 36010FE020 pedal on an iWire DBW pedal adapter plate | 2004 chassis did not have drive-by-wire |

## Fuel system

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | Fuel pressure sensor | — | **added** | LDM 8990150-0-150 0-150psi via BW Tuning TGV-to-pressure-sensor expansion harness | Fuel pressure input to the Link |
| | | | | One of two identical sensors | |
| ⚠️ | Flex fuel sensor | — | **added** | Continental PPA-IGF35 ethanol content sensor | Flex fuel capability |
| | | | | Not yet installed - see CPU-57 | |
| ⚠️ | Fuel pump - relay trigger | OEM fuel pump control module (FPCM) · pin TBD · colour TBD | **splice** | The 12V feed that used to power the FPCM is spliced off to trigger the new 40A Bosch relay instead | Hardwires the DW400 around the FPCM without removing it |
| | | | | CONSEQUENCE: the FPCM now receives NO 12V. It is still bolted in and still PLUGGED IN, but it is DEAD and does nothing. Do not diagnose it. Connector ID, pin and wire colour still to be recorded | |
| ✅ | Fuel pump - B+ feed | 15ft 10AWG red + 30A blade fuse | **added** | Battery positive, through the DRIVER side firewall, along the driver side of the car, crossing under the REAR SEAT to the passenger-side chassis harness | DW400 draws far more than the factory circuit passes |
| | | | | DeatschWerks FPHWK-10-HD kit. 30A fuse is on this leg | |
| ✅ | Fuel pump - relay | under the rear seat | **added** | 40A Bosch automotive relay, mounted UNDER THE REAR SEAT alongside the harness crossing | Switching element for the hardwired pump feed |
| | | | | Relay and its ground are both under the rear seat - first place to look for a no-start on the fuel side | |
| ✅ | Fuel pump - relay ground | chassis, under rear seat · 6ft 10AWG black | **added** | Relay ground to CHASSIS under the rear seat |  |
| | | | | FPHWK-10-HD ground leg | |
| ✅ | Fuel pump - relay output | chassis harness · yellow | **added** | Relay output lands on the CHASSIS HARNESS rather than running straight to the pump | Deliberate: keeps the pump harness disconnectable for tank or pump service |
| | | | | Do not bypass this - it is what lets the pump be unplugged normally | |
| ✅ | Fuel pump - pump ground | chassis | **added** | Pump ground run to chassis | Dedicated return for the higher pump current |

## Oiling

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | Oil pressure sensor | — | **added** | LDM 8990150-0-150 0-150psi via BW Tuning TGV-to-pressure-sensor expansion harness | Oil pressure input to the Link |
| | | | | Second of two identical sensors; sender is firewall-mounted | |

## Induction / boost control

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ⚠️ | Boost control | — | **superseded** | 3-port EBCS (GrimmSpeed believed) driving an external TiAL MVS | Factory 2-port EBCS content is VOID |
| | | | | Confirm Link output frequency with the tuner | |

## Drivetrain

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | DCCD | — | **added** | DCCDPro with cluster output + iWire DCCD Spiider PnP kit + DCCD cluster jumper | Adds automatic G-sensor modes |
| | | | | FACTORY KNOB AND CLUSTER DISPLAY STILL WORK | |
| ✅ | DCCD trans adapter | — | **added** | iWire turbo-trans to DCCD-trans adapter | 2011 DCCD box onto this harness |
| ⚠️ | VSS | — | **added** | iWire VSS Pro + PnP kit | Speed signal for the 07 STi cluster |
| | | | | Verify against the cluster at commissioning | |

## Body / cluster

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | Cluster | — | **superseded** | 2007 STi cluster with outside air temp | Matches the 6MT/DCCD drivetrain |
| ✅ | Cruise control | — | **NOT FITTED** | Deliberately not wired during the iWire harness build | Not wanted |
| | | | | SP Speed Control section is VOID. It is not broken - do not diagnose it | |

---

## Needs verification

- [ ] **Flex fuel sensor** — Not yet installed - see CPU-57
- [ ] **VSS** — Verify against the cluster at commissioning
- [ ] **Boost control** — Confirm Link output frequency with the tuner
- [ ] **Fuel pump - relay trigger** — CONSEQUENCE: the FPCM now receives NO 12V. It is still bolted in and still PLUGGED IN, but it is DEAD and does nothing. Do not diagnose it. Connector ID, pin and wire colour still to be recorded

