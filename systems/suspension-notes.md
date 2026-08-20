# Suspension Notes — GG Wagon + 05-07 STi Front Knuckles + BC Coilovers

**Date:** 2026-08-19
**Config:** 2004 GG wagon chassis · **05-07 STi knuckles at ALL FOUR CORNERS** · **BC Racing BR-series coilovers w/ built-in camber plates** (exact PN TBD — Alan retrieving spec sheet) · 5x114.3 all corners

**Confirmed 2026-08-19 from eBay purchase history:**
- Front: 05-07 STi RH knuckle 28313FE060 + bearing 28373FE000
- Rear: 05-07 STi RH rear hub/knuckle/spindle assembly **and** 05-07 STi LH rear spindle/knuckle/hub
- Front lower ball joint **20206AJ000** (listed Outback/Forester/Legacy/Impreza)

This is a full GD-era STi upright conversion — the source of 5x114.3 at all corners while keeping GD geometry.

---

## ⚠⚠ FRONT STRUT FITMENT — MUST VERIFY BC PART NUMBER

**BC Racing splits the GD chassis into two different applications:**

| BC Part | Application |
|---|---|
| **F-02-BR** | 2002-2007 WRX **and 2004 STI** |
| **F-03-BR** | **2005-2007 STI** |

Alan's front knuckles are **05-07 STi** → the **F-03-BR** application. But `F-02-BR` is what someone would naturally buy for a 2004 WRX.

**→ Find the BC part number (labeled on the damper body / top of shock) for the record.**

### ⚠ Car has NOT been driven (confirmed 2026-08-19)

Build is pre-commissioning. **There is no empirical fitment evidence** — nothing has loaded these joints under weight, cornering, or braking. An earlier note in this file argued "it's installed so it fits"; that reasoning is void and has been removed.

**Consequence: the F-02 vs F-03 question is a live pre-assembly verification item, not a formality.** Confirm before the corner is buttoned up and certainly before first drive. Catching a lower-mount mismatch now costs nothing; catching it after the first shakedown could cost a lot more.

Check by eye at the front lower mount:
- Bolt diameter matched to the knuckle hole — no washers or spacers filling a gap
- No elongated or drilled-out holes in the lower mount
- Full thread engagement on the camber bolt
- Camber bolt seated in a proper eccentric arrangement

Also note: **alignment and corner balancing cannot happen until the car is on its wheels at running weight.** The rear-camber reading (STi knuckles on wagon links) is therefore a commissioning-phase task, not something available now.

### Evidence conflict — noted honestly
- **FSM suggests commonality:** strut-to-housing torque is **175 N·m in the 2004, 2005 AND 2007 manuals**, and the FSM calls out STi/non-STi splits elsewhere (stabilizer link 45 vs 30 N·m, separate transverse-link procedures) but **not** at this joint.
- **BC's catalog suggests a difference:** separate PNs for 02-07 WRX/04 STI vs 05-07 STI.
- The FSM evidence is *absence of a callout* — weaker than BC's positive product split. **Treat BC as authoritative until physically verified.** Resolve by eye: bolt diameter and centre-to-centre spacing on the knuckle vs the BC lower mount.

### BR Series specs (per BC)
- **53mm dampers**, full pillowball mounts front and rear
- **30 clicks — compression and rebound adjusted SIMULTANEOUSLY** (single adjuster, not independent)
- Ride height adjustable **separately** from spring preload (true coilover)
- Stock rates: **8 kg/mm front, 6 kg/mm rear**
- **Type RA** variant adds pillowball camber-adjustable top mounts + alloy top plates — listed for **5x100 PCD** models

### Track implications
- **Single-adjuster damping is the BR's real limitation** for a 500whp track car — compression and rebound cannot be tuned independently. Fine for street/track-day; limiting once chasing lap time. BC revalves and resprings if it becomes the constraint.
- 8/6 kg/mm is a moderate street-track rate. Verify what's actually fitted — rates may have been changed.
- **Do you have camber plates?** If it's a Type RA (or plates were added), front camber is adjustable at the top mount, which matters given SAI shifted with the STi knuckles.

---

## Front strut ↔ knuckle interface — FSM evidence

Subaru calls the knuckle the **"Housing"** in the FSM.

Evidence from `2005 Chassis/FS Front Suspension.pdf`:
- Strut attaches to housing via **two bolts**, the lower being the **camber adjusting bolt**
- **Tightening torque: 175 N·m (17.8 kgf-m, 129 ft-lb)**
- **The same 175 N·m figure appears in the 2004, 2005, and 2007 manuals** at this joint

Critically, the FSM *does* split STi vs non-STi wherever the hardware differs — e.g.:
- Stabilizer link: **STi 45 N·m / Except STi 30 N·m**
- Transverse link install: separate STi / Except-STi procedures
- Exploded-view callout (34) is flagged "STi model"

