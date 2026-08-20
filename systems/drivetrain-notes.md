# Drivetrain Notes — 2011 6MT + DCCD + R180 in a 2004 GG Wagon

**Date:** 2026-08-19
**Config:** 2011 STi 6MT w/ DCCD · R180 rear diff (came with the transmission) · 05-07 STi hubs/knuckles all corners · hybrid driveshaft · iWire DCCD Spiider + VSS Pro · ACT Heavy Duty clutch
**Status:** Assembled, never driven. Pre-commissioning.

---

## Status board

| Item | Status | Note |
|---|---|---|
| **Front/rear final drive ratio match** | ✅ **CLOSED** | R180 is the one that came with the 6MT — same donor set, so ratios match. This was the highest-consequence risk (mismatched ratios destroy the center diff on a full-time AWD car). |
| R180 mounting | ✅ CLOSED | Mounted with the R180 bracket |
| Shifter linkage | ✅ CLOSED | Connected and working |
| Axles | ✅ CLOSED | Alan reports correct fitment |
| Driveshaft | ✅ CLOSED | Hybrid of 07 STi + wagon (possibly 2011) parts, assembled from forum research; length and splines verified correct |
| **Clutch actuation** | ⚠ **SEE BELOW** | Pedal/MC/hard pipe **and slave** carry over. **Fork + throwout bearing must be 6MT** to match the 6MT flywheel/clutch stack |
| DCCD function | ⚠ OPEN | iWire Spiider — needs *functional* verification at commissioning, not just continuity |
| Speedo / VSS | ⚠ OPEN | iWire VSS Pro — same; verify against 07 STi cluster |

---
## Clutch Actuation — 2004 5MT parts → 2011 6MT

**Question raised 2026-08-19:** Alan retains all 2004 5MT clutch actuation parts — pedal, master cylinder, lines, fork, slave piston. Are they compatible with the 2011 6MT?

## FSM comparison (2004 CL + 2007 CL)

| Spec | 2004 WRX 2.0T **5MT** | 2007 STI **6MT** | 2007 WRX 2.5T **5MT** |
|---|---|---|---|
| **Type** | **Pull** | **Pull** | ⚠ **Push** |
| **Release lever ratio** | **1.7** | **1.7** | 1.6 |
| **Release lever stroke** | **13.3-14.7 mm** | **13.3-14.7 mm** | 11.1-12.5 mm |
| **Pedal full stroke** | **130-135 mm** | **130-135 mm** | 130-135 mm |
| Diaphragm set load | 800 kgf (1,764 lb) | 930 kgf (2,050 lb) | 800 kgf |
| Pedal free play | 4-11 mm | 3-13 mm | 4-11 mm |
| Disc O.D. | 230 mm | 240 mm | 230 mm |
| Flywheel | — | **Conventional** ✅ *(Alan confirmed: conventional, from 6-speed donor)* | **Flexible** |

## Verdict: 2004 actuation parts CARRY OVER ✅

The 2004 WRX turbo 5MT and the STI 6MT are **both pull type, both 1.7 lever ratio, identical release lever stroke and pedal travel.** Pedal, master cylinder, and lines transfer.

⚠ **Near miss worth recording:** the **2006-07 WRX 5MT is PUSH type at 1.6 ratio.** Had the donor chassis been 06-07, none of these parts would work, and the symptom (clutch not fully disengaging) is painful to diagnose.

## MUST be the 6MT's parts, not the 2004's
- **Release fork** — bellhousing-internal, transmission-specific
- **Slave / operating cylinder** — bolts to the 6MT bellhousing
- **Flywheel — CONVENTIONAL** (6MT), not the 5MT's flexible type. Not interchangeable.
- **Clutch disc + pressure plate must be PULL type.** ACT Heavy Duty came in the trans bundle so likely correct — confirm before the box goes in.

## Expect / verify
- **Higher pedal effort** — 930 vs 800 kgf diaphragm. Normal, not a fault.
- ⚠ **Master and slave cylinder BORE SIZES are not in the CL spec table.** Lever ratio matching does not guarantee hydraulic ratio matching. Check bores before bleeding.
- ✅ **RESOLVED — verified directly in the 2011 FSM** (`CL-2`, `11_IM_STI_US.book`), no longer a proxy:

