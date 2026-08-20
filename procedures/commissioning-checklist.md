# Commissioning Checklist — Pre-First-Start → Shakedown

**Date:** 2026-08-19
**Status:** Engine built and in, drivetrain assembled, suspension assembled. **Never started, never driven.**
**Purpose:** gap analysis against Alan's own task list. Items he already named are marked ✎; everything else is a potential gap.

---

## ⚠ SEQUENCING TRAPS — do these before access disappears

| ✓ | Do this FIRST | Because |
|:-:|---|---|
| ☐ | **Oil pressure sensor — install BEFORE the alternator** | `LU(STi)` removal procedure step 1: *"Remove the generator from bracket."* The alternator blocks access. Alternator is not yet fitted — do the sensor now. **Torque 25 N·m (18.1 ft-lb).** Sealant: THREE BOND 1324 or equivalent. ⚠ Keep sealant/PTFE back from the leading thread — squeeze-off goes straight into the oil gallery of a fresh engine. |
| ☐ | **Plug the header bung before the exhaust goes on** | M18 x 1.5 (pending confirmation) |
| ☐ | **Verify post-turbo O2 bung clock angle** | Must be ≥10° above horizontal — fix while the exhaust is off |

---

## ⚠ TIER 1 — Miss these and you damage the engine on first start

| ✓ | Item | Why |
|:-:|---|---|
| ☐ | **Prime the oil system before first fire** | Fresh build, dry bearings. Crank with fuel/ignition disabled until oil pressure registers, or pre-lube through the sender port. **The single most damaging thing to skip on a new motor.** |
| ☐ | **Turbo oil FEED line** | "Install the turbo" ✎ is not the same job. Feed must be clean and unrestricted. |
| ☐ | **Turbo oil DRAIN line** | Must fall continuously to the pan — no sags, no rise. A restricted drain pressurises the CHRA and pushes oil past the seals. |
| ☐ | **Turbo oil feed restrictor — sized for the FP Red** | Journal vs ball-bearing want different restriction. Wrong restrictor smokes or kills the cartridge. |
| ☐ | **Turbo coolant lines** | Both directions. Skipping these heat-soaks the bearing after shutdown. |
| ☐ | **Verify cam/crank timing before cranking** | Interference engine. Confirm marks rather than assume. |
| ☐ | **Valve lash verified set** | You have a whole project file on this — confirm it was completed and recorded. |
| ☐ | **Crank pulley torqued** ✎ | Fluidampr — confirm spec and that it's the damper, not the Perrin lightweight. |
| ☐ | **Coolant filled AND bled** | Lines/rad/fans ✎ is only the plumbing. Your ECFT is the system high point — see `cooling-system-notes.md`. Air pocket = overheat on first idle. |
| ☐ | **Fuel system pressure-tested for leaks before ignition** | E85 in a hot engine bay. Pressurise with the pump, walk every joint, then start. |

---

## TIER 2 — Won't start / won't run without these

| ✓ | Item | Note |
|:-:|---|---|
| ☑ | ~~Injectors~~ | **DONE** |
| ☑ | ~~Spark plugs — gap + install~~ | **DONE — gapped and installed** |
| ☐ | **Base map from Ben loaded into the Link** | Cannot start without one. |
| ☐ | **DBW throttle + pedal calibration in the Link** | You have the 05 STi DBW pedal (36010FE020). |
| ☐ | **Flex fuel sensor installed + calibrated** | Bench-tested already; install and confirm in Link. |
| ☐ | **4-bar MAP installed + Link cal entered** | Omni MAP-STI-4BR: 11.97 psia/V, +0.506 offset. |
| ☐ | **Fuel pump prime + FPCM bypass verified** | Key-on relay click, 13.5V+ at R57 Pin 8, continuous run. |
| ☑ | ~~Wideband O2 bung~~ | **DONE — two bungs exist: post-turbo and pre-uppipe.** See placement decision below. |
| ☐ | **Crank / cam position sensors connected** | |
| ☐ | **Coolant temp sensor to Link** | |
| ☐ | **Accessory belt(s)** | Once alternator / AC / PS ✎ are mounted. |
| ☐ | **Alternator charge wiring** | See `alternator-decision-notes.md`. |
| ☐ | **Starter + engine grounds** | See `electrical-grounding-notes.md`. |
| ☐ | **Battery secured in tray** | 3D-printed tray. |

---

## TIER 3 — Boost & induction plumbing (easy to under-scope)

| ✓ | Item |
|:-:|---|
| ☐ | **Wastegate plumbing** — TiAL MVS top and bottom ports |
| ☐ | **Boost control solenoid** + Link wiring |
| ☐ | **Wastegate spring pressure** known and recorded |
| ☐ | **BOV / recirc valve** + its plumbing |
| ☐ | **Full vacuum/boost line map** — MAP ref, wastegate, BOV, FPR reference |
| ☐ | **FPR vacuum reference line** ✎ (bracket in design) |
| ☐ | **Charge piping, couplers, clamps** — inventory vs `aps_dr725_kit_inventory.md` ✎ |
| ☐ | **Heat shielding** — DEI sleeve on AOS + fuel lines near header/uppipe |
| ☐ | **Exhaust hardware** ✎ — studs, nuts, gaskets, springs; anti-seize on studs |

---

## TIER 4 — Things your task list didn't mention at all

