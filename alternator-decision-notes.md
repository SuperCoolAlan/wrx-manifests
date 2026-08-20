# Alternator Sizing Decision — REOPENED 2026-05-30

**Status:** 🟢 ACTIVE — All American confirmed (2026-05-30) they don't offer Mitsubishi rewinds. Local rewind path is dead. Decision now between aftermarket-only options. Default pick: **JS Alternators 250A ($519)** unless a better-vetted alternative surfaces.
**Date last updated:** 2026-05-30

## Current Decision Matrix

| Option | Cost | Trust level | Status |
|---|---|---|---|
| **All American Electrical Rebuilders** (Sapulpa, OK) | TBD (~$200-400?) | Unknown — requires phone vet | **Call Tuesday 2026-05-26** (Memorial Day Monday closed) |
| **JS Alternators 250A** (02-05 Impreza 2.0L unit) | **$469** (Memorial Day sale — ends **Tuesday 2026-05-26 at 5:00 PM CDT**) | Medium — BBB 4.38/5, no EJ build threads, base case of AA430 | Backup if local fails vet |
| DC Power 180A HP | $640 | High — deepest forum endorsement | Conservative fallback |

## OEM Cores On Hand

- ✅ **Subaru 23700AA430** (USDM 02-05 WRX / 04-05 STI alternator, 90A) — IN HAND, this is the correct core for the build (matches 05 EJ257)
- 🟡 **Subaru 23700AA380** (JDM 02-05 EJ205 alternator) — IN HAND but **not compatible with USDM build** (different pulley/case orientation/connector). **Plan: sell separately.**

Having the 23700AA430 in hand means All American can rewind the user's own core — no separate core charge or sourcing needed. Bring it to the phone call discussion.

## All American — The Local Lead

**All American Electrical Rebuilders** — Sapulpa, OK (~25 min from Tulsa)
- **Phone:** [redacted]
- **Email:** [redacted]
- **Address:** [redacted]
- **Reviews:** 4.8 stars / 28 reviews (Birdeye); family-owned since 1986
- **Site explicitly says:** *"Stators can be custom wound to produce higher amps for custom applications"* and *"When an alternator comes into our shop, we automatically replace three things: the regulator, the brushes, and the bearings."*

### Phone-vet script

1. Can you wind a small-case Mitsubishi-built Subaru unit (PN 23700AA430) to 200-250A?
2. Do you replace the regulator with a high-output unit (not just reuse OEM)?
3. Do you replace bearings AND the rectifier/diode pack on HO builds?
4. What's the idle output rating at 800 RPM and 1500 RPM?
5. What's the warranty on a high-output build?
6. What's the price for that work?

### Pass/fail criteria

- **Pass and go local:** confirms regulator + bearings + diode pack replacement, 1+ year warranty, under $400
- **Fail → go JS Alternators ($469):** hedges on regulator, diode pack, warranty, or price comes in over $400

### Tuesday 2026-05-26 — Outcome

- Called All American [redacted], no answer, voicemail left
- No callback as of 2026-05-27
- JS Memorial Day sale expired 5 PM CDT 5/26 unused
- Moved on; will revisit alternator decision when build timeline requires

### Current state of options (post-sale)

| Option | Cost | Status |
|---|---|---|
| All American local rewind | TBD | Awaiting callback — low expectation |
| JS Alternators 250A | ~$519 (10% standing off) or $577 full | Available anytime |
| DC Power 180A HP | $640 | Available anytime |

### Other Tulsa shops (phone-vet only if needed)

| Shop | Phone | Notes |
|---|---|---|
| Shorty's Auto Electric | [redacted] | 4.4/98 reviews, ~$100 OEM-spec rebuild, no HO advertised |
| Auto Battery & Electric | [redacted] | Long-established, heavy-duty/industrial |
| Advanced Electrical Rebuilders | [redacted] | 38 yrs, minimal online presence |

## Why Reopened (was previously resolved to DC Power 180A HP)

JS Alternators "02-05 Impreza 2.0L 250A" came up at **$469** — $171 less than DC Power 180A, with 70A more capacity, built on the SAME OEM core (23700AA430) as the user's 04-05 era EJ257 alternator. This made the value math interesting enough to revisit.

Then the "local rewind" option surfaced — possibly cheaper than even JS, with the trust trade-off of small-shop work without forum-validated track record.

## Original Final Pick (now superseded pending re-decision)

~~**DC Power 180A HP** ($640) + **Big 3 wiring upgrade** ($80-120) = **~$720-760 total**~~

## Audio System (Confirmed PNs)