**No STi/non-STi split is called out at the strut-to-housing joint.** That's good evidence the two-bolt strut-to-knuckle interface is **common across GD WRX and GD STi**, which is why this swap works and why BC lists one GD front application.

⚠ Same torque is strong evidence, not proof of identical bolt diameter/spacing. **Verify by eye at install.**

---

## ⚠ Two things bolt to the OEM front strut — check your BC has provisions

Straight from the FSM install procedure:

1. **ABS wheel speed sensor harness** — bolts to the strut, **33 N·m (3.4 kgf-m, 24.3 ft-lb)**
2. **Brake hose bracket** — bolts to the strut

Aftermarket coilovers vary in whether they include these tabs. With **StopTech stainless lines** already fitted, confirm the hose is properly captured — an unsecured brake line near a moving strut is a genuine safety item, not a detail.

Also confirm whether the BC lower mount **retains the OEM camber adjusting bolt** or uses its own slotted/eccentric arrangement. This determines how front camber gets set.

---

## ⚠ Alignment specs — neither factory column applies

From `2005 FS` specification table:

| Spec | **Wagon Turbo** (his chassis) | **Sedan STi** (his knuckles) |
|---|---|---|
| Front camber | −0°20′ | −0°30′ |
| Front caster | 3°35′ | **4°50′** |
| **Kingpin (SAI)** | **13°45′** | **14°50′** |
| Front wheel arch height | 387 mm | 386 mm |
| Front stabilizer dia. | 20 mm | 19 mm |
| Rear camber | −1°20′ | −0°40′ |
| Rear wheel arch height | 376 mm | 363 mm |
| Rear stabilizer dia. | 17 mm | 20 mm |

**The car is a hybrid of both columns** — wagon crossmember/arms/towers, STi knuckles. Consequences:

- **Kingpin angle / SAI is NOT adjustable** (FSM: "The other items indicated in the specification table cannot be adjusted"). It is now set by the STi knuckle, ~1°05′ more than wagon spec. This shifts scrub radius and steering feel. Not a problem — just no longer a factory number.
- **Caster** differs 1°15′ between columns and is largely set by the chassis/arms, so expect closer to wagon spec.
- **Camber/caster/toe are yours to set** with coilovers anyway. Don't copy either factory column — set track targets and record them in PART 0.
- **Stabilizer bars:** wagon front 20mm/rear 17mm vs STi 19mm/20mm. Confirm which bars are actually fitted — this drives balance, and the wagon's relatively softer rear bar is worth knowing for a track setup.

---

---

## ⚠ REAR — STi-specific links exist. Which links are on the car?

`2005 Chassis/RS Rear Suspension.pdf` exploded view lists **separate part callouts for STi vs non-STi** on three rear links:

| Item | STi model | Except STi model |
|---|---|---|
| Rear lateral link | (8) | (31) |
| Front lateral link | (11) | (30) |
| Stabilizer link | (7) | (29) |

The install procedure also branches — the manual carries distinct "• STi model" and "• Except STi model" steps.

**The concern:** the car has **05-07 STi rear knuckles** but, unless they were changed too, **wagon (non-STi) lateral links**. The STi rear knuckle was designed to pair with STi-spec links. Mixing can shift rear track width and, more importantly, **static rear camber**.

### And rear camber is NOT adjustable from the factory

FSM, verbatim: *"Front and rear toe-in and front camber can be adjusted... The other items indicated in the specification table cannot be adjusted."*

**Rear camber is not on the adjustable list.** It's whatever the knuckle + link geometry produces. Factory targets differ by 40′:
- Wagon Turbo: **−1°20′**
- Sedan STi: **−0°40′**

So if the STi-knuckle/wagon-link combination lands rear camber outside a usable window, **the only fix is aftermarket adjustable rear lateral links.** On a track car that is worth knowing before a corner-balance session, not during one.

### Cheapest possible diagnostic
**Get a four-wheel alignment reading and look at rear camber.** One measurement tells you whether the knuckle/link combination is producing sane geometry, and it costs an alignment. Do this before buying any adjustable links.

---

## Ball joint 20206AJ000 — verify

The FSM treats the ball joint as part of the **transverse link** ("remove the bolt securing ball joint of transverse link to housing"). The purchased part is listed for Outback/Forester/Legacy/Impreza — a generic GD-era part — while the **housing it presses into is STi**. GD-era ball joints are largely common, so this is likely fine, but **confirm the taper seats fully in the STi housing**. Not asserted, needs a look.

Note the front transverse link section also branches **Sedan vs Wagon** (different illustrations FS-00026 / FS-00068, and stabilizer link torque Sedan 45 N·m / Wagon 30 N·m) — the wagon links are their own part.

---