| | **2011 STI 6MT** | 2011 Except-STI 5MT |
|---|---|---|
| **Type** | **Pull type** | Push type |
| Diaphragm set load | 9,120 N (930 kgf) | 7,450 N (760 kgf) |
| Disc O.D. x I.D. | **240 x 160** | 230 x 155 |
| **Pedal full stroke** | **130 - 135 mm** | 135 - 140 mm |
| Pedal free play | 5 - 11 mm | 5 - 11 mm |
| **Flywheel** | **Conventional** | Flexible |

**2011 6MT = PULL type, 130-135 mm pedal stroke. 2004 WRX 2.0T 5MT = PULL type, 1.7 ratio, 130-135 mm pedal stroke.** Same type, same travel — compatible.

⚠ **Verify the ACT disc measures 240 mm, not 230 mm.** A 5MT-spec 230mm disc in a 6MT stack reproduces the NASIOC failure case exactly.

**Note on the push/pull "hole" identification trick** (raised via a Facebook thread): pull-type requires the release bearing to *clip onto* the diaphragm fingers, so the housing needs access to engage and verify it — hence the NASIOC OP using an inspection scope. Valid as a field check, but unnecessary here: the FSM states the type outright.

## Print index consequence
Add to TAB 4: `2007 Transmission/CL Clutch System.pdf` (38 pp) — already listed. Also print **2004 CL** (34 pp) for the 5MT-side actuation specs, since the pedal/MC/lines are 2004 parts.



---

## Can the 5MT fork and operating cylinder be reused? — **REVISED 2026-08-19**

> **CORRECTION:** An earlier version of this section said NO to both. **The operating cylinder answer was wrong.** Real-world reports (NASIOC 1881656) confirm the WRX slave cylinder works on a 6MT. The FSM's separate illustrations only prove Subaru catalogs them separately — not that they fail to interchange. **Slave = reusable. Fork = still no.**

### Verdict
| Part | Reuse 5MT? | Basis |
|---|---|---|
| **Operating cylinder (slave)** | ✅ **YES** | Two independent NASIOC reports: 02 WRX slave on 05 STi box, and 04 WRX slave on JDM V8 6MT — both worked |
| **Release fork** | ⚠ **UNRESOLVED** | Forums say transmission-specific (all successful swaps used the STi fork). **But the FSM does NOT distinguish them** — see below. |
| **Throwout bearing** | ❌ Use 6MT | Mixing a WRX bearing with an STi fork is implicated in the thread's failure case |

### ⚠ The real lesson: stack consistency, not individual parts
NASIOC 1881656 is a **failure report, not a success story**. OP ran a 06 6MT with an 04 WRX-spec ClutchMasters FX400 + Fidanza flywheel, kept the WRX slave, used **STi fork + WRX throwout bearing**. Clutch never fully disengaged — had to shut the engine off to select 1st/reverse. Thread ends unresolved at post #8 with a new slipping/vibration problem.

OP's own measurement (post #7):
> *"the wrx setup is approximately 1/8″ shorter from crankshaft/flywheel face to throwout bearing seat"*

**The successful posters ran internally-consistent WRX flywheel + WRX clutch + WRX slave + STi fork/bearing stacks.**

### Application to THIS build
Alan's flywheel is **6MT conventional** and the clutch is a **6MT-bundle ACT Heavy Duty** — a *different stack* from either forum success case.

**→ Keep the release system 6MT-spec to match the 6MT flywheel/clutch stack: 6MT fork + 6MT throwout bearing.** With that consistent, the slave is a free choice and the 5MT unit should work.

**Do not mix across stacks** — that is precisely what produced the thread's non-disengaging clutch.

### Superseded reasoning (kept for the record)

### Operating cylinder
`2004 CL` section 5 shows **three distinct operating cylinder configurations**, each with its own illustration and mounting:

| Variant | Figures | Torque |
|---|---|---|
| Non-turbo | CL-00035 / CL-00037 | T1 18 N·m, **T2 37 N·m** |
| **Turbo (5MT)** | CL-00036 / CL-00038 | — |
| **Turbo (6MT)** | CL-00209 / CL-00210 / CL-00211 | T1 18 N·m, **T2 41 N·m** |

Separate figure numbers = physically different parts, not merely different procedures. The 6MT even carries its own fastener torque. **The cylinder bolts to the bellhousing, and the 6MT bellhousing is a different casting.**

### Release fork / bearing
`2004 CL` section 4 "Release Bearing and Lever" also branches 5MT vs 6MT. The fork pivots inside the bellhousing and acts on a bearing sleeve dimensioned to that case. **A 5MT fork has no correct pivot in a 6MT bellhousing.**

