# Electrical Grounding & Big 3 Notes — 04 WRX + EJ257 Build

**Written:** 2026-05-24 · **Substantially revised:** 2026-09-02
**Build:** 2004 USDM WRX wagon + 2005-era EJ257 + 06 STI intake
**Context:** Singer 200A alternator (220A peak, 150A idle) + 600-700W RMS audio install
**Live plan:** Linear CPU-92 · **Diagram:** https://claude.ai/code/artifact/48d2bb6d-593b-402a-b8e7-9dbb591cb25f

> **2026-09-02 revision changed three things materially.** If you read an earlier printout, re-read this file.
> 1. The **GE-1 / GB-1 identification below was wrong** and is corrected.
> 2. The **chassis ground went 4 AWG -> 1/0**.
> 3. The **fuse went 250A ANL -> 225A MEGA**, and the bridge between fuse holders is a **formed copper bar**, not cable.
> Units are **metric** throughout this revision.

## OEM Ground Points — 2004 WRX Engine Bay

FSM labels: **GE** = engine ground, **GB** = body ground, **GR** = radio ground (legend on WI-8, binder 7-10).

> ### CORRECTED 2026-09-02 — GE-1 and GB-1 are NOT the battery cables
>
> An earlier version of this table described GE-1 as the battery-to-block cable and GB-1 as the battery-to-fender pigtail, and told you to bolt 1/0 onto them. **Both were wrong.** Read from the FSM ground-distribution sheets:
>
> - **GE-1** (GND-09, WI-31 / binder 7-33) collects the **ECM, ignition coils 1-4, IAC solenoid, PCV diagnosis connector, neutral position switch, VSS and combination meter.** It is a *signal* harness ground eyelet carrying single-digit amps.
> - **GB-1** (GND-01, WI-23 / binder 7-25) collects the **sub fan motor, headlight lo-beams, clearance and turn lights, fog light and headlight levelers.** A lighting/fan harness ground.
>
> **Do not land Big 3 cable on either.** The heavy battery cables do not appear in the GE/GB scheme at all — the FSM only draws harness, not cable assemblies, so battery-to-block, battery-to-starter and alternator B+ are absent from these illustrations. **The Big 3 landing points are physical lugs you identify on the car**, which is what the string mock-up is for.

| FSM ref | What it actually is | Physical location drawing | Big 3 relevance |
|---|---|---|---|
| **GE-1** | ECM / coils / IAC / VSS harness ground | **WI-187, binder 7-387** (2005 STi engine harness; the 2004 equivalent is WI-182 / 7-184) | Not a Big 3 landing point. But it is the reference the Link's knock, MAP and O2 readings sit on — which is what makes the engine→chassis bond worth doing. |
| **GE-2** | Engine → firewall/chassis strap, rear of driver head | Same drawing, grid A-1/2 | **Supplement it** — this is run 7 |
| **GB-1** | Lighting / fan harness ground | **WI-173, binder 7-175** (front harness), grid B-1 | Not a Big 3 landing point |
| **GB-2** | Front body ground, passenger side | Same drawing, grid C-4 | Skip |

**OEM gauges are not published.** The FSM wire table (WI-8 / binder 7-10) tops out at 8 mm² / 67 A and covers harness wire only, not battery cables. Any gauge figure for the heavy cables has to be measured.

**Transmission ground:** MT WRX has NO dedicated heavy trans-to-chassis strap. Trans grounds through bell housing bolts → engine block → GE-1. No separate Big 3 candidate.

**No OEM grounds at strut towers or pitch stop bracket.** Those are aftermarket-only additions.

## The Big 3 Wiring Plan (revised 2026-09-02)

**Big 3 + 1.** Four functional connections. Everything else in the bay is either an OEM cable that stays put or the audio branch riding on the second fuse holder.