## ★★ COMMISSIONING: RE-TORQUE BUSHINGS AT RIDE HEIGHT

**Status 2026-08-19:** corners fully assembled — coilovers in, ABS sensors mounted, calipers on, brake lines routed. **Car has never been on its wheels.**

The FSM repeats this instruction **five times** across front and rear suspension:

> *"Always tighten the bushing location when tires are in full contact with the ground and vehicle is curb weight."*

Locations where it appears:
| Source | Fastener |
|---|---|
| FS step 5 | Front transverse link |
| FS-1118 | Front stabilizer bushing |
| RS-315 | Rear stabilizer bushing |
| RS-377 | Rear trailing link |
| RS-581 | Rear housing / lateral link adjusting bolt |

### Why it matters
If the car was assembled on stands with the suspension hanging, every rubber bushing is clamped at **full droop**. Setting it on its wheels twists each bushing through the entire droop-to-ride-height travel and locks that preload in permanently → bushing bind, premature bushing failure, harsh ride, and alignment that drifts as things settle.

### Procedure
1. Set the car on its wheels at **curb weight** (spare, jack, tools in, fuel topped up — FSM's definition)
2. **Roll it forward more than 5 m (16 ft) in a straight line to settle the suspension** (FSM specifies this for wheel-arch measurement; same principle applies)
3. **Loosen, then re-torque** every bushing fastener listed above
4. Then alignment and corner balancing

### Torques (2005 FSM — ⚠ pick the correct branch)
| Fastener | Torque |
|---|--:|
| Strut to housing (camber bolt) | 175 N·m (129 ft-lb) |
| Transverse link to crossmember | 125 N·m (92 ft-lb) |
| Transverse link rear bushing to body | 250 N·m (184 ft-lb) |
| Jack-up plate to crossmember | 70 N·m (52 ft-lb) |
| Stabilizer link — **Wagon / Except-STi** | **30 N·m (22 ft-lb)** |
| Stabilizer link — Sedan / STi | 45 N·m (33 ft-lb) |
| Rear stabilizer link to rear lateral link | 45 N·m (33.2 ft-lb) |
| Rear stabilizer to bracket | 25 N·m (18.1 ft-lb) |
| ABS wheel speed sensor harness to strut | 33 N·m (24.3 ft-lb) |

⚠ **This car straddles the branches** — wagon lateral links but STi knuckles. For *link* fasteners use the **Wagon / Except-STi** values. Verify each against the printed section rather than this table.

### Also closed by the assembled state
BC struts **do** carry the ABS sensor and brake-line provisions — both are mounted. That concern is resolved.
The lower mounts accepted the bolts, which is reasonable evidence the application is right — but **still eyeball for spacers, elongated holes, or partial thread engagement** since nothing has been load-tested.

---

## OPEN — needed to finish this

1. **BC part number — F-02-BR or F-03-BR?** ⚠ TOP PRIORITY. Alan reports "probably BR series." The knuckles are 05-07 STi = F-03-BR application. Check the label on the damper body.
2. ~~Camber plates fitted?~~ — **CONFIRMED 2026-08-19: camber plates are built into the coilovers.** Front camber is adjustable at the top mount — the main lever available, since SAI shifted with the STi knuckles and rear camber is not factory-adjustable.
   - **"Type RA" is NOT a fitment concern.** RA describes the **top mount** (pillowball, camber-adjustable). The **prefix — F-02 vs F-03 — describes the application** and governs the *lower* mount that meets the knuckle. Independent parts of the name; read the prefix, ignore the suffix for fitment. (An earlier note treated RA as pointing to F-02 — that was based on one retailer listing and is weak evidence.)
   - Note: the "5x100 PCD" in BC's Type RA listing refers to the original vehicle application, not the coilover itself. PCD lives in the hub and does not affect strut fitment.
3. **Actual spring rates** — stock BR is 8 kg/mm F / 6 kg/mm R.
4. ~~Rear knuckle identity~~ — **RESOLVED: 05-07 STi both sides.**
5. ~~Which rear lateral links~~ — **RESOLVED 2026-08-19: wagon links retained.** So: STi rear knuckles on wagon lateral links. Rear camber is NOT factory-adjustable — get a reading.
6. **Rear camber reading from an alignment rack** — determines whether adjustable rear lateral links are needed.
7. **Which stabilizer bars are fitted** — wagon, STi, or aftermarket.
4. Front/rear spring rates, and whether camber plates are fitted.

---

## Print manifest consequence

- `FS Front Suspension` → print from **2005 or 2007** (STi knuckle procedures), not 2004
- OEM **strut/spring service pages are void** — BC coilovers supersede. Keep OEM pages for housing, hub, bearing, ball joint, transverse link, tie rod.
- Add custom subsection: BC model, spring rates, damper settings, corner-balanced ride height, achieved alignment