| Amp | Role | Claimed | Actual RMS |
|-----|------|---------|------------|
| **Boss R1100M** | Sub amp (monoblock, drives 2× 10" subs) | "1100W max" | ~400-500W real RMS @ 2Ω |
| **Rockford Fosgate Punch P400-4** | 4-channel (door speakers) | 400W | **200W RMS @ 4Ω (CEA-2006 honest)** |
| **Total realistic audio RMS** | | | **~600-700W** |

**Note on Boss R1100M:** Manufacturer claims 413W RMS @ 4Ω / 825W RMS @ 2Ω, but Boss is notorious for inflated ratings. Independent testing puts actual closer to ~250W @ 4Ω, so ~400-500W @ 2Ω is realistic. NOT CEA-2006 certified.

**Note on Rockford Fosgate P400-4:** CEA-2006 compliant = honest ratings. 50W × 4 = 200W RMS at 4Ω, which is typical door speaker load.

## Load Math

### Engine-only load (no audio)
| Component | Draw |
|-----------|------|
| DW400 fuel pump @ 50-80 psi | 17-20A |
| DW1500 injectors (×4 high-Z) | 4-8A |
| Ignition coils (×4 NGK) | 4-8A |
| Link G4X + sensors | 3-5A |
| Dual electric cooling fans (full speed) | 15-25A |
| Switched-IG accessories | 5-10A |
| **Total engine-only** | **~60-80A continuous** |

### Audio current draw (at 14V, Class A/B ~55% efficient)
| Scenario | Audio power | Current |
|----------|-------------|---------|
| Peak (bass hits cranked) | ~700W | ~85-95A |
| Heavy listening | ~50% peak | ~45-55A average |
| Normal listening | ~25-30% peak | ~25-35A average |
| Quiet | ~10% peak | ~10A average |

### Combined load
| Scenario | Total |
|----------|-------|
| Engine + audio off (track) | ~60-70A |
| Engine + normal listening | ~85-105A |
| Engine + heavy listening | ~105-125A |
| Engine + cranked peaks | **~145-165A** |

## Why 180A HP (not 110A stock, not 220A/270A)

| Alt | Verdict for this build |
|-----|----------------------|
| **Stock 110A** | Insufficient under cranked listening (~145-165A peaks). Voltage sag would impact fuel pump + coils. |
| **DC Power 180A HP** | ✅ Handles all scenarios w/ ~15-35A headroom. Maintains 14V+ under load. Right size. |
| PowerBastards 220A ($550) | Overkill — extra 40A capacity unused with this audio system |
| DC Power XP 270A ($730) | Massive overkill — sized for 1500W+ RMS audio systems |

## Supporting Components

| Component | Status | Cost |
|-----------|--------|------|
| **DC Power 180A HP alternator** | ✅ Locked | $640 |
| **Big 3 wiring upgrade (1/0 AWG OFC)** | Mandatory w/ HO alt — stock wires sized for 110A | $80-120 |
| **AGM battery (Odyssey PC925)** | Recommended for voltage stability + longevity | $250 |
| **1F+ capacitor** | ❌ SKIP — only needed if cranked daily | $0 |

**Mandatory total: $720-760** (alt + Big 3)
**With battery upgrade: $970-1,010**

## Install Notes

1. **Big 3 wiring is mandatory.** Stock charging wires are sized for 110A — putting a 180A alternator on stock wires creates a bottleneck and risks wire damage.
2. **Three Big 3 cables (1/0 AWG OFC):**
   - Battery+ → alternator B+ stud
   - Battery- → chassis ground
   - Chassis → engine ground
3. **Reuse OEM alternator pulley** — DC Power ships with correct pulley sizing for Subaru, but verify.
4. **Plug-and-play** to factory Subaru alternator harness w/ minor adapter sometimes needed.

## What Was Learned

- Earlier memory entry assumed "twin pumps + 100-130A engine-only load" — both wrong for this build (single DW400, real engine load ~60-80A)
- "Boss R1100M 1100W" is marketing peak number, real RMS is ~400-500W
- Rockford Fosgate is honest-rated (CEA-2006) — 200W RMS for the P400-4
- Total audio is ~600-700W RMS, NOT the 2000W estimated earlier
- 180A is the sweet spot — handles cranked audio + engine without paying for unused capacity

## Related Files

- Build memory: `/Users/alan/.claude/projects/-Users-alan-Documents-WRX/memory/project_engine_build.md`
- Spreadsheet row 37: Alternator (locked)
- Spreadsheet row 38: Big 3 wiring
- Spreadsheet row 39: 1F capacitor (now deferred)