| # | Run | Gauge | Carries | Protection |
|---|---|---|---|---|
| 1 | Alternator B+ → 5001-A load stud | **1/0** | 200 A cont / 220 A peak | **225 A MEGA** |
| 2 | Battery + → 5001-A battery stud | **1/0** | same | **unfused** — keep to tens of mm |
| 3 | 5001-A ↔ 5001-B bridge | **copper bar** | ~95 A (audio only) | — |
| 4 | 5001-B load stud → amps | 4 AWG *(existing)* | ~95 A peak | **125 A MEGA** |
| 5 | Battery − → engine block | **1/0** | 200 A return + ~700 A cranking | — |
| 6 | Battery − → chassis | **1/0** | ~125 A chassis return | — |
| 7 | Engine block → chassis (GE-2) | **4 AWG braid** | ~1/3 of run 6 | — |

Runs 1, 2 and 3 are one electrical path interrupted by the fuse block. Runs 4 and the amp grounds are already installed.

### Why these gauges

**ABYC E-11 Table 6A, 105 °C insulation, _inside engine spaces_** — the column that matches a hot Subaru bay and the marine tinned cable specced below:

| AWG | Outside engine | **Inside engine** |
|---|---|---|
| 1/0 | 285 A | **242 A** |
| 1 | 245 A | 208 A |
| 2 | 210 A | 178 A |
| 4 | 160 A | **136 A** |
| 8 | 80 A | 68 A |

1/0 is the first size that legitimately covers 200 A in a hot bay. That is why it is not overkill on runs 1, 2 and 5 — and 4 AWG's 136 A leaves no headroom over run 6's load, which is why run 6 went to 1/0 as well.

### The chassis run is NOT low-current — corrected 2026-09-02

An earlier version of this file called the chassis return "lower-current (lights, fans, accessories)" and specced 4 AWG. **That was wrong.** Per the FSM ground-distribution sheets (GND-01…08), nearly everything on the car grounds to the **body**, not the block:

| Load | Draw |
|---|---|
| Audio amps, peak | 95 A |
| Radiator fans, both | 15-25 A |
| Rear defogger | 15-20 A |
| Blower motor, high | 10-20 A |
| DW400 fuel pump | 17-20 A |
| Headlights | 10-15 A |
| Seat heaters, wipers, accessories | 15-20 A |

Theoretical sum ~220 A; a realistic simultaneous winter case is **~125 A continuous** against 4 AWG's 136 A. **Run 6 is 1/0.**

**Run 7 is not a zero-current signal wire either.** It sits electrically parallel to run 6 (chassis → block → run 5 → battery−) and takes roughly a third of the chassis return. It is 4 AWG **braid rather than cable** because the engine rocks on its mounts and stranded cable work-hardens across a joint that moves.

### Fusing — a fuse protects the CABLE, not the source

| Run | Cable ampacity | Peak load | Fuse |
|---|---|---|---|
| 1 | 242 A (1/0) | 220 A | **225 A MEGA** |
| 4 | 136 A (4 AWG) | 85-95 A | **125 A MEGA** |

- **225 A, not 250 A.** 250 A sits *above* 1/0's 242 A rating — the cable would fail before the fuse. 225 A brackets it: above the Singer's 220 A peak so it won't nuisance-blow, below 242 A so the cable is protected.
- **125 A, not 100 A.** 100 A is too close to the 85-95 A combined amp peak and would nuisance-blow on bass transients.
- **Ordered 2026-09-02:** Littelfuse 298 Series MEGA, `0298225.ZXEH` and `0298125.ZXEH`, 2× each from Mouser. M8 bolt-down, **2000 A interrupting @ 32 VDC**, diffusion-pill time-delay. Bought from an authorized distributor because a fuse's rating is invisible and counterfeit MEGA/ANL fuses are common in the car audio market.

### Cable budget (revised)

| Item | Qty | Runs |
|---|---|---|
| 1/0 marine tinned **red** | ~1.5 m | 1, 2 |
| 1/0 marine tinned **black** | ~1.2 m | 5, 6 |
| 4 AWG braided strap | 305 mm | 7 |

Run 3 is bar, not cable. Run 4 and the amp grounds are already installed. **These are upper bounds pending the string mock-up** — run 6 is a known ~200 mm; runs 1 (~0.9-1.2 m) and 5 (~0.3-0.6 m) still need roping.

### Bridge bus bar (run 3)

