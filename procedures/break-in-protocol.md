# Engine Break-In Protocol — 2004 WRX / EJ257 Build

Synthesized 2026-07-21 from: IAG Engine Installation Doc (Oct 2023 PDF), Raw Performance
(Ron, ex-Axis Power Racing, via IWSTI), and forum consensus (NASIOC/IWSTI builder-conservative
school). Tailored to THIS build: self-assembled forged EJ257, stock cams (no new-cam break-in
needed), Link G4X + Ben's base map, EWG w/ GREEN 4.35 psi spring for break-in (installed 2026-08-26; swap to 10.15 psi after break-in, before dyno tune — CPU-34), FP Red, IAG pan (5.5–6 qt),
Motul Break-In 10W-40 (108080), Wix 57712XP filters.

## Fuel rule
- **Pump gas ONLY for entire break-in.** No E85 until after the dyno tune (~750–1000 mi).
  Ethanol degrades break-in oil lubricity during ring seating (IAG).

## Phase 0 — Before first start
- [ ] Recheck ALL hose clamps, fittings, fluid levels (Raw: "even if you think you did it")
- [ ] Clutch pedal adjustment verified (IAG warranty-teardown callout)
- [x] New spark plugs: NGK 2309 (LFR7AIX, 1 step colder), gapped 0.027" w/ threaded tool (2026-08-25). Fine for break-in; regap to ≤0.025" at the E85 tune per tuner table (400-500hp band)
- [ ] Oil filter PRE-FILLED with break-in oil, hand tight
- [ ] Turbo oil feed line pre-filled (journal-bearing FP Red)
- [ ] Battery charged, second person recruited (leak watch + fire extinguisher)

## Phase 1 — Priming (no combustion)
1. Disable spark/injection: **crank sensor unplugged** (IAG method; Link makes this easy —
   or use Link's "no fuel/spark" cranking config)
2. Crank in **10–15 sec bursts** with rest between, until oil pressure registers on CPTS-2
   (Raw says ~5 bursts typical)
3. Reconnect. Clear any codes.

## Phase 2 — First start (day one)
1. Start → watch oil pressure INSTANTLY. No pressure in ~5 sec = shut down, investigate.
2. Run **5 seconds**, shut off, full leak check (IAG)
3. Restart, **30 seconds**, monitoring pressure → off, leak check (IAG)
4. Restart, idle: want **>30 psi at idle**, no leaks. Light tapping from forged pistons
   when cold = normal; loud or rev-proportional noise = STOP (Raw)
5. **Ring/cam bed-in run:** bring to 2,000 rpm, hold 5 min, then vary 2,000↔4,500 in
   ~500 rpm steps every 30 sec for 10+ min (IAG). Watch oil pressure + coolant temp;
   pressure should stabilize then drop slightly at operating temp.
   (Stock cams w/ used followers = no dedicated cam break-in needed; the IAG profile covers it.)
6. Run until **radiator fans cycle twice** and thermostat opens. Burp ECFT/cooling system.
7. Shut down, cool 15–20 min (Raw). Recheck fluids.
8. **Retorque external fasteners after first heat cycles** (IAG).
9. **OIL CHANGE #1 (after first heat cycle)** + filter + crush washer. Cut filter open — read it.

## Phase 3 — First 50 miles
- VERY easy: **<4,500 rpm, ZERO boost (1–2 psi max)**
- City stop-and-go, constant rpm/load variation, **engine-brake every decel**
- No cruise control, no steady-state, no lugging
- **OIL CHANGE #2 @ 50 mi** + filter + washer. Leak check with car in the air.

## Phase 4 — 50 → 250 miles
- Same style, ceiling ~4,500. Deliberate moderate (50–75% throttle, still no boost)
  pulls with full engine-brake decels — load the rings, don't granny it (forum consensus:
  glazed hone from babying is the #1 self-inflicted failure)
- Check oil + coolant at EVERY fuel stop; oil consumption is normal (forged pistons)
- **OIL CHANGE #3 @ 250 mi** + filter + washer
- Inspect drained oil: moly swirl = normal (assembly lube). Metal flakes = STOP, do not
  restart, diagnose. Fuel smell = overfueling, flag to Ben (Raw)
- Deferred 300V + final break-in bottles order lands around here

## Phase 5 — 250 → 750 miles
- Rev ceiling ramps: **+250 rpm per 250 miles** (Raw formula) — ~4,750 @ 500, ~5,000 @ 750
- Still essentially zero boost — NOTE: Raw allows wastegate-spring boost after 300 mi
  (their assumption is a 10–12 psi spring; our break-in spring is the green 4.35, even softer) —
  but the stronger reason stands: the base map is UNTUNED → follow IAG: no meaningful boost until the tune
- Vacuum check: when idle/decel manifold vacuum stops improving change-to-change,
  rings are seated (Motoman-school signal, readable in Link logs)
- **OIL CHANGE #4 @ 750 mi** + filter + washer → **switch to 300V Competition 5W-40**

## Phase 6 — Tune & transition (~750–1,000 mi)
- Dyno tune with Ben (IAG: tunable at 750–1,000). Inspect/replace plugs at tune time.
- **Oil change after the dyno session** (dyno heat + fuel dilution; IAG) — this fill's UOA
  is the 5W-40 shear/dilution baseline
- Switch to E85/flex AFTER the tune
- Redline discipline: work up to full rpm progressively; suggest 7,000 limiter initially (Raw)

## Ongoing (post break-in)
- E85: change oil + filter every **1,200–1,500 mi**; also after every dyno/track outing (IAG)
- Oil consumption >1 qt/3,000 mi after break-in = investigate (IAG)
- FCP credit chain: each reorder of same items → return prior used oil for full credit

## Shopping deltas this protocol drives
- Break-in oil: **4 fills ≈ 22–24 × 1L** (have 6; order 12 more BEFORE first start; final 6 ~@250)
- Filters: **5× Wix 57712XP** + crush washer 10-pack
- New spark plugs at install + likely colder set at tune (ask Ben)
