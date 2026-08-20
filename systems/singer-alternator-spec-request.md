# Singer Alternators — ✅ ORDERED

> **OUTCOME 2026-08-20: went with Singer's 200A (220A peak), $449.**
> Denso case, direct replacement for stock PN **23700AA430**. **150A idle output.** Ships with a **14.8V regulator** — Singer's answer to question 5 below, specced knowing the battery is an Interstate MTX-35 AGM.
>
> Recorded in `as-built/parts.csv`. Supersedes both options in `alternator-decision-notes.md`.
>
> Remaining check: confirm **pulley diameter + groove count** with Singer for belt sizing.

## Original spec request

**Purpose:** Provide Mike Singer with the full electrical load picture so he can confirm the 200A unit is the right pick (vs 180A or stepping up to 220A).

**Recipient:** msingeralternator@gmail.com
**Date drafted:** 2026-05-31

---

## Email-ready content

> **Subject:** Spec request — 02-05 WRX 200A HO alternator for high-output build + moderate audio
>
> Hi Mike,
>
> I'm building a 2004 Subaru WRX (USDM) with a 2005-era EJ257 swap, Link G4X standalone ECU, and a 600-700W RMS audio system. Mostly street/track use, not an SPL build. Engine-bay mounted Interstate Group 35 AGM battery, Big 3 wiring planned in 1/0 OFC with 250A ANL fuse.
>
> Looking at your 200A unit ($449) on the 02-05 Impreza 2.0L core (OEM PN 23700AA430). Wanted to confirm fitment and sizing with you before ordering. Full load breakdown below.
>
> **Vehicle / charging context**
>
> - 2004 USDM WRX wagon, EJ257 swap, MT
> - OEM alternator core: 23700AA430 (Mitsubishi small case, 90A stock)
> - Battery: Interstate MTX AGM, Group 35 (engine bay, OEM location)
> - Big 3 in 1/0 OFC, fully upgraded
> - Use case: 70% street, 30% track; audio rarely cranked at idle
>
> **Engine-only continuous load (≈ 60-80A)**
>
> | Component | Draw |
> |---|---|
> | DW400 fuel pump @ 50-80 psi | 17-20A |
> | DW1500 injectors (×4 high-Z) | 4-8A |
> | Ignition coils (×4 NGK) | 4-8A |
> | Link G4X ECU + sensors (knock, MAP, wideband, FlexFuel, oil pressure, etc.) | 3-5A |
> | Dual electric cooling fans (full speed) | 15-25A |
> | Switched-IG accessories (gauges, fuel pump relay, etc.) | 5-10A |
>
> **Audio system (≈ 85-95A peak combined)**
>
> | Component | Power | Current |
> |---|---|---|
> | Boss R1100M monoblock → 2× 10" subs @ 2Ω | ~400-500W RMS | 45-55A |
> | Rockford Fosgate Punch P400-4 → door speakers @ 4Ω | 200W RMS (CEA-2006) | ~25-30A |
>
> **Combined scenarios**
>
> | Scenario | Total draw |
> |---|---|
> | Engine + audio off (track) | 60-70A |
> | Engine + normal listening | 85-105A |
> | Engine + heavy listening | 105-125A |
> | Engine + cranked peaks (rare, brief) | **145-165A** |
>
> **What I want to confirm with you**
>
> 1. Is the 200A unit the right pick for this load profile, or would you push me to 220A for headroom?
> 2. What's the published idle output on the 02-05 WRX 200A unit at ~800 RPM?
> 3. Is the unit a hairpin stator? (Trying to understand low-RPM behavior.)
> 4. Lead time on the 02-05 WRX 200A from order to ship?
> 5. Which voltage regulator setpoint do you recommend for an AGM battery and Link G4X?
>
> Appreciate any input. Ready to order once we align on the right SKU.
>
> Thanks,
> Alan

---

## Internal reference — where this data came from

- Load math: `alternator-decision-notes.md` (verified 2026-05-30)
- Battery: `electrical-grounding-notes.md` (battery section)
- Build context: `project_engine_build.md` (memory)

## Singer SKU/pricing reference

| Output | Price | Pub idle output |
|---|---|---|
| 180A | $429.99 | not published |
| **200A** | $449 | 150A |
| 220A | TBC | TBC |
| 250A | $499 | 160A |

## Things NOT to mention in the email

- Don't lead with brand comparisons (he'll know JS/DC/PB; talking up competitors doesn't help)
- Don't dwell on AOS / fuel system minutiae — irrelevant to alt sizing
- Don't ask for a discount up front — let him quote, then ask if a build package exists

## Follow-up if no response in 5 business days

- Re-send via Singer's Facebook page (msingeralternator on FB) — known to be more responsive than email
- Phone is not advertised on the site; FB DM is the documented backup channel