The two Blue Sea 5001 holders mount **vertically, side by side**, per `3D Prints/battery-tray/battery-tray-mtx35.scad` (`fuse_holders_vertical = true`). Holder X centres 23.95 / 64.05 → **stud span 40.10 mm**, studs **M8** at **12.4 N·m** max.

1/0 needs a 60-90 mm bend radius and cannot make a 40 mm span, so the bridge is a **formed C110 copper bar, 19 × 3.2 mm** (61 mm², beats 1/0's 53.5 mm²) — a squared U bent around a 13 mm form, twisted 90° at each end to sit flat on the studs. Full fabrication sequence on Linear CPU-92; the short version is **anneal first, drill last**.

**Bridge the two _upper_ studs, and land the battery+ feed on the alternator holder's stud** (X 23.95). That keeps the alternator's 200 A off the bridge — it then only ever carries audio current. Feeding the other holder instead would put the full 200 A across the link.

### Do NOT delete the OEM alternator lead

Per **WI-17 (binder 7-19, and 7-217 in the STi volume — both agree)**, the alternator's B+ leaves connector F25 as **2× 8 AWG white** through F35 and ties to the **main fuse box bus, downstream of SBF-1 (80 A on turbo models)**. There is no OEM alternator-to-battery cable to delete.

Deleting it would force the car's entire 60-80 A engine load to draw from the battery post **through SBF-1**, which would sit at the edge of an 80 A fuse on a cold night with lights, fans and wipers up. Keep it; the new 1/0 runs in parallel and takes the majority share, and SBF-1 remains its own protection.

⚠ **One open question:** iWire states Subaru runs those 2× 8 AWG "to the fusebox **and the battery**," which conflicts with the schematic. Settle it on the car — disconnect the battery, pull SBF-1, check continuity from the alternator B+ stud to the battery + terminal. Continuity means a direct conductor bypassing the fuse. **The plan is unchanged either way.**

### Cable type decision (2026-05-31)

**Pick: Marine-grade tinned copper battery cable (Ancor or equivalent, UL 1426 certified).**

Why marine tinned beats the alternatives for engine bay use:

| Cable | Insulation | Tinned | Engine bay verdict |
|---|---|---|---|
| **Marine tinned (Ancor)** | 105°C dry / 75°C wet (UL 1426) | ✅ | Best fit. Engineered for hot/wet/vibrating bilges = engine bay spec. ~$3-4/ft. |
| SGX automotive cable | 125°C XLPE | Optional | Highest temp rating but coarser strand, fewer colors. Also fine. |
| Welding cable | 90-105°C EPDM | ❌ Bare copper | Cheaper but bare copper terminals tarnish in 2-3 yrs from humidity/road salt |
| Audio OFC (Down4Sound, Knu, etc.) | 75-105°C PVC | Often ✅ | Pays for unmeasurable copper purity. PVC insulation softens at hottest spots. Tinning is the actual feature you want — marine has it at half the price. |
| THHN building wire | 90°C | ❌ | Wrong product. Cracks under vibration. |

Sources:
- **Ancor 1/0 tinned battery cable** — West Marine, Defender Marine, Amazon (~$3.50/ft, red/black/yellow stocked)
- **Genuine Dealz** (online) — by-the-foot marine tinned, multiple colors
- **Pacer Group** — wholesale marine cable

Avoid: random eBay "marine" cable without UL 1426 certification; any CCA (copper-clad aluminum) at any price.

### Hardware checklist — revised 2026-09-02

*Live version on Linear CPU-98.*

| Item | Qty | Status |
|---|---|---|
| 1/0 marine tinned **red** | ~1.5 m | ⏸ pending mock-up |
| 1/0 marine tinned **black** | ~1.2 m | ⏸ pending mock-up |
| 4 AWG braided ground strap, 305 mm | 1 | Kimball Midwest 27490, N.O.S. |
| C110 copper flat bar, 19 × 3.2 mm, 305 mm | 1 | ✅ ordered 2026-09-02 |
| Littelfuse `0298225.ZXEH` 225 A MEGA | 2 | ✅ ordered — Mouser |
| Littelfuse `0298125.ZXEH` 125 A MEGA | 2 | ✅ ordered — Mouser |
| M8 1/0 ring lugs · heat shrink · PET loom · washers · dielectric grease · cable cutter | — | ✅ on hand |
| Battery + and − post terminals | 2 | ⏸ blocked on OEM cable gauge |
| 8.5 mm drill bit, 4× M8 flat washers | — | for the bridge bar |
| Hydraulic crimper | 1 | renting — **unless** cable is bought made-to-length with ends crimped |

**Both battery posts need multi-connection terminals:** + takes the 1/0 to the fuse pair plus the OEM cable to the main fuse box; − takes 1/0 to the block plus 1/0 to the chassis. The + side cannot be specified until the OEM cable is measured.

**Decision (2026-05-24, still holds):** Going DIY route, not the JS Alternators Big 3 kit. Reasons:
- JS kit does NOT include a fuse (mandatory safety component)
- DIY saves ~$10 overall vs adding a separate fuse to the kit
- DIY allows right-sized cable lengths (~8 ft) vs kit overbudget (~14 ft)
- DIY allows choice of marine-grade tinned cable (better fit for engine bay than welding cable OR audio OFC — see cable type decision above)
- DIY allows consolidating one order to also cover:
  - Audio amplifier ground cable (gauge to match existing amp power run)
  - 4-6 AWG braided strap for GE-2 supplement

## Cable Length — ESTIMATES, NOT VERIFIED

### ⚠️ Status: pending physical string mock-up

All cable lengths in the hardware checklist are **rough estimates from engine bay geometry**, NOT forum-verified measurements. Earlier versions of these notes cited specific lengths (e.g., "7.5 in for GB-1, 12 in for GE-2") attributed to the ClubWRX irvin787878 thread. Honest correction (2026-05-31):

- NASIOC thread #2098818 — confirmed contains NO length measurements (verified 2026-05-31)
- ClubWRX irvin787878 thread — Google snippet surfaced numbers ("1x 7.5 in, 2x 15.0 in, 1x 11.0 in...") but the full thread is now behind a paywall; mapping those snippet numbers to specific runs was an **inference**, not a verbatim quote
- No verified per-run cut list exists in the sources actually consulted

### Real verification step before cutting

**String mock-up.** With engine in (or alt/battery+ positions marked):

1. Tie paracord to battery+ terminal post
2. Route the paracord along the actual path each cable will take, following firewall, around hoses, secured points
3. Snip paracord at destination (alt B+ stud, engine block lug, fender stud, etc.)
4. Measure the snipped paracord
5. Add ~6 in margin per run for crimping slack + future re-routing

### Engine bay geometry — rough estimates only

Current estimates, metric, revised 2026-09-02. Treat as upper bounds pending the mock-up:

| Run | Estimate | Confidence |
|---|---|---|
| 1 — Alternator B+ → 5001-A (1/0 red) | **0.9-1.2 m** | Alan's estimate 2026-09-02, replacing an earlier 1.5-1.8 m guess. Longest run; biggest mock-up benefit. |
| 2 — Battery + → 5001-A (1/0 red) | tens of mm | The unfused stub — deliberately as short as possible |
| 3 — Bridge | 125 mm developed | Copper bar, not cable. Span is 40.10 mm from the tray model. |
| 5 — Battery − → engine block (1/0 black) | **0.3-0.6 m** | Needs roping; block lug not yet identified on the car |
| 6 — Battery − → chassis (1/0 black) | **~200 mm** | ✅ Known — Alan 2026-09-02, no roping needed |
| 7 — Engine block → chassis (4 AWG braid) | 305 mm | ✅ Kimball 27490, length confirmed adequate |

**Amp power feed and amp grounds are already installed** — not in this budget.

## Audio SQ Considerations

**Big 3 does NOT directly help amplifier noise floor.** Two separate concerns:

| Concern | Lives where | What helps |
|---|---|---|
| Source-side ground (alt + battery) | Engine bay | Big 3 |
| Sink-side ground (amplifier) | Amp mounting location | Amp ground at the amp, not engine bay |

### For amp SQ (independent of Big 3)

1. **Amp ground at the amp, done right:**
   - Short (under 18 in)
   - Same gauge as power cable
   - Bolted to **bare chassis metal** (scrape paint, star washer, dielectric grease)
   - Structural body bolt if amp is in trunk

**Amp ground plan for this build (2026-05-24):** Two short runs of **4 AWG** to **seat rail bolts**:
- Boss R1100M (sub amp) → nearest seat rail bolt (~18-24 in)
- Rockford Fosgate Punch P400-4 (4-ch) → nearest seat rail bolt (~18-24 in)

Seat rail bolts are excellent ground points — bolted directly into chassis sub-frame, no paint to scrape (factory bare metal contact), structural integrity.

2. **RCA cable routing:**
   - **Opposite side of car from power cable**
   - Don't bundle RCAs with power runs
   - Twisted-pair shielded RCAs preferred

3. **Common ground reference between headunit and amp:**
   - Whine often = ground potential difference
   - Optional: thick "audio common ground" wire from amp ground point up to headunit chassis ground

4. **Capacitor (1F):** Not useful for SQ — only for SPL transient peaks. **Skipped** per alternator decision.

### What Big 3 + GE-2 DOES help for the build

- **ECU/Link G4X sensor cleanliness** — knock, MAP, O2 readings reference engine ground. Cleaner ground = cleaner tune data.
- **Voltage stability at alternator output** — keeps 14.X V rail steady under load. Indirect audio benefit (amps perform best at design voltage).

### Skip for SQ

- Strut tower ground chains
- Intake manifold ground chains
- Multiple novel engine bay grounds — diminishing returns + ground-loop risk

### Modern consensus

**Strict Big 3 + supplement OEM ground points at same lugs.** Don't add many novel grounds. The "ground every strut tower" approach is older car-audio wisdom from early 2000s — still works but considered overkill outside SQ-competition builds.

## Battery Selection (2026-05-31)

**Pick:** Interstate MTX-AGM **Group 35** via Costco/Interstate dealer plug (~50% off retail). **LOCKED.**

### Why Group 35 (not 51R downsize)

Group 51R was considered for ~15 lb weight savings but **rejected** 2026-05-31:
- 15 lbs in the engine bay nose is meaningful for time-attack builds, not for a 500whp street/track WRX
- 51R retrofit requires PRL billet tie-down (~$50) — narrower battery doesn't engage OEM clamp
- 51R AGM units have shorter heat-soak life (2-3 yrs) vs Group 35 AGM (4-6 yrs)
- 51R gives up ~50% reserve capacity — meaningful audio buffer reduction for cranked peaks
- Costco plug pricing on Group 35 dominates the value math; 51R loses its only competitive angle

Physical fitment context (kept for future reference):
- Group 35: 9.06 × 6.88 × 8.88", 40-45 lbs, drops in OEM tray + clamp
- Group 51R: 9.37 × 5.06 × 8.81", 20-30 lbs, needs PRL tie-down adapter

### Why AGM (vs flooded / lithium / gel)

| Chemistry | Engine bay verdict |
|---|---|
| **AGM** | ✅ Sealed, vibration-resistant, handles 150-180°F heat, high charge acceptance for HO alternator |
| Flooded lead-acid | ❌ Vents acid, hates engine bay heat, plate stratification with HO alt |
| Lithium (LiFePO4) | ❌ Most cells derate above 140°F. Engine bay hits 160-200°F at heat-soak. Trunk-only chemistry. |
| Gel | ❌ Low charge acceptance, can't keep up with 200A alt |

### Why Interstate MTX-AGM specifically

- Plug pricing via Costco contact makes value math overwhelming
- Made by Clarios (parent of Optima/DieHard) — Interstate's AGM line has held up better than modern Optima
- Real-world reports: 4-6 yr life in performance applications with HO alternator
- Tier: upper-mid (Odyssey/Northstar are top-tier; Interstate sits comfortably below them but well above generic)

### Specs to confirm at counter

| Spec | Target |
|---|---|
| Chemistry | **AGM** (NOT MT or MTP flooded — Interstate's mainstream non-AGM line) |
| Group size | **35** (stock 04 WRX size, drops in OEM tray, no relocation) |
| CCA | ≥ 700 |
| Reserve capacity | ≥ 100 minutes |
| Warranty | 3-4 yr free replacement typical |

### Tier context (alternatives if Interstate plug falls through)

| Tier | Examples | Notes |
|---|---|---|
| **Top** (5+ yr life, race-proven) | Odyssey 35-PC1400T (~$320), Northstar | Best-in-class for high-output Subaru builds |
| **Upper-mid** (Interstate lands here) | **Interstate MTX-AGM35**, Deka Intimidator 9A35 (~$220), XS Power D925 (~$260) | Costco Duracell Platinum AGM Group 35 = rebadged Deka 9A35, often ~$180 |
| Mid | Duralast Platinum, DieHard Platinum | OK but not worth premium |
| Skip | Modern Optima YellowTop, generic CCA-only AGMs | Quality slipped post-Clarios acquisition |

## Whine Diagnostic Ladder (if needed post-install)

1. **RCA cable routing** (90% of whine fixes) — move to opposite side of car from power
2. **Amp ground quality** (8% of whine fixes) — re-do amp ground to bare metal, short run
3. **Common ground wire** between amp and headunit (2% — ground loop isolator approach)

Engine bay grounds are NOT on this ladder.

## Confidence / Source Flags

- **Confirmed:** GE/GB label *scheme* from the FSM (WI-8 legend); what GE-1 and GB-1 actually collect, read off GND-09 (WI-31) and GND-01 (WI-23); their drawing locations on WI-187 and WI-173; alternator B+ routing to the main fuse box on WI-17, verified in both the 2004 and 2005 volumes; SBF-1 = 80 A on turbo models; ABYC E-11 Table 6A ampacities; Blue Sea 5001 stud spec; Littelfuse 298 series ratings; holder geometry from `battery-tray-mtx35.scad`
- **⚠ Previously stated as confirmed but WRONG (corrected 2026-09-02):** that GE-1 and GB-1 were the heavy battery cables, and that the chassis return was low-current enough for 4 AWG
- **Open:** whether the OEM alternator lead also lands on the battery post (iWire says it does; the schematic shows fuse-box only) — settle with a continuity test, SBF-1 pulled
- **Inferred:** OEM cable gauges (FSM doesn't publish AWG); GE-2 physical location at rear of driver head (forum-corroborated, not FSM-bolt-callout)
- **Estimated, NOT verified:** Per-run cable lengths (see "Cable Length — ESTIMATES, NOT VERIFIED" section above). Earlier notes attributed lengths to ClubWRX irvin787878 thread; that attribution was an inference from a Google snippet of a now-paywalled thread, not a verified verbatim cut list. String mock-up required before cutting.
- **Forum consensus:** Strict Big 3 + OEM supplements > many novel grounds; RCA routing as primary whine fix

## Sources

- [2004 Impreza FSM wiring volume (G1870GE7)](https://subaruport.ru/imp4/imp04_wir_1.pdf)
- [ClubWRX — DIY Big 3 and Grounding kit with pics (irvin787878)](https://www.clubwrx.net/threads/diy-big-3-and-grounding-kit-with-pics.134345282/)
- [NASIOC — Making big 3/grounding kit + upgrading alternator (thread 2098818)](https://forums.nasioc.com/forums/showthread.php?t=2098818)
- [NASIOC — Big 3 on 06 wagon with voltage gauge (unparent)](https://forums.nasioc.com/forums/showthread.php?t=...)
- [iWire Grounding Kit](https://iwireusa.com/products/grounding-kit)
- [Subaru OEM negative battery cable 02-07 (FastWRX)](https://www.fastwrx.com/products/subaru-negative-battery-cable-2002-2007-wrx-sti)

## Related Files

- Alternator decision: `alternator-decision-notes.md`
- Cooling system: `cooling-system-notes.md`
- Build memory: `/Users/alan/.claude/projects/-Users-alan-Documents-WRX/memory/project_engine_build.md`
