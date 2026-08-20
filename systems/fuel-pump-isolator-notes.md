# Fuel Pump Vibration Isolator — DW400 in OEM Fuel Hanger

**Date:** 2026-05-27
**Build:** 2004 WRX wagon + 2005-era EJ257 + DW400 fuel pump upgrade
**Problem:** OEM rubber pump isolator broke down in fuel tank over time (likely NBR + E10 degradation) AND no longer fits the larger DW400 pump body.

## Solution: Custom-trimmed FKM/Viton disc

### Why NOT 3D-printed TPU/TPE

Research 2026-05-27 conclusively ruled out 3D-printed flexibles for continuous E85 fuel submersion:

- **NinjaFlex (NinjaTek):** manufacturer rates ethanol as "C / not recommended"
- **Polymaker / BASF / eSun / FilaFlex TPU:** all share Lubrizol Estane M95A chemistry, which Lubrizol rates **"4 = Severe / Not Recommended" for E85**, with >30% tensile loss and 25-35% volume swell after 4-week submersion
- **Pebax (PEBA) filament:** least-bad flexible option but printed-part porosity accelerates uptake, no published E85 data on the printed version
- **Realistic failure timeline for generic TPU in E85:** noticeable swell in days, structural failure in 1-3 months. Pump vibration accelerates further.

Failure mode = debris in fuel system → clogged filter or destroyed pump. Same failure mode as the OEM rubber piece being replaced. Not worth repeating.

### Why FKM/Viton

- **OEM fuel system elastomer standard** — SAE J30 R9/R11 hose uses FKM inner liner specifically because nitrile/TPU degrade in ethanol blends
- **Continuous E85 submersion verified safe** — Chemours and other FKM manufacturers explicitly rate FKM for ethanol/methanol/gasoline blends
- **Vibration isolation appropriate** — Shore A 75 = correct hardness range for pump damping

### FKM vs Viton terminology (resolved)

- **FKM** = ASTM/ISO generic class name for fluoroelastomer
- **Viton** = Chemours brand name for FKM (originally DuPont 1957, spun off to Chemours 2015)
- All Viton is FKM. Other brand names exist (Daikin Dai-El, 3M Dyneon, Solvay Tecnoflon)
- Standard "FKM Type A" (66% fluorine) is plenty for fuel applications — no need for premium GFLT or FFKM

## Part Ordered

**McMaster-Carr PN 1084N72** — ordered 2026-05-27

| Spec | Value |
|---|---|
| Material | Viton® Fluoroelastomer (real Chemours, made in US) |
| Shape | Disc |
| Diameter | 3" |
| Thickness | 1/8" |
| Backing | Plain (no adhesive) |
| Temperature range | -20°F to 400°F |
| Max pressure | 100 psi |
| Color | Black |
| Chemical resistance | Confirmed |
| Compliance | DFARS, REACH, RoHS 3 |
| McMaster description | "resist boric acid, citric acid, isopropyl alcohol, **fuel**, and oil. Cut with scissors or a utility knife." |

## Install Plan

1. Remove old OEM rubber isolator from fuel hanger
2. Measure the cup/cavity dimensions in the hanger that hold the isolator
3. Measure the DW400 pump body OD where it contacts the isolator
4. Trace and trim the Viton disc to fit:
   - **OD:** snug fit in hanger cavity
   - **ID (if grommet-style):** snug fit on DW400 pump body
   - **Thickness:** 1/8" should be adequate; can stack two if more isolation needed
5. Test fit before final install — Viton is firm so dry-fit may not show full compression
6. Install pump + new isolator in hanger
7. Verify hose clamps reach properly with new isolator thickness

## Trim Tools / Technique

- **Sharp utility knife** with fresh blade — Viton cuts cleanly when blade is sharp
- **Cutting mat** under the work surface
- **Trace pattern** from old isolator if intact, OR measure cavity + pump and draw new pattern
- **Hole punch set** (Harbor Freight ~$10) if center hole needed for pump body
- Take cuts slowly — Viton will shred if you saw at it

## Spares

3" disc gives plenty of material for 2-3 isolators if first attempt doesn't fit right. Keep scraps for future use (gaskets, washers, isolators on other projects).

## Pump Mounting Bracket Plan (2026-05-27)

### Approach: Stainless ball-lock cable ties + Viton tape cushion

