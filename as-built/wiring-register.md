<!-- GENERATED FROM wiring.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-wiring-register.py -->

# As-Wired Register — harness deviations

> **The FSM wiring diagrams do not describe this car.** A 2005 STi engine harness was
> merged onto a 2004 GG body harness by iWire, and the factory ECU is gone. This register
> supersedes those diagrams for every circuit listed. Where a circuit is *not* listed,
> the FSM diagram still applies.

**25 recorded deviations** · ✅ confirmed · ⚠️ needs verification

**Pin-level detail recorded for 8 of 25 rows.** Rows without a connector/pin are system-level notes, not wiring instructions.

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
| ✅ | Fuel pump - B+ feed | 15ft 10AWG red + 30A blade fuse | **added** | Battery positive, through the DRIVER side firewall, along the driver side of the car, crossing under the REAR SEAT to the passenger-side chassis harness | DW400 draws far more than the factory circuit passes |
| | | | | DeatschWerks FPHWK-10-HD kit. 30A fuse is on this leg | |
| ✅ | Fuel pump - relay | under the rear seat | **added** | 40A Bosch automotive relay, mounted UNDER THE REAR SEAT alongside the harness crossing | Switching element for the hardwired pump feed |
| | | | | Relay and its ground are both under the rear seat - first place to look for a no-start on the fuel side | |
| ✅ | Fuel pump - relay ground | chassis, under rear seat · 6ft 10AWG black | **added** | Relay ground to CHASSIS under the rear seat |  |
| | | | | FPHWK-10-HD ground leg | |
| ✅ | Fuel pump - pump ground | chassis | **added** | Pump ground run to chassis | Dedicated return for the higher pump current |
| ✅ | Fuel pump - FPCM bypassed | R122 (10-pin black, area C-4) | **UNPLUGGED** | The factory fuel pump control module is UNPLUGGED and out of the circuit entirely. It is still physically in the car | Pump is hardwired; factory pump control is not used |
| | | | | It is NOT in the signal path and NOT required. It is present only because it was never removed | |
| ✅ | Fuel pump - motor feed | R58 pin 1 · 1 · yellow from relay; factory BY cut | **cut and replaced** | The BY line between R57 and R58 was CUT, disconnecting R57 from the pump circuit. R58 pin 1 now takes the high-current motor feed straight from the relay output | Full-current hardwired feed to the DW400 |
| | | | | The factory feed path (FPCM -> BOr -> R15 pin 8 -> R57 -> BY) is ABANDONED and carries nothing | |
| ✅ | Fuel pump - factory feed path DEAD | R15 pin 8 / R57 · 8 · BOr chassis side, BY tank-cord side | **abandoned** | FSM diagram E/G(TB)-01 (WI-82) shows BOr at R15 pin 8 becoming BY across R57 into R58 pin 1. That path no longer feeds the pump | Superseded by the relay feed |
| | | | | Tracing this circuit against the FSM will mislead - the wire is cut between R57 and R58 | |
| ✅ | Fuel pump - relay trigger | R1 pin 7 -> R166/R167 -> R122 pin 10 · 7 (R1) -> 10 (R122) · BY | **cut and redirected** | The BY feed from the FUEL PUMP RELAY was CUT between R1 pin 7 and R166, and now drives the new 40A relay coil instead. Spliced UNDER THE REAR DRIVER SEAT | Relay still switches on factory pump-on logic, but the FPCM is left with no supply |
| | | | | STi routing: the cut is BEFORE the R166/R167 pair, so R166, R167 and R122 downstream of it are all dead. The non-STi turbo diagram runs R1 straight to R122 with no R166/R167 - do not use that one. Pin 10 confirmed against both Alan's notes and FSM E/G(ST)-01. Splice method still not recorded | |
| ✅ | Fuel pump - factory control chain DEAD | ECM conn D (B137) pin 15 -> ... -> R122 · D15 · GR at the ECM, BY from the relay onward | **abandoned** | Factory chain per FSM E/G(ST)-01 (WI-108): ECM connector D pin 15 (GR) commands the FUEL PUMP RELAY; the relay output (BY) runs B46 -> B97/R1 bulkhead (8-pin, area B-2) -> R166/R167 (STi FPCM harness, area C-4) -> R122 pin 10 at the fuel pump controller | Superseded by the hardwired relay |
| | | | | Chain is INTACT up to R1 pin 7. Past the cut it feeds the new relay coil. R166/R167 and R122 carry nothing | |
| ✅ | WHICH FUEL PUMP DIAGRAM APPLIES | — | **reference** | Use E/G(ST)-01 (WI-108, STi), NOT E/G(TB)-01 (WI-82, turbo). The STi routing inserts the R166/R167 FPCM harness pair between R1 and R122; the turbo routing runs R1 straight to R122 | 2005 STi engine harness on a 2004 chassis |
| | | | | The two diagrams are otherwise near-identical, which makes picking the wrong one easy and the extra connector pair invisible | |

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

