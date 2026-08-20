# Turbo Research Notes — 2007 STI EJ257

Target: ~500whp on E85, stock-location only (no rotated mount).

## Selected Build

### Turbo: FP STi Red HTZ (used) — $1,050
- Part no: R690701874
- Seller: Robbie Corathers / The Chop Shop (TCS), Akron OH (chop-shop.org)
- Specs: Welded turbine, 10cm hot side, billet compressor, journal bearing, 84mm FAP cover
- STi-specific flange (bolts to OEM up-pipe/downpipe)
- **Provenance: 15k miles, street driven** — ~15–25% of expected turbo life used, low-stress duty cycle
- Reason for sale: previous owner upgraded to rotated kit with bigger turbo
- Condition: clean compressor & turbine, no oil residue, no damage
- Negotiated from $1,150 → $1,050 (68% of new $1,549 MSRP)
- **Does NOT include actuator** — reuse OEM STi actuator if healthy, or budget ~$80–$120 for replacement

### Seller notes — TCS / Robbie Corathers
- ✅ 98% Facebook rec rate (46 reviews), active eBay store, established Akron brick-and-mortar
- ✅ Subaru-only specialist with public reputation to protect
- ⚠️ **No-return policy** — must inspect within 60 days; shipping damage reported on delivery
- ⚠️ Used-parts reseller model — provenance/mileage approximate
- Pay via PayPal G&S or eBay direct for buyer protection — NOT F&F or Zelle

### Pre-purchase checks
- [ ] Spin shaft by hand: zero axial play, minimal smooth radial play
- [ ] Visual: no cracks on turbine housing, exhaust flange flat
- [ ] Compressor wheel close-up: no nicks/dings on blade tips
- [ ] Mounting hardware: actuator bracket still on compressor housing
- [ ] Get "no known issues, sold as working" in writing
- [ ] Ask for any spare gaskets, oil/coolant lines, hardware
- [ ] Ask if he kept the original actuator he pulled

### Fuel system
- **Injectors:** DeatschWerks 1500cc (DW1500) — tuner-recommended over ID1300 due to good cheap source for DW
  - Alternative considered: ID1300 (also tuner-suggested)
  - DW 1200cc would also work (~570whp capacity at 80% IDC on E85), 1500cc gives more headroom
- **Pump:** DW400 (415 lph) — DW300 borderline for 500whp E85
- **Lines:** stock fine to ~500whp E85, check OEM rubber flex section

## Candidate Turbos

| Turbo | Flow (lb/min) | Peak whp | Spool feel |
|---|---|---|---|
| Blouch 20G-XT-R | ~46 | ~430–460 | early-mid |
| Blouch 2.5XT-R | ~49 | ~430–490 | mid-late |
| FP Red HTZ | ~60 | ~480–520 | mid-late |
| FP XR Red (Xona) | ~60 | ~500 | mid (better than HTZ) |
| BPT EFR 6258 | ~47 | ~430–450 | very early (Gamma-Ti) |
| BPT EFR 6758 | ~58 | ~500–550 | early-mid (best-in-class spool for the flow) |

## Top Picks for 500whp Target

- **Best spool/response:** BPT EFR 6758 or FP XR Red
- **Best value/proven:** Blouch 2.5XT-R or FP Red HTZ
- **Best if you want to leave headroom but not overshoot:** FP XR Red — hits 500 cleanly, spools well, modern aero

## Detail Notes

### Blouch 20G-XT-R
- 60mm turbine / 68mm 20G compressor wheel
- Popular "in-between" choice — Red-ish power with slightly better midrange
- Pump/E85 hybrid friendly, do-it-all street car

### Blouch 2.5XT-R
- 60mm turbine / 71mm XT compressor, ~49 lb/min, ~490hp rated
- E85: high 300s–low 400s whp on stock blocks; ~480–490 with supporting mods
- More lag than smaller XT-Rs, strong top end
- 8cm housing = quicker spool, 10cm = better top end

### FP Red HTZ
- 57.3/79mm wheel, 84mm FAP cover
- Onset ~4500–4800 rpm, pulls hard to redline
- Journal or BB CHRA available
- Proven, tons of tuner data

