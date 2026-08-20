# BUILD TO-DO — Sequenced to First Start

**Updated:** 2026-08-19
**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · 2011 6MT/DCCD · target 500whp, mostly track
**State:** engine in, drivetrain assembled, suspension assembled. **Never started.**

Ordered so nothing has to come back apart. Detailed rationale for start-up items lives in `commissioning-checklist.md`.

---

## PHASE 0 — Sequencing traps ★ do these before access disappears

- [ ] **Oil pressure sensor — BEFORE the alternator goes on.** FSM removal step 1 is *"Remove the generator from bracket."* Torque **25 N·m (18.1 ft-lb)**, THREE BOND 1324 or equivalent. ⚠ Keep sealant/PTFE off the leading thread — squeeze-off goes into the oil gallery.
- [ ] **Plug the Perrin header bung — before the exhaust is installed.** M18 x 1.5 (confirm by measurement). Nickel high-temp anti-seize.
- [ ] **Check post-turbo O2 bung clock angle — must be ≥10° above horizontal.** Fix now or condensation kills the wideband.
- [ ] **Weld/verify anything else needing exhaust off** while it's off.

---

## PHASE 1 — Fabrication

- [ ] Design + manufacture **FPR / flex-fuel bracket** (old washer bottle location)
- [ ] Confirm bracket clears: hood line, charge piping, heat sources
- [ ] Washer system **deleted** ✅ — note for inspection/registration

---

## PHASE 2 — Engine accessories & front of engine

- [ ] **Oil pressure sensor** (see Phase 0 — do first)
  - ⚠ **Remote-mounted sender = live pressurised oil source.** Use **flexible braided line, not rigid tube** — rigid lines work-harden from engine vibration and crack, and a failure there dumps oil pressure, not just the gauge reading.
  - Support with cushioned clamps; keep clear of exhaust heat
  - **Add both ends of this line to the first-start leak walk** — easy to miss behind accessories
- [ ] **Alternator** mount + charge wiring — see `alternator-decision-notes.md`
- [ ] **Power steering pump** mount
- [ ] **AC compressor** mount *(refrigerant evac/charge deferred)*
- [ ] **Accessory belt(s)** — correct length for the pulley combination actually fitted
- [ ] **Crank pulley torqued** — confirm it's the Fluidampr, not the Perrin lightweight
- [ ] Starter + engine/chassis grounds — see `electrical-grounding-notes.md`

---

## PHASE 3 — Turbo, exhaust, induction

- [ ] **Turbo mounted**
- [ ] **Turbo oil FEED line** + **feed restrictor sized for the FP Red**
- [ ] **Turbo oil DRAIN line** — continuous fall to the pan, no sags or rises
- [ ] **Turbo coolant lines** — both directions
- [ ] **EWG uppipe + TiAL MVS** installed; record spring pressure
- [ ] **Wastegate plumbing** — top and bottom ports
- [ ] **Boost control solenoid** + Link wiring
- [ ] **BOV / recirc valve** + plumbing
- [ ] **Exhaust pipes** + source hardware — studs, nuts, gaskets, springs; anti-seize on studs
- [ ] **IAG AOS** install + line routing
- [ ] **Intercooler + all charge piping**, couplers, clamps — check against `aps_dr725_kit_inventory.md`
- [ ] **Heat shielding** — DEI sleeve on AOS and fuel lines near header/uppipe
- [ ] Full **vacuum/boost line map** — MAP ref, wastegate, BOV, FPR reference

---

## PHASE 4 — Fuel system

### 4a. Build the lines
- [ ] Return lines: **rails → FPR → flex sensor → chassis return** (Red Horse 235)
- [ ] Cushioned Adel clamps + hose separators sized to measured OD
- [ ] FPR vacuum reference line
- [ ] Fuel filter fitted

### 4b. ★ FLUSH BEFORE ANY FUEL REACHES THE RAILS
> Dremel-cut braided hose sheds **stainless braid fragments and liner shavings**. Their natural destination is your injectors. Injector cleaning means pulling rails back off.

- [ ] **Tape each hose before cutting** — prevents braid fraying (do this on any remaining cuts)
- [ ] **Deburr** every cut end
- [ ] **Blow out each hose with compressed air** before fitting ends
- [ ] **Flush hoses with isopropyl / denatured alcohol** — safe for the ECO/FKM liner. ⚠ **No brake cleaner** (residue, can attack the liner). Blow fully dry.
- [ ] **Inspect each AN end** for swarf before assembly
- [ ] **System flush before connecting to the rails:** route the rail feed into a **catch container**, prime the pump, push through several litres, inspect the catch for debris. Only then connect the rails.
- [x] ~~Fuel tank + pickup condition~~ — **INSPECTED, fine** (2026-08-19). Drained what was accessible; fresh pump gas for first run to dilute/flush the remainder.
- [ ] Fresh fuel filter **after** the flush if the first one caught debris

### 4c. Verify
- [ ] **Fuel pump prime + FPCM bypass check** — key-on relay click, 13.5V+ at R57 Pin 8, continuous run
- [ ] **Flex fuel sensor** installed + calibrated in Link
- [ ] **Pressure-test the entire system and walk every joint BEFORE ignition.** E85, hot engine bay.

---

## PHASE 5 — Cooling

- [ ] Radiator + fans mounted; fan control wired to Link
- [ ] All coolant lines / hard pipes (04 crossover + bypass — see `cooling-system-notes.md`)
- [ ] Thermostat
- [ ] Cap unused PCV portions of the upper pipe assembly (AOS replaces OEM PCV)
- [ ] **Fill AND bleed** — ECFT is the system high point. An air pocket overheats a fresh motor at first idle.

