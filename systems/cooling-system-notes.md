# Cooling System Notes — 04 WRX + 07 EJ257 + 06 STI Intake

**Date:** 2026-05-23
**Build:** 2004 USDM WRX wagon chassis + 2005-era EJ257 short block + 2006 STI intake manifold
**Donor parts source:** 2004 WRX (original cooling hard lines being reused)

## Coolant Flow — Two Key Hard Lines

### 1. Front Crossover Pipe (Subaru PN 14050AA450 / superseded to 14050AA451)

Runs across the front of the heads. **SUPPLIES (feeds) coolant to:**
- Heater core (supply hose to firewall)
- Throttle body (supply hose — TB anti-icing)
- Plus main radiator/thermostat circuit

### 1b. Upper Pipe Assembly — "Pipe-Water Tank" (Subaru PN **21141AA131**)

Pair of metal pipes sitting directly **above** the front aluminum coolant crossover. OEM assembly contains TWO independent runs sharing the same bracketed assembly:

- **Coolant passage** — connects the **Engine Coolant Filler Tank (ECFT)** to the **coolant bypass return** (14065AA250 / water pump inlet side). Acts as the ECFT drain/return path so condensed vapor flows back to the low-pressure pump inlet. ← **USING THIS**
- **PCV/breather run** — connects left + right valve covers to the center crankcase breather ← **NOT USED — IAG AOS replaces OEM PCV entirely**

The ECFT is the small high-point fill reservoir mounted above the engine. Necessary on turbo EJs because the turbo sits higher than the radiator filler neck — the ECFT lets you bleed air and fill from the highest point in the cooling circuit. Killer B UTCRv2 is the aftermarket upgrade.

Plan: cap/delete the PCV breather portions of this assembly; only the ECFT-to-bypass-return coolant passage remains functional.

**Part selection: 21141AA131 (06-14 era), NOT 21141AA122 (04-05 era).** Decision date: 2026-05-28.

Reasoning:
- Heads are **V25B (2007 USDM EJ257)** — confirmed via casting mark, single AVCS
- V25B heads inherit the 06+ PCV port layout (the 06 MY refresh introduced new head castings AB860/AB910 with different PCV port spacing)
- AA131's PCV ports align with V25B head geometry; AA122 would not
- Since PCV is being capped anyway (IAG AOS), PCV port alignment isn't functionally critical, BUT the mounting bracket geometry on AA131 is the era-match for V25B heads
- AA131 also ~$50 cheaper than AA122

Frankenstein engine note: 05 short block + V25B (07) heads + 04-05 STI intake manifold. Mixed-era build, so picking AA131 prioritizes head-era match (which is where PCV ports + likely bracket-feet alignment live).

Supersession history: 21141AA120 → 21141AA122 (04-05 era) → 21141AA131 (06-14 STI / 06-07 WRX, current for V25B+ heads)

### 2. Black Hard Line — Water Bypass Pipe (Subaru PN 14065AA250)

Runs horizontally under/behind the intake manifold, low on the driver side, to the water pump inlet. **PULLS (returns) coolant from:**
- Heater core return
- Throttle body return

Terminates at water pump suction/inlet side, completing the bypass/heater loop.

## Flow Summary

```
Crossover pipe (14050AA450/451)
    ├──> Heater core supply ───> [heater core] ───┐
    ├──> Throttle body supply ─> [throttle body] ─┤
    └──> Main rad circuit                          ▼
                                          Bypass pipe (14065AA250)
                                                   │
                                                   ▼
                                          Water pump inlet
```

## Donor Parts Decision

Using **both 04 WRX hard lines** (14050AA451 crossover + 14065AA250 bypass) on the EJ257 + 06 STI intake combo. Physically verified to fit — does not foul the 06 intake manifold.

Subaru did revise both parts at the 06 MY refresh:
- Crossover: 14050AA451 → **14053AA550** (06-21)
- Bypass: 14065AA250 → **14065AA290** (06-07)

But the 04 versions fit this build per physical mockup. PN supersession does not always mean geometry change that affects fitment.

## Hoses to Replace (22-year-old original rubber)

Original 04 WRX rubber coolant hoses being replaced as part of the build:

| Hose | PN(s) | Notes |
|------|-------|-------|
| Bypass-to-water-pump-inlet hoses (×2) | 807615182, 807612011 | Confirmed PNs from donor |
| TB coolant hoses (×2 — supply + return) | **21204AA850** (same PN for both source and sink) | Confirmed — order 2× of this PN |
| Heater core hoses (firewall) | TBD | While-you're-in-there refresh |
| Bleed/expansion tank lines | TBD | While-you're-in-there refresh |

## Open Items

- Source clamps (spring or Norma constant-tension preferred over original worm-gear)
- Verify heater core hose PNs + bleed/expansion tank line PNs

## External References

- **[RJES — Cooling a Subaru Engine in a VW](https://rjes.com/cooling-a-subaru-engine-in-a-vw/)** — excellent deep-dive on Subaru EJ cooling system architecture, hard line routing, ECFT/expansion tank plumbing, and bleed procedures. Written for VW conversions but the Subaru-side info applies directly to any EJ swap/build.

## Related Files

- Build memory: `/Users/alan/.claude/projects/-Users-alan-Documents-WRX/memory/project_engine_build.md`
- Alternator decision: `alternator-decision-notes.md`
- Flex fuel sensor bench test: `flex-fuel-sensor-bench-test.md`