| ✓ | Item | Note |
|:-:|---|---|
| ☐ | **Clutch hydraulic bleed** | Separate circuit from the brakes. **Fluid spec per FSM (2004/2007/2011 all agree): "New FMVSS No. 116 DOT3 or DOT4 brake fluid."** Use the same high-temp DOT4 as the brakes (RBF600/660 or SRF — both DOT4). **Never DOT5 silicone.** Bleed in the same session as the brakes. Check whether the clutch has its own reservoir or is fed off the brake reservoir. |
| ☑ | ~~Windshield washer system~~ | **DELETED** (confirmed 2026-08-19). Note for inspection/registration. |
| ☐ | AC refrigerant evacuate + charge | **DEFERRED** — Alan: "some other day." Compressor mounting still on the list. |
| ☐ | **Fuel filter + tank condition** | Sat how long? E85 is hygroscopic. |
| ☐ | **Oil filter** | |
| ☐ | **Wheel / lug nut torque** | 5x114.3 — 120 N·m (89 ft-lb) typical, verify. |
| ☐ | **Fire extinguisher within reach at first start** | Fresh fuel system, E85, unproven. Non-negotiable. |
| ☐ | **Second person present at first start** | One on the key, one watching for leaks and smoke. |

---

## TIER 5 — After it runs, before it's driven hard

| ✓ | Item | Note |
|:-:|---|---|
| ☐ | **★ Re-torque suspension bushings at ride height** | FSM demands it 5×. Car was assembled on stands. See `suspension-notes.md`. **Do before alignment.** |
| ☐ | **Four-wheel alignment** | Ask for **SAI / included angle side-to-side** — detects a bent used knuckle. Read rear camber (not factory-adjustable). |
| ☐ | **Corner balance** | Coilovers, at running weight with driver. |
| ☐ | **Clutch disengagement check** | 1st/reverse at idle without grinding — settles the fork/disc question. See `drivetrain-notes.md`. |
| ☐ | **DCCD functional test** | DCCDPro controller through its range, not just continuity. |
| ☐ | **Speedo / VSS verification** | iWire VSS Pro vs the 07 STi cluster. |
| ☐ | **Break-in protocol** | Per `break-in-protocol.md`. |
| ☐ | **Brake bedding** | After break-in, before any track use. |
| ☐ | **Re-torque exhaust after heat cycles** | Header/uppipe fasteners always move. |
| ☐ | **Oil change early** | Break-in debris. |
| ☐ | **Leak check after first heat cycles** | Oil, coolant, fuel, brake, clutch. |
| ☐ | **Registration / insurance / inspection** | You have title + insurance docs on file. |

---

## Highest-consequence items, ranked

1. **Prime oil before first fire** — irreversible bearing damage
2. **Turbo oil drain routing** — kills the turbo
3. **Coolant bleed** (ECFT high point) — overheats a fresh motor
4. **Fuel leak test before ignition** — E85 fire
5. **Cam/crank timing verified** — interference engine
6. **Wideband bung welded while exhaust is off** — otherwise it comes back off
7. **Bushing re-torque at ride height** — free now, expensive later


---

## Wideband O2 sensor placement — DECIDED 2026-08-19

Two bungs exist: **post-turbo** and **pre-uppipe** (pre-turbine).

### → Mount the Link CAN Lambda in the **POST-TURBO** bung

| Reason | Detail |
|---|---|
| **Pressure** | Wideband AFR readings are backpressure-sensitive. Pre-turbine at 26-29 psi boost sees pressure far above atmospheric and skews readings — bad data exactly where Ben needs good data. Post-turbo is near-atmospheric, which is what the sensor is calibrated for. |
| **Temperature** | Pre-turbine EGT at high load runs 900 °C+, at/over the Bosch LSU 4.9 rating. The turbine drops gas temp substantially before the post-turbo bung. |
| **Convention** | All standalone tuning reference data assumes a downstream location. |

### Pre-uppipe bung — thread spec
Located in the **Perrin EL header near the uppipe flange**. Alan confirms it is **clearly larger than 1/8" NPT**, so it is **M18 x 1.5** (standard O2 sensor thread) — the only realistic alternative above 1/8" NPT is 1/4" NPT (~13.7 mm), which is both visibly smaller and tapered rather than straight.

- **Buy: M18 x 1.5 O2 bung plug** — stainless or plated steel, crush washer if supplied, **nickel high-temp anti-seize on the threads**
- Confirm by threading a spare O2 sensor in; if it seats, it's M18 x 1.5
- **Future EGT:** an **M18 x 1.5 → 1/8" NPT adapter** is a common off-the-shelf part. Plugging it now does not forfeit EGT later — no header rework needed.
- Note: Perrin's published specs do not document bung threads; this is from measurement, not datasheet.

### Keep the pre-uppipe bung for **EGT**
Pre-turbine is the correct and meaningful location for an EGT probe — it's what the turbine and valves actually see. On a 500whp E85 track car EGT is a real safety channel for detonation / lean-out, and the Link can log it. **Plug it for now if not fitting EGT; do not weld it shut.**

### Mounting details to verify
- ☐ **Sensor at least 10° above horizontal.** A bung at/near the bottom of the pipe pools condensate and thermally shocks the sensor on cold start — a common wideband killer.
- ☐ **12-24″ downstream of the turbine outlet** — fast response without radiant heat soak.
