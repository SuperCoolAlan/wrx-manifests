<!-- GENERATED FROM wiring.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-wiring-register.py -->

# As-Wired Register — harness deviations

> **The FSM wiring diagrams do not describe this car.** A 2005 STi engine harness was
> merged onto a 2004 GG body harness by iWire, and the factory ECU is gone. This register
> supersedes those diagrams for every circuit listed. Where a circuit is *not* listed,
> the FSM diagram still applies.

**28 recorded deviations** · ✅ confirmed · ⚠️ needs verification

**Pin-level detail recorded for 12 of 28 rows.** Rows without a connector/pin are system-level notes, not wiring instructions.

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
| ✅ | Rear O2 circuit | B19 / T5 | **repurposed** | No rear O2 sensor on this car. The circuit now carries the flex fuel sensor signal instead | Catless downpipe; rear O2 has nothing to measure |
| | | | | All FSM rear oxygen sensor diagnostics and diagrams are VOID. Do not fit an O2 sensor to B19 | |

## Fuel system

| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |
|:-:|---|---|---|---|---|
| ✅ | Fuel pressure sensor | — | **added** | LDM 8990150-0-150 0-150psi via BW Tuning TGV-to-pressure-sensor expansion harness | Fuel pressure input to the Link |
| | | | | One of two identical sensors | |
| ⚠️ | Flex fuel sensor | B19 (4-pin gray, area B-3) / T5 · rear O2 sensor cord | **repurposed connector** | The REAR O2 SENSOR CONNECTOR is repurposed for the flex fuel sensor via an iWire rear-O2-plug to Continental-fuel-sensor-plug adapter. Rear O2 is deleted (catless) | Reuses an existing ECU-side circuit instead of running new wiring |
| | | | | TRAP: B19 is still physically an O2 connector, so an O2 sensor WILL plug straight in - and would be feeding a flex fuel input. The Link reads FREQUENCY here, not an O2 voltage. Sensor itself not yet installed - CPU-57 | |
| ✅ | Fuel pump - B+ feed | 15ft 10AWG red + 30A blade fuse | **added** | Battery positive, through the DRIVER side firewall, along the driver side of the car, crossing under the REAR SEAT to the passenger-side chassis harness | DW400 draws far more than the factory circuit passes |
| | | | | DeatschWerks FPHWK-10-HD kit. 30A fuse is on this leg | |
| ✅ | Fuel pump - relay | under the rear seat | **added** | 40A Bosch automotive relay, mounted UNDER THE REAR SEAT alongside the harness crossing | Switching element for the hardwired pump feed |
| | | | | Relay and its ground are both under the rear seat - first place to look for a no-start on the fuel side | |
| ✅ | Fuel pump - relay ground | chassis, under rear seat · 6ft 10AWG black | **added** | Relay ground to CHASSIS under the rear seat |  |
| | | | | FPHWK-10-HD ground leg | |
| ✅ | Fuel pump - FPCM bypassed | R122 (10-pin black, area C-4) | **UNPLUGGED** | The factory fuel pump control module is UNPLUGGED and out of the circuit entirely. It is still physically in the car | Pump is hardwired; factory pump control is not used |
| | | | | It is NOT in the signal path and NOT required. It is present only because it was never removed. Note there is no R166/R167 FPCM harness pair on this car - that is STi-model only | |
| ✅ | Fuel pump - motor feed | R58 pin 1 · 1 · yellow from relay; factory BY cut | **cut and replaced** | The BY line between R57 and R58 was CUT, disconnecting R57 from the pump circuit. R58 pin 1 now takes the high-current motor feed straight from the relay output | Full-current hardwired feed to the DW400 |
| | | | | The factory feed path (FPCM -> BOr -> R15 pin 8 -> R57 -> BY) is ABANDONED and carries nothing | |
| ✅ | Fuel pump - factory feed path DEAD | R15 pin 8 / R57 · 8 · BOr chassis side, BY tank-cord side | **abandoned** | FSM diagram E/G(TB)-01 (WI-82) shows BOr at R15 pin 8 becoming BY across R57 into R58 pin 1. That path no longer feeds the pump | Superseded by the relay feed |
| | | | | Tracing this circuit against the FSM will mislead - the wire is cut between R57 and R58 | |
| ✅ | Fuel pump - relay trigger | R1 pin 7 -> R122 pin 10 · 7 (R1) -> 10 (R122) · BY | **cut and redirected** | The BY feed from the FUEL PUMP RELAY was CUT between R1 pin 7 and R166, and now drives the new 40A relay coil instead. Spliced UNDER THE REAR DRIVER SEAT | Relay still switches on factory pump-on logic, but the FPCM is left with no supply |
| | | | | Cut is on the BY run between R1 pin 7 and R122 pin 10. No R166/R167 in this car. Splice method not yet recorded | |
| ✅ | Fuel pump - factory control chain DEAD | ECM conn D (B137) pin 15 -> ... -> R122 · D15 · GR at the ECM, BY from the relay onward | **abandoned** | Factory chain per FSM E/G(TB)-01 (WI-82): ECM connector D pin 15 (GR) commands the FUEL PUMP RELAY; the relay output (BY) runs B46 -> B97/R1 bulkhead (8-pin, area B-2) -> R122 pin 10 at the fuel pump controller | Superseded by the hardwired relay |
| | | | | Chain is INTACT up to R1 pin 7. Past the cut it feeds the new relay coil. R122 carries nothing | |
| ✅ | WHICH FUEL PUMP DIAGRAM APPLIES | — | **reference** | This circuit is BODY-SIDE wiring, and the body harness is 2004 WRX - so E/G(TB)-01 (WI-82, turbo) should govern, NOT the STi E/G(ST)-01 (WI-108). R166/R167 are indexed "(STi model)", meaning the STi CAR, not the STi engine. The 2005 STi ENGINE harness does not reach this circuit | 2004 WRX body harness retained; only the engine harness is STi |
| | | | | RESOLVED: R166/R167 do NOT exist in this car - confirmed by Alan. The STi diagram was being read by mistake. E/G(TB)-01 (WI-82) is the correct page for this circuit | |
| ✅ | Fuel pump - ground (local) | tap on the B wire spanning R58 pin 4 <-> R57 pin 16 · 4 (R58) <-> 16 (R57) · B (black) | **tapped and re-grounded** | Pump ground leaves the pump on the OEM path at R58 pin 4. The black wire running from there to R57 pin 16 is tapped between the two connectors and grounded straight to CHASSIS UNDER THE REAR SEAT | Gives the DW400 a short, local high-current return instead of the long factory run |
| | | | | Factory wire toward R57 pin 16 is CUT, not paralleled - deliberate. GND-04 also carries the seat heaters, room/spot lights, door switches, rear accessory socket, fan control amp and compass mirror; DW400 current on that shared node would inject noise and shift the fuel level sender reference. TRADEOFF: the local chassis ground is now a SINGLE POINT OF FAILURE - clean bare metal, star washer, dielectric grease | |
| ✅ | Fuel pump - factory ground path | R57 pin 16 / R15 pin 16 · 16 · B (black) | **abandoned** | Factory pump ground per FSM GND-04 (WI-26) runs pump -> R58 pin 4 -> R57 pin 16 -> R15 pin 16 -> forward to the GND-04 ground point at the front of the car | Superseded by the local chassis ground under the rear seat |
| | | | | That run was sized for the stock pump. At DW400 current its length would cost real voltage at the pump, which is the point of the local ground. CUT at the tap - this path is open, not a parallel return | |
| ⚠️ | Fuel level sender ground | R58 pin 4 · 4 · B (black) | **follows the pump ground** | Per FSM the black wire at R58 pin 4 is the common ground for the whole FUEL PUMP ASSEMBLY, which includes the fuel level sender | Not a separate change - it rides on the pump ground tap |
| | | | | So the sender now grounds locally under the rear seat too. SANITY CHECK: confirm the fuel gauge reads correctly at first start - a wrong or dead gauge would point here, not at the sender | |

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

- [ ] **Flex fuel sensor** — TRAP: B19 is still physically an O2 connector, so an O2 sensor WILL plug straight in - and would be feeding a flex fuel input. The Link reads FREQUENCY here, not an O2 voltage. Sensor itself not yet installed - CPU-57
- [ ] **VSS** — Verify against the cluster at commissioning
- [ ] **Boost control** — Confirm Link output frequency with the tuner
- [ ] **Fuel level sender ground** — So the sender now grounds locally under the rear seat too. SANITY CHECK: confirm the fuel gauge reads correctly at first start - a wrong or dead gauge would point here, not at the sender