### 84mm Compressor Cover (FAP)
- **What it is:** Compressor cover (intake-side housing) with 84mm inlet diameter vs stock ~63mm. "FAP" = Flow Advancement Port (FP's ported-shroud design).
- **Why it matters:**
  - Lets the 79mm HTZ wheel hit its full ~60 lb/min flow without inlet bottleneck
  - Ported shroud widens compressor map, improves surge margin at high boost / low flow
  - Compressor stays efficient further into its map at higher pressure ratios
  - Slightly faster spool from reduced inlet restriction
- **Required supporting mod:** 3" silicone reducer + 3" inlet pipe (Cobb, Process West, GrimmSpeed) — stock 2.36"/60mm intake won't seal. Budget ~$80–$200.

### Power & spool implications of the 84mm cover (vs smaller stock cover)
- **Power:** Unlocks the wheel's full flow ceiling. Without an 84mm cover, an HTZ Red would choke around 450whp regardless of boost. With it, the full ~500whp target is achievable.
- **Spool:** Slightly faster than the same wheel in a stock-size cover (less inlet drag, ported shroud helps surge). Net effect is small — maybe 100–200 rpm earlier onset — but the bigger story is **flatter, more usable boost up top** rather than dropping off after peak.
- **Tradeoff:** None functionally — the only "cost" is needing the 3" inlet pipe. There's no spool penalty from going to the bigger cover.

### FP XR Red (Xona)
- Xona Rotor 65·64S wheel, BB only
- Same ~500whp peak as HTZ Red but spools 300–500 rpm sooner
- Modern aero, broader compressor map, flatter torque curve
- Generally the better pick vs HTZ Red unless you specifically want journal bearing

### BPT EFR 6258
- BorgWarner EFR core in stock-location housing
- Gamma-Ti turbine — fastest-spooling for the flow class
- ~430–450whp ceiling, leaves some peak on the table for a 500 target

### BPT EFR 6758
- BorgWarner EFR 6758 core, stock location
- ~500–550hp capability with class-leading spool/transient response
- Premium price, smaller community, less tuner data than Blouch/FP
- Verify oil/coolant line and inlet routing for true bolt-on fit

## Eliminated (off the table)

- **Rotated-mount options** (Garrett GTX2867R, Garrett G-series, EFR 6258/6758/7163 on rotated manifold) — not interested in manifold work
- **FP Green UHF** — too small, ~400whp ceiling
- **Blouch 1.5XT-R** — too small for 500 target
- **FP Black HTZ / Blouch 3.0XT-R / FP XR Black** — overkill for 500, leaves spool on the floor for headroom not being used

## Key Comparisons

### FP HTZ Red vs FP XR Red
Same ~500whp ceiling. XR uses Xona Rotor wheel aero — newer, spools sooner, holds efficiency over a wider range, BB only. HTZ is older proven design with more tuner data and a journal-bearing option.

### Blouch vs BPT
- **Blouch**: Custom CHRAs in OEM-style Subaru housings (VF/TD0X frames). Long-standing, well-supported, broad dyno data. ~$$.
- **BPT (Boost Performance Products)**: Builds on BorgWarner EFR cores in stock-location adapter housings — modern Gamma-Ti wheel tech without rotated mount. Boutique, premium price, smaller community. ~$$$.
- For 500whp target, Blouch 2.5XT-R = obvious pick with most peer data; BPT EFR 6758 = better spool for meaningfully higher cost.

## Timing Belt Kit Selection

### Engine context (drives the decision)
- **Forged internals** (rods/pistons) — capable of sustained 8000+ rpm
- **Cosworth B25 heads** with **oversized valves** (likely upgraded valve springs = stiffer = more belt-side load)
- **Stock cams** (OEM single-AVCS pulleys reliable, no need for adjustable gears)
- **OEM head gasket** (cam-to-crank geometry should be near-stock)
- **Oil pump:** JDM Spec C 12mm (oversized, matches built motor needs)
- **Oil pan:** IAG (baffled, track-ready)
- **Turbo oil feed:** Moroso stainless braided line — verify NO restrictor (journal bearing needs full flow)
- **Oil cooler:** Deferred — running OEM oil-to-coolant exchanger only. Re-evaluate if track oil temps consistently hit 260°F+
- **Required for deferred cooler strategy:** install oil temp gauge BEFORE first track day (AEM/ProSport ~$80–150). Watch zones: <230°F good / 230–260°F monitor / 260+°F cool-down lap / 280+°F pit immediately
- **Use case:** track-driven + monthly commute (track abuse, not pure street)

### Context (per Flatirons Tuning blog)
- **Gates kits no longer recommended** — components (tensioners, idlers) went to Chinese sourcing ~2018, only the Gates belt itself remains quality
- **HKS belt is made by Gates** — equivalent to their Racing belt (400% stronger than OE)
- **STI Kevlar belt** = most durable option, originally developed for Subaru WRC car
- **Stock OEM cam pulleys** are reliable for non-aggressive cams (skip alloy/adjustable upgrades)
- **Eccentric idler pulleys** only needed if running decked heads or thicker head gaskets
- **RCM High Grip tensioner** = race-spec, justified for track use + stiff valve springs; reusable across services
- **Adjustable cam gears** only needed for aftermarket cams or race tuning

### Final selection

**Buy: RCM High Grip Tensioner & STI Kevlar Timing Belt Kit — $984.76**
- High Grip tensioner (track-rated, reusable, prevents belt slap with stiffer springs)
- STI Kevlar belt (WRC-spec, top-tier durability)
- Includes idlers/pulleys
- Only $20 more than the HKS-belt version — easy call for track + built motor

### Add-ons (NOT in the kit)
| Item | Price |
|---|---|
| RCM Black Series Water Pump & Low Temp Thermostat - 3 Port (bundled) | ~$170–220 |
| Crank seal + cam seals (×4) | ~$50 |
| Coolant | ~$30 |
| **Total with kit** | **~$1,235–$1,285** |

### Why RCM Black Series WP + Low Temp Thermostat 3-Port bundle
- **3 Port** = correct config for USDM 2007 STI manual trans (NOT the 2-Port Auto/Spec C version)
- Cast/billet impeller (vs OEM stamped steel blades) — eliminates cavitation at high RPM
- No risk of impeller separation (known OEM failure mode at 80–100k mi)
- Better high-RPM flow characteristics for track use
- 70°C low-temp thermostat opens 6°C earlier than OEM ~76°C — better cooling margin on track
- E85 burns cooler than gas — low-temp thermostat reinforces the margin
- Bundle saves ~$20 vs buying pump + thermostat separately
- Tradeoff: cold starts take longer to reach operating temp (5-10 min more in cold weather)

### Verify before install
- Confirm with engine builder whether heads or block were decked during assembly
- If decked >0.010" → add eccentric idler pulleys (~$200-250) for cam alignment correction
- If clean-up cut only or no decking → standard install, no eccentrics needed
- Practical fallback: trial-fit timing belt with stock idlers, rotate crank 2 full revolutions, check cam pulley alignment marks at TDC. If off >1/4 tooth on either bank → install eccentrics

### Skipped for this build
- ❌ Adjustable cam gears (stock cams)
- ❌ Alloy cam pulleys (stock cams, OEM AVCS reliable)
- ❌ Eccentric idler pulleys (OEM head gasket, pending builder confirmation on decking)
- ❌ Aisin/OEM kits (insufficient for track use with stiff springs + high RPM capability)
- ❌ Carbon timing belt cover (cosmetic)
- ❌ Light Weight Pulley Kit / Fluidampr (different component — crank pulley/damper)
- ❌ IAG Timing Guide kits (paying for branding without High Grip tensioner)

### Runner-up if budget matters
RCM High Grip Tensioner & HKS Timing Belt Kit — $965.24
- Save $20 vs Kevlar
- HKS belt = Gates Racing (made by Gates), 400% stronger than OE
- Still excellent for the use case

## ECU & Sensors

### ECU: Link G4X Fury SubaruLink PnP
- Tuner recommendation; right fit for 500whp street/track build (Link suitable to ~600–700 HP)
- Haltech Elite would be overkill below 700 HP / non-pro racing
- PnP installs into factory metal ECU case, reuses factory connectors → no harness mods, looks stock
- All factory sensors continue working (MAF, MAP, IAT, knock, AVCS)
- Adds analog inputs for flex / FP / OP sensors below
- CAN bus retains factory dash gauge function
- Free PCLink tuning software

### Required sensors (factory ECU can't read these)
All three have native PCLink built-in calibrations. Tuner will build the harness.

| Sensor | Recommended Part | Price | Purpose |
|---|---|---|---|
| **Flex Fuel** | GM/Continental 13577429 + housing/harness | ~$150 | Real-time E85 ethanol % — pump E85 varies 51–83%; ECU compensates dynamically |
| **Fuel Pressure** | Link PS150 (or AEM 0-100 PSI) | ~$120–130 | Detect failing pump/clogged filter before fueling fails; critical with DW400 sized close to 500whp E85 demand. Plug-in PCLink calibration |
| **Oil Pressure + Temp** | **Link CPTS-2 (combined sensor)** | ~$200 | Replaces binary OEM oil pressure switch. **Doubles as oil temp gauge** — kills the standalone oil temp gauge requirement for the deferred-oil-cooler strategy in a single sensor |
| AN fittings, T-fittings, wiring | misc | ~$80 | (tuner-built harness) |

**Sensors total: ~$550**

### Why Link CPTS-2 over separate AEM oil pressure sensor
- Combined pressure (10 bar / 145 psi) + temperature (-40 to 140°C) in one sensor
- Eliminates need for separate oil temp gauge (saves ~$80–150)
- Single sensor port = simpler plumbing
- ECU can log + protect on both readings
- Native PCLink calibration

### Cost rollup
| Item | Price |
|---|---|
| Link G4X Fury SubaruLink PnP | $1,800–2,200 |
| Tune development | $800–1,500 |
| 3 sensors + fittings (Link CPTS-2 + PS150 + Continental flex) | ~$550 |
| Install labor (tuner-built harness) | $300–600 |
| **Total ECU + sensors + tune** | **~$3,450–$4,850** |

### Install notes
- Flex sensor mounts inline on fuel return line (-6 or -8 AN housing required)
- Fuel pressure sensor mounts on fuel rail via T-fitting (1/8" NPT)
- Oil pressure + temp (CPTS-2) T-fits at OEM oil pressure switch location (keep OEM switch for dash light) or replaces switch entirely
- Tuner is building the harness — handles analog input routing and any expansion harness needs

## Exhaust Manifold + EWG Selection

### Situation
Killer B Holy Header used bundle ($1,600 shipped — V-band, SwainTech, 18k mi, includes EWG uppipe + Turbosmart CompGate 40mm V-band) was in pursuit but seller has local buyers ahead. **Likely lost — need Plan B.**

If the Killer B bundle ever comes back, take it: $1,600 was a great deal vs ~$2,950-3,200 new equivalent.

### Header options for 500whp E85 track use

| Tier | Header | Material | Price (new) | Verdict |
|---|---|---|---|---|
| **Premium** | Killer B Holy Header (HH-2BOLT or V-band) | **321 SS** w/ cast 347 merge collector | $1,689-1,900 | **Best for track** — lifetime warranty if new, dyno-proven (made +power w/ -3 psi vs Tomei) |
| **Mid (proven)** | Tomei Expreme EL | 304 SS | $700-900 | Acceptable floor — known O2 bung + slip joint failure modes under hard track abuse |
| **Mid (newer)** | PLM EL Header | 304 SS | $995 | Awkward middle — same material as Tomei but higher price, less track-validated |
| **Budget-named** | HKS EL | **409 SS** | ~$500 | Skip — material too cheap (409 SS oxidizes/cracks under track EGT) |
| **eBay generic** | No-name | Mystery alloy | $200-400 | Skip — known to crack 3-5 yrs even on street |

**Material grade matters at 500whp E85 EGTs (1500-1700°F):**
- 321 SS designed for sustained thermal cycling (race-spec)
- 304 SS adequate but susceptible to crack propagation over hundreds of heat cycles
- 409 SS too low-grade for sustained track temps

### EWG uppipe considerations
- **Bolt vs V-band:** V-band more reliable under thermal cycling, fewer gasket failures, easier service. **Worth the small premium for a track car.**
- **Wastegate flange size must match wastegate** (38mm, 40mm, or 44mm)
- Killer B EWG uppipe: ~$300 add-on, brand-matched to header
- Generic V-band EWG uppipes: ~$385 (Ultimate Racing, SMY, etc.)

### External wastegate options

| WG | Size | Position Sensor | Notes | Price |
|---|---|---|---|---|
| **Tial MV-R 44mm** | 44mm V-band | **Optional (3-wire Hall)** | Gold standard; sensor enables Link closed-loop boost on actual gate position | $450-600 (sensor +$80-150) |
| **Tial MV-S 38mm** | 38mm flange | No | Workable for FP Red — community data shows 38mm holds boost at 36 psi on Red | $300-400 |
| **Turbosmart HyperGate45** | 45mm V-band | **Optional** | Comparable to MV-R, full feature set | $400-500 |
| **Turbosmart CompGate 40mm** | 40mm V-band | **NO option** | Entry tier of premium brand; gives up Link closed-loop on gate position | $360-400 |

**For Link standalone build:** Tial MV-R 44mm w/ position sensor is the right spec — Link can use the position feedback for closed-loop boost control (more precise vs MAP-only). CompGate 40mm gives up this benefit.

**Spring sizing:** Target ~1.0 bar (14.5 psi) base spring for ~28-30 psi peak target. Spring close to ~50% of peak target gives the BCS controller authority in both directions (add boost above spring, drop below for low-grip conditions).

### Three paths forward

#### Path A: Wait for another used Killer B bundle (recommended)
- Used Killer B market is bigger than it seems — bundles come up regularly
- **Watch:** IW STi classifieds, NASIOC marketplace, eBay saved searches, FB Marketplace beyond local radius, Reddit r/Subaru_Performance
- Typical used pricing for Killer B Holy Header alone: $900-1,200 shipped (no coating)
- With SwainTech: $1,200-1,500 shipped
- Patient watch 2-4 weeks, exhaust isn't blocking other build work
- Pair w/ new Tial MV-R 44mm + sensor ($500-600) = $1,500-2,100 total

#### Path B: Buy new Killer B + Tial MV-R (if no patience for waiting)
- Killer B Holy Header (HH-2BOLT) new: $1,689
- Killer B EWG uppipe: $300
- Tial MV-R 44mm w/ position sensor: $500-600
- **Total: $2,489-2,589 new, bare**
- Optional SwainTech post-purchase: +$300-400 (ship to SwainTech direct before install)
- Upside: lifetime warranty on header (transferable? probably original purchaser only)

#### Path C: Tomei + budget gate (cost-constrained fallback)
- Tomei Expreme EL: $700-900
- Generic V-band EWG uppipe (38mm): $385
- Tial MV-S 38mm: $300-400
- **Total: $1,385-1,685**
- Compromises: 304 SS material (less track-durable than 321), no position sensor (manual boost control), known Tomei track failure modes (O2 bungs, slip joints)

#### Skip: PLM-based path
- PLM new $995 + uppipe $385 + Tial MV-R w/ sensor $500-600 = $1,880-1,980
- Same material grade as Tomei ($700-900) at higher price
- No track-validation advantage over Tomei
- Awkward middle tier — go cheaper (Tomei) or step up to Killer B's better material

### Decision framework

- **If used Killer B bundle re-emerges at $1,600 shipped or less:** take it (Path A)
- **If 2-4 weeks of waiting pass with no good used deal:** buy new Killer B (Path B)
- **If budget collapses below $2k for header system:** Tomei route (Path C), accept the durability tradeoff
- **Don't:** PLM (awkward middle), HKS (bad material), eBay generic (cracks)

### Inspection checklist for any used header purchase
- [ ] Crack inspection at all welds, especially merge collector + O2 bung welds
- [ ] Head flange faces — chips at flange seat = leak risk
- [ ] V-band sealing surfaces — galling, scoring, deformation
- [ ] Coating condition (if Swain/ceramic) — flaking is bad, discoloration is normal
- [ ] Track vs street mile breakdown from seller
- [ ] Photos of all critical surfaces before payment
- [ ] PayPal G&S or eBay direct payment (NOT F&F)
- [ ] Insurance + signature delivery on shipping

### Wastegate inspection (used)
- [ ] Pull cap, inspect valve seat for pitting (deal-breaker if present)
- [ ] Diaphragm condition — no oil saturation, no cracks
- [ ] Stem movement smooth, no binding
- [ ] Spring identification (which pressure installed)
- [ ] V-band clamps included + not warped

## Sources

- [FP Red product page](https://www.forcedperformance.shop/products/fp-red-for-subaru-wrx-sti)
- [FP Green UHF](https://www.forcedperformance.shop/products/fp-uhf-green-for-subaru-wrx-sti)
- [FP Red vs XR Red HTZ vs Green HTZ — IWSTI](https://www.iwsti.com/threads/fp-red-vs-fp-xr-red-htz-vs-fp-green-htz.315722/)
- [Blouch Dominator 2.5XT-R — wrxdaily](https://wrxdaily.com/products/blouch-dominator-2-5xt-r-10cm-2-3-inlet-turbo)
- [Blouch 2.5 XTR on stock internals — IWSTI](https://www.iwsti.com/threads/blouch-2-5-xtr-on-stock-internals.282358/)
- [Blouch Dominator 3.0XT-R 10cm 3" — SubiSpeed](https://www.subispeed.com/products/blc-dom3-0xtr10cm-2-3-blouch-dominator-3-0xt-r-10cm-2-turbo-3in-inlet)
- [Flatirons Aisin Kit](https://www.flatironstuning.com/aisin-timing-belt-kit-water-pump)
- [Flatirons RCM OEM Kit](https://www.flatironstuning.com/sen1158)
- [Flatirons RCM Kevlar Kit](https://www.flatironstuning.com/sen1166)
- [Flatirons "Best Subaru Timing Belt Kit" blog](https://www.flatironstuning.com/blog/what-is-the-best-subaru-timing-belt-kit)
- [Flatirons EJ Turbo Timing Upgrades blog](https://www.flatironstuning.com/blog/subaru-ej-turbo-timing-component-up-grades)