---

## PHASE 6 — Fluids

- [ ] **Engine oil** + filter *(record capacity — IAG pan changes it)*
- [ ] **Coolant** (see Phase 5 — fill and bleed)
- [ ] **Transmission fluid — 2011 6MT spec, NOT 2004 5MT**
- [ ] **Front/centre diff** per 6MT spec
- [ ] **Rear diff (R180)** fluid
- [ ] **Brake fluid** — high-temp DOT4 (RBF600/660 or SRF)
- [ ] **Clutch fluid — same DOT4, separate bleed.** FSM: *"New FMVSS No. 116 DOT3 or DOT4 brake fluid."* Never DOT5.
- [ ] **Power steering fluid**
- [ ] Record every capacity into the merged fluids table for the binder

---

## PHASE 7 — Sensors, electrical, ECU

- [ ] **4-bar MAP** installed; Link cal **11.97 psia/V, +0.506 offset**
- [ ] **Wideband CAN Lambda — POST-TURBO bung**
- [ ] Crank + cam position sensors connected
- [ ] Coolant temp sensor to Link
- [ ] Oil pressure sensor wired
- [ ] Battery secured in tray (3D-printed)
- [ ] **Base map from Ben loaded** — ⚠ confirm it **trusts the flex sensor input from the start** rather than assuming a fixed ethanol content. First fire is on pump gas, not E85.
- [ ] **DBW throttle + pedal calibration**

---

## PHASE 8 — Pre-start verification ★

- [ ] **Verify cam/crank timing** — interference engine, confirm marks
- [ ] **Confirm valve lash was set and recorded**
- [ ] **Confirm ACT disc is 240mm (6MT), not 230mm** — if accessible
- [ ] Turn the engine over by hand — full rotations, no interference
- [ ] **★ PRIME THE OIL SYSTEM** — see full procedure below. **The most damaging single thing to skip on a fresh build.**
- [ ] Full leak walk: oil, coolant, fuel, brake, clutch
- [ ] **Fire extinguisher within reach**
- [ ] **Second person present** — one on the key, one watching

---

### Oil priming procedure

1. [ ] **Pre-fill the oil filter** before fitting — removes a filter's volume the pump would otherwise have to fill first
2. [ ] **Pre-fill the oil pressure sender line** with clean oil before final connection. Not needed for lubrication (dead-end sensing line), but a dry line means the first reading is **delayed and damped** while trapped air compresses — the exact ambiguity you don't want at first start.
3. [ ] *(Optional, belt-and-braces)* **Pre-lube through the oil pressure sender port** with a pressurised oil canister — puts oil in the galleries with zero cranking, so the first rotation happens wet
4. [ ] **Pull the spark plugs.** No compression = far faster cranking, pressure sooner, and much less starter load
5. [ ] **Disable fuel AND ignition** (pump relay + coil power, or disable injectors/ignition in the Link)
6. [ ] **Crank in 10-15 s bursts, 30-60 s rest.** Starters overheat quickly at full duty
7. [ ] **Confirm pressure on a MECHANICAL gauge**, not only the Link — on first crank the sensor, wiring and calibration are all unproven, and that ambiguity is exactly when people crank too long
8. [ ] **★ PRIME THE TURBO SEPARATELY** — block priming does **not** fill the turbo feed line. Disconnect the feed at the turbo, crank until oil emerges, then connect. Better: squirt clean oil directly into the turbo oil inlet first so the bearing is wet from revolution one. **The block has assembly lube; the turbo has nothing.**
9. [ ] Refit plugs, re-enable fuel and ignition

> ❌ **Does not apply to EJ:** the "spin the oil pump with a drill via the distributor" trick. EJs have no distributor and the oil pump is crank-driven.

---

## PHASE 9 — First start

- [ ] Start; watch oil pressure immediately — **shut down if it doesn't register**
- [ ] Watch for leaks, smoke, unusual noise
- [ ] Bring to temp; **bleed cooling system again** as air migrates
- [ ] **Clutch disengagement check — 1st and reverse at idle without grinding.** Settles the fork/disc question.
- [ ] Re-check all fluid levels

---

## PHASE 10 — On its wheels, before driving

- [ ] **★ RE-TORQUE SUSPENSION BUSHINGS AT RIDE HEIGHT.** FSM demands it 5×; car was assembled on stands. Curb weight, roll forward >5 m to settle, then loosen and re-torque. ⚠ Wagon/Except-STi values on link fasteners (**30 N·m**, not 45).
- [ ] **Wheel / lug nut torque**
- [ ] **Four-wheel alignment** — ask for **SAI / included angle side-to-side** (detects a bent used knuckle) and **read rear camber** (not factory-adjustable; may need adjustable rear lateral links)
- [ ] **Corner balance** at running weight with driver
- [ ] Record achieved alignment into the binder

---

## PHASE 11 — Shakedown

- [ ] **Break-in protocol** — `break-in-protocol.md`
- [ ] **DCCD functional test** — through its range, not just continuity
- [ ] **Speedo / VSS verification** vs the 07 STi cluster
- [ ] **Re-torque exhaust** after heat cycles
- [ ] **Early oil change** — break-in debris
- [ ] **Brake bedding** — after break-in, before track
- [ ] Registration / insurance / inspection
- [ ] Tune session with Ben

---

## Still deferred by decision
- AC refrigerant evacuate + charge
- Clutch fork ID + disc diameter — batched with next clutch job (`drivetrain-notes.md`)
- 04-07 STI Brembo upgrade — winter project (`brake-notes.md`)