### Why the 1.7 ratio match does NOT imply interchangeability
The matching lever ratio, release-lever stroke and pedal travel describe the **pedal/hydraulic geometry** — how far the pedal travels and what mechanical advantage it delivers. That is why the pedal, master cylinder and hard pipe carry over. It says **nothing** about whether bellhousing-internal parts interchange. Two transmissions can be engineered to want identical input motion while using completely different hardware to receive it.

### Final parts split

| CARRY OVER from 2004 | MUST BE 6MT |
|---|---|
| Clutch pedal | Release fork / lever |
| Master cylinder | Release bearing |
| Clutch hard pipe | **Operating cylinder** ← confirm you have it |
| | Flywheel (conventional) ✅ confirmed |
| | ⚠ Flexible clutch hose — `CL` Pipe & Hose section carries "STi model" vs "Except STi model" callouts; verify the fitting |

The 6MT arrived as a complete transmission, so **fork and release bearing should already be installed in it.** The part to actively confirm is the **6MT operating cylinder**.


---

## Release fork identification — FSM correction (2026-08-19)

> **CORRECTION:** An earlier note claimed the FSM branches the release fork by 5MT vs 6MT. **It does not.** `2004 CL` section 4 branches **NON-TURBO vs TURBO** only. Within TURBO, the "5MT:" / "6MT:" lines are cross-references to different *transmission removal* procedures — the fork/bearing procedure and illustrations (**CL-00028**, **CL-00025**) are **shared between turbo 5MT and 6MT**.

> *"2. TURBO MODEL — 1) Install the release bearing on transmission. 2) Insert the release fork into release bearing tab."*

### Evidence is split
| Source | Says |
|---|---|
| Forums (NASIOC / ClubWRX) | Fork is transmission-specific; every successful 6MT swap used the STi fork |
| FSM (2004 CL) | One shared turbo procedure and figure for 5MT and 6MT — no part distinction shown |

**Unresolved from available documentation. Do not assert either way.**

### How to identify the installed fork (without pulling the transmission)
1. **Remove the operating cylinder** — two bolts + hose, fully external. Exposes the outer end of the release lever. Photograph and compare to **CL-00028**.
2. **Borescope / phone camera through the bellhousing access hole** for the casting or stamped part number. The FSM confirms this hole exists: *"observing it through the main case hole"* and *"accessing it through clutch housing release lever hole."* **Part number is the only definitive ID.**
3. ❌ **Stroke measurement will NOT discriminate** — 2004 turbo 5MT and 6MT are both 1.7 ratio / 13.3-14.7 mm release lever stroke.

### DECISION 2026-08-19: deferred to next clutch job
Alan is **not pulling the bellhousing now**. Disc reportedly low and due for a checkup, so fork ID is batched with the next clutch replacement.

**Do BOTH checks in that one teardown:**
1. **Fork part number** — resolves the 5MT/6MT question
2. **Disc outer diameter — 240 mm (6MT) vs 230 mm (5MT)** ← *higher priority.* A 230mm disc in a 6MT stack reproduces the NASIOC non-disengagement failure exactly, and is invisible until the clutch is out.

⚠ **Records discrepancy to reconcile:** `20-21 2004 Wagon Build.xlsx` records the ACT Heavy Duty as *"less than 5k miles on it when installed."* That conflicts with a "disc is low" assessment. Determine which is accurate — it decides whether this is a soon job or a someday job.

### ✅ SUBSTANTIALLY RESOLVED 2026-08-20
**Alan: "clutch fork was from 2011 6 speed swap i got, probably OEM."**

The fork came with the transmission, so it is the 6MT fork — which was the low-risk assumption. The forum-vs-FSM evidence split is now moot for this car: whatever the general answer is, the part in this bellhousing arrived with this gearbox.

Residual risk is only that a previous owner swapped it before Alan got the trans. Confirm the PN at the next clutch job (batched with the disc-diameter check), but treat this as settled for planning.

### Risk assessment: LOW
The 6MT arrived as a complete transmission in a bundle, so absent a deliberate prior swap the installed fork is the one that came in it. Combined with the FSM showing a single shared turbo procedure, this is low priority.

### The check that actually matters — FIRST START
**Does the clutch fully disengage?** Can 1st and reverse be selected at idle without grinding? That is the exact symptom of the NASIOC failure case, and it settles in seconds what part-number archaeology cannot. Add to the commissioning checklist.