Rejected approaches:
- 3D-printed flexible — fails in E85 (covered in main material discussion above)
- Aluminum strap — ethanol attacks aluminum over time
- Tooth-lock cable ties — can ratchet loose under vibration
- Fabricated 316 SS flat strap — works but more fabrication than needed

### Bill of materials

| Item | Spec | Source | Status |
|---|---|---|---|
| Viton tape (cushion) | **McMaster PN 9473K671** — 1/16" × 3/8" × 48" adhesive-back, Viton 75A, 32-150°F adhesive limit | McMaster | ✅ Ordered 2026-05-27 (verify in box — call-in add-on, no confirmation email) |
| Viton disc (bottom isolator) | 3" × 1/8", McMaster PN 1084N72 | McMaster | ✅ Ordered 2026-05-27 |
| **Stainless ball-lock cable ties** | **316 SS, 1/4" wide, length TBD pending measurement** | McMaster | 🟡 Pending measurement |
| **Stainless mounting tab** (if hanger lacks anchor feature) | **316 SS, ~1" × 1/2"** | McMaster | 🟡 Pending hanger inspection |
| Cable tie tensioning tool | Generic or Panduit GS2B | Harbor Freight, McMaster, Amazon | 🟡 Pending order |
| M5 or M6 stainless bolts (if mounting tab needed) | 316 SS + nyloc + washers | McMaster, hardware store | 🟡 Pending |

### Measurements needed before final order

1. **DW400 pump body OD** — verify the 1.8" spec
2. **Hanger anchor point** — does the OEM hanger have an existing feature (slot/hole/tab) that a cable tie can loop through? If yes, skip the mounting tab. If no, plan for adding a stainless tab.
3. **Strap length formula:** `(π × effective diameter) + (2 × anchor crossings) + 3-4" margin`
   - For 1.8" pump + 1/16" Viton wrap (= 1.93" effective): ~10-12" cable tie length
   - Order one size up — extra tail is trimmed; too-short ties can't be extended

### Install sequence

1. Wrap pump body with 1/16" Viton adhesive tape (full circumference where bracket clamps, ~1" wide band)
2. Wrap 2× stainless ball-lock cable ties around the Viton-wrapped pump
3. Loop cable ties through hanger anchor feature OR through stainless mounting tab bolted to hanger
4. Tension with tensioning tool, cut tail flush (no sharp edges in tank)
5. Verify Viton bottom disc (1084N72, trimmed to fit) is seated in hanger cup
6. Lower pump into hanger, confirm Viton disc engages bottom of pump
7. Fuel hose connection at top provides axial retention

### Vibration isolation summary (3 contact points)

| Contact point | Isolation |
|---|---|
| Pump bottom ↔ hanger cup | 1/8" Viton disc (trimmed from PN 1084N72) |
| Pump body ↔ cable tie clamp | 1/16" Viton tape wrap |
| Hanger tab ↔ hanger surface (if tab added) | Viton washers (sandwich, cut from disc scrap) |

All three contact points isolated; no metal-to-metal between pump and hanger.

## Confidence Flags

- **Confirmed (McMaster spec sheet):** PN 1084N72 is real Viton, fuel-compatible, sized 3" × 1/8"
- **Confirmed (industry practice):** FKM is the OEM material for E85 fuel system elastomers
- **Confirmed (research):** TPU/TPE 3D-printed filaments are not suitable for E85 submersion
- **Inferred:** Shore A hardness ~75A (McMaster's "Viton sheet" is typically 75A but not explicitly listed on this disc spec — verify on receipt if hardness matters)

## Related Files

- Build memory: `/Users/alan/.claude/projects/-Users-alan-Documents-WRX/memory/project_engine_build.md`
- Other notes: `cooling-system-notes.md`, `electrical-grounding-notes.md`, `alternator-decision-notes.md`, `flex-fuel-sensor-bench-test.md`

## Sources

- [McMaster-Carr PN 1084N72](https://www.mcmaster.com/1084N72/)
- [Lubrizol Estane M95A E85 compatibility — severe degradation](https://forerunner3d.com/tpu-chemical-compatibility-resistance-for-3d-printed-parts/)
- [NinjaFlex Chemical Resistance Guide — ethanol "C / not recommended"](https://ninjatek.com/wp-content/uploads/NinjaFlex_CR.pdf)
- [Arkema Pebax Chemical Resistance chart](https://hpp.arkema.com/files/live/sites/shared_arkema/files/downloads/HPP/product-brochures/Pebax/2025-07-Pebax-Chemical-Resistance-chart.pdf)
