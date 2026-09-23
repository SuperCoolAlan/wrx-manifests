# Driver-Side Bracket — FPR + Flex Fuel Sensor

**Project:** One ASA panel in the space freed by deleting the 2005 WRX windshield washer reservoir, on the driver strut pillar. Carries the Aeromotive A1000 Gen II FPR (on its stock steel bracket) and the Continental/Haltech flex fuel sensor (in the Thingiverse 2965407 cradle).
**Source:** [`driver-side-bracket.scad`](./driver-side-bracket.scad)
**Material:** ASA, engine bay. Hardware: M5 screw + hex nut, nut recessed in the rear face — the battery tray's `"BOLT"` scheme.

---

## Coordinate frame

- **X** along the pillar wall. `X=0` is the **right** chassis hole, `+X` runs toward the **left** — the deep 170mm end is the `+X` end, which is the end on your left as you face the installed bracket.
- **Z** vertical, `Z=0` at the chassis hole centerline, `+Z` up.
- **Y=0** is the **pillar wall**; the panel's rear face lies on it. `+Y` is forward.

## Measured inputs

| Source | Dimension | Value |
|---|---|---|
| At car | Chassis hole spacing | **80.0mm c-c** (left one shared with the fuse box) |
| At car | Bolt-seat standoff from pillar wall | **17mm** |
| At car | Bolt axis tilt above horizontal | **Left ~12°, right ~8°** since v8, nose forward (shared: 30 → 20 at v1 fit, 20 → 10 at v4 fit, 10 → 13 at v5 fit, 13 → 14 for v7; split at the v7 fit off ~1mm / ~3mm pad gaps — still eyeballed, never measured) |
| At car | Max usable width | **137mm** |
| At car | Drop below hole line, left / right | **170 / 132mm** |
| `fpr-bracket/` | FPR steel-bracket ear holes | 52.0mm c-c, ⌀5.5, 47.0mm above FPR bottom face |
| STL mesh | Flex sensor cradle ear holes | **46.0mm c-c, ⌀6.5** |
| STL mesh | Cradle envelope | 86 × 18 × 58mm, flat back, ears 4mm thick |
| Haltech drawing | Sensor's own mounting tabs | 48.0mm c-c, ⌀4.2 — unused; the cradle snaps over the sensor |

Cradle numbers were read off `Continental_Flex_Fuel_Bracket.stl` by ray-casting the mesh — there is no source file for that part.

## v3 mount: a shroud, not arms

With the FPR moved low, the v1 twin arms became one **full-width shroud**: a
continuous seat bar across both bosses (slotted holes, 20° seat plane), hulled
down to a 6mm bite on the panel's top edge, with a tangent 6mm cove fillet at
the panel joint. Boss tab clearance started at 3mm all round; it is now per-face
(see v7 below) and the tabs are still [MEASURE].

**The sensor molds its own pocket**: `ffs_clearance_cut()` subtracts the whole
cradle+sensor assembly, dilated by `ffs_cut_clear`, from the printed body — wherever structure
and sensor overlap, the print simply wears the sensor's negative. It tracks
`ffs_ox/oz/rot` parametrically, so moving the sensor re-carves the pocket.
(Preview needs the `render()` wrapper around the cut or F5 shows an empty tree.)

## The v1 mount was a hook, not a flange (historical)

The strut tower presents two **rectangular bosses** standing ~17mm proud of the wall, their bolt axes tipped ~20° up and forward. The panel's own rear face lies flat on the wall, its top edge stopping at Z −22 to clear the bosses; from there two arms reach **up and forward** to a pair of seat pads that lie square on the boss end faces. Each arm grabs only its pad's **bottom edge** (`mount_arm_grab`), and the pads stop 9mm above the bolt axis (`mount_pad_top`) — v1's centred pads and full-side arms hooked back over the boss tops and shadowed their sides. No tie rib; the mid-span is open so the FPR's can and adjuster pass through. Boss volume is subtracted from the print (`tower_boss_clearance`), or the pads would never touch their seats.

## Still `[MEASURE]`

- **Chassis bolt size** — `chassis_hole_d` defaults to 8.5 (M8). Holes slotted ±1.5mm to absorb c-c error.
- **Boss section** — `tower_boss_w/h` are 26 × 18 placeholders. These set both the panel's top-edge height and the hook's clearance cut, so they matter.
- Pillar wall flatness behind the panel. Turn on `include_contact_pads` if the stamping falls away from Y=0.
- Sensor dimensions (`ffs_sensor_*`) are all `[approx]` — caliper the actual unit.
- Hose-end stick-outs (`side_fitting_len`, `return_fitting_len`).
- **Left boss leg reaches** (`boss_leg_l_in`, `boss_leg_l_out_wall/seat`) — derived
  from air gaps eyeballed at the v9 fit against a pocket floor 16 below the
  square, never measured. They now set how much web the left arm gets.

## Layout as drawn — v11 (2026-09-21)

The v1 top-centre FPR spot put its right-side fitting into the fuse box, so the
whole layout rotated: **FPR low-left, sensor high-right, flipped 180°.**

| Item | Position |
|---|---|
| Panel | X −16 (right) … 103 (left, = FPR ear + washer seat), Z −22 … bottom curve, 8mm thick, 1.5mm edge round-over |
| Panel bottom edge | curve as drawn right of the FPR's RIGHT ear (x 43); **flat at Z −130.98 from there to the left edge** (v7) — derived from `fpr_x`/`fpr_ear_spacing`, so it tracks the FPR |
| FPR ear holes | (43.31, −112.16) and (94.93, −105.82) — **turned 7° CW (`fpr_rot`) about the ear midpoint; dropped 5 (v10) then 1 more along the tilted axis (v11)** |
| FPR pressure sender | 22×65 envelope off the front NPT port (why the 180° U clocks 45°) |
| FPR 180° U (right port) | loops 45° down-and-forward; return line runs behind it |
| Sensor cradle | origin (75.59, −43.07) — **down 4 along its own axis (v11)**, **+2mm forward of the panel face (`ffs_oy`)**, rot **137°**, tipped 15° forward off the panel, **yawed 2° (`ffs_yaw`) about the body's left end so the connector swings forward**; seats on the `ffs_backing()` wedge |
| Sensor connector | exits bottom-right into the fuse box's notch; plug-to-box **0.5mm** as drawn (2.0 at v10). The v11 drop alone put it 0.77 INSIDE the box; `ffs_yaw` pulls it back out. Loom not drawn (`sensor(boot = false)`) |
| Sensor inlet (lower right port) | 90° hose end, leg down-left, tipped 12.5° to the wall |
| FPR return (bottom port) | swept 120° end: straight down, curls up-RIGHT toward the sensor, clocked 30° to the wall behind the 180's forward loop |
| FPR MAP nipple | exits the RIGHT side of the body (was drawn left — wrong) |
| FPR front NPT | LowDoller pressure sender, 22×65 envelope [MEASURE] |
| Bottom-right corner | raised ½" (drop 132→119.3) — was bumping the chassis |
| Bottom-left corner | tucked 32×20 chamfer for the filter harness + one pair of 3×10 tie slots (battery-tray convention) |
| Sensor outlet (upper port) | straight run up between the arms to the firewall return |
| Mount | full-width shroud + seat bar (see "v3 mount" above); sensor pocket molded out |
| Seat bar | one pad per boss — **left 12° (`chassis_hole_tilt`), right 8° (`chassis_hole_tilt_r`)**, hull-blended between; 16mm reach above the bolt axis, `stud_lift` 5 |
| Boss clearance | per-face (v7): 6mm all round on the left, **2.4mm on its inner (−X) face**; right boss 6+3=9mm all round, **6mm on its inner (+X) face**. The left boss is a **U** whose legs are modelled separately (v11): inner leg reaches 12 past the square, outer leg **ramps** 11 at the pillar wall to 7 at the seat plane, with 1.1 / 2 / 1mm of air under them. Pocket mouth coved back **1mm** (`boss_pocket_fillet_r`, was 2) — the cove pulls every pocket face in by its full radius, so it must stay under the smallest clearance or it bites the boss |
| Third M5 | **(38, −94)** (v12; v10 put it at (38, −89), was (15, −88) behind the sensor inlet hose) into a chassis rivnut, ⌀13 × 4.5 counterbore, drilled at the car to match the print |
| Fuse box keep-out | left face x=9.2, rear face y=30 off the wall, **75mm tall**, notch 25×50 along the rear-left edge **full height** — placed off the v7 fit photos, ALL [MEASURE] |

## Clearances — verified by boolean intersection, not by eye

Run `-D check=N`, export the intersection, take its mesh volume. 0–20mm³ is a
coplanar/ghost graze; real conflicts are in the hundreds or thousands.

| N | Pair | v7 | v8 | v9 | v10 | v11 | Read |
|---|---|---|---|---|---|---|---|
| 1 | bracket ∧ FPR | clear | clear | clear | 0mm³ | 0mm³ | v10 on: the ear plate lands flat on the 8mm panel face |
| 2 | bracket ∧ sensor | 55mm³ | 58mm³ | 58mm³ | 58mm³ | 56mm³ | cradle seating on the backing wedge |
| 3 | FPR ∧ sensor | clear | clear | clear | clear | clear | **the ceiling on `ffs_yaw`** — 3° puts 3mm³ here, 4° puts 21mm³ |
| 4 | mount ∧ FPR | clear | clear | clear | clear | clear | |
| 5 | mount ∧ sensor | 12668mm³ | 13591mm³ | 12967mm³ | 12967mm³ | 6862mm³ | **expected** — `mount_solid()` is the raw shroud; `ffs_clearance_cut()` only runs inside `bracket()`, so check 2 is the one that speaks for the printed part. The number is the size of the slot the sensor carves through the seat bar — watch the bar's remaining section as it grows. v7's `ffs_oy` +2 pulled it back from v6 |
| 6 | bracket ∧ chassis bosses | — | — | — | — | 2.5mm³ | **new in v11.** MUST be empty: the pocket is the boss plus air, so anything here means the pads never touch their seats. Only means something because the boss ghost now models the measured leg instead of tracking the pocket |
| 7 | FPR ∧ fusebox | 2539mm³ | clear | clear | clear | clear | against all-`[MEASURE]` ghost faces; v8's box re-placed off the v7 fit photos |
| 8 | sensor ∧ fusebox | 1371mm³ | clear | clear | clear | 0mm³ | v1–v7 numbers were the sensor loom, no longer drawn. v11 sits 0.5mm off the box |
| 9 | sensor ∧ above top edge | 2859mm³ | 3153mm³ | 3212mm³ | 3212mm³ | 3183mm³ | **must be zero for a flush top.** This is the sensor itself cresting the seat bar's top face — no cut logic can close it, only moving the sensor down or raising `mount_pad_top` |

Two measurement habits this table depends on, learned the hard way in v7:

- **Never compare STL file size or md5** to decide whether geometry moved.
  OpenSCAD's tessellation here is not deterministic — the same unedited file
  rendered three times gave 55460 / 39130 / 41958 facets. Mesh **volume** and
  **bounding box** are the only trustworthy signals.
- **Count connected shells** (union-find over welded vertices) on every export.
  A good bracket is exactly **1**. This is what caught the two floating pins
  described under v7 below; no clash check would have.

Baseline trap: run the comparison copy from **inside this directory**. From
/tmp the relative `use <../Flex Fuel Sensor Bracket/...>` silently resolves to
nothing, the sensor evaluates empty, and every sensor check reports a false clear.

`-D` trap: **`-D ffs_oz=-57` and the file's own `ffs_oz = -57.0` do not produce
the same mesh** (172 vs 116 triangles on check 9, 2026-09-02). Sweep by editing
the file, not by `-D` override, whenever the number is going into these tables.

Parse trap: OpenSCAD writes these intersections as **ASCII** STL. A binary-STL
volume reader sees the `solid` header and reports every check as empty — which
looks exactly like a clean part.

Tight spots worth knowing:

- **FPR block bottom to sensor body top: 1.5mm.** The binding constraint on the whole layout. Raising the FPR walks its can into the hook's tie rib (anything above `fpr_ear_z ≈ −34` touches); lowering the sensor runs its lower ear off the panel's curved bottom edge.
- **Sensor's lower ear has 9.3mm to the panel edge.** Thin but workable with a ⌀6.5 hole.
- **FPR adjuster top sits at Z +4.25**, above the chassis bolt line but at mid-span, 44mm and 36mm from the two bolts. Should miss the fuse box at the left bolt — eyeball it at the car.
- **FPR's left side fitting reaches X 109.5 against a 108.5 edge** — 1mm of air, no material involved.
- The sensor's fuel lines run **horizontally out both ends** and overhang the panel on both sides, by design.

## Why they don't stack (v1 rationale, kept for history)

There is only **14.1mm of panel below the FPR's return port**, and the sensor needs a 46mm ear span. Beside the block there is 47mm to the right and 39mm to the left, against a sensor that needs a 112mm clear run. So neither a vertical stack nor a side-by-side works: the sensor sits low and slightly right, tucked under the FPR block with its axis crossing beneath it, and its hoses overhang. That is the only arrangement that fits 137 × 148.

## v3 prototype print (2026-08-26)

Fit-check print, not the production part: **PLA, 0.8 nozzle, 2 walls, 10%
infill, supports on**, sliced in CrealityPrint from `driver-side-bracket-v3.stl`
(rear face down). Creality's import disables "slow down for overhangs" — turn it
back on for the shroud's underside. Nut pockets will run tight at 0.8; irrelevant
for the fit check. Production spec below still stands (ASA, 4 walls, 30% gyroid).

## v4 fitment (2026-09-01) — `v4 fitment pics/`

Bare-panel check: printed in orange PLA, bolted at both chassis holes, neither
the FPR nor the sensor mounted. The red in the photos is chassis, not hardware.

What it showed, and what v5 does about it:

- **The right mount arm butts into the fuse box's own mount arm.** Both land on
  the shared right chassis bolt, and the bracket's seat bar ran out of room
  under the fuse box's L-bracket. Fix: `mount_pad_top` 14 → 16, extending the
  seat surface upward so the bar's material clears the L's underside.
- **Seat plane too steep again.** `chassis_hole_tilt` 20 → 10. Note this has now
  been walked down twice by eye (30 → 20 → 10) and has never been measured — v5
  is the test of 10, not confirmation of it.
- **Boss clearance opened up**, `tower_boss_clear` 3 → 6, on top of the existing
  +1 radial on the right boss — the LEFT arm's L-shaped tie to the mounting
  square was bottoming on the chassis (photos _004/_005). `boss_clear_extra_r`
  is right-boss-only, so the left has no independent knob and the global value
  has to carry it. The 26 × 18 boss section is still a placeholder, so this
  number is absorbing both real air gap and unmeasured boss size.
- Edge treatment added independent of the fitment: `edge_round` 1.5 round-over
  on the panel and shroud (minkowski, inset then grown back so dimensions hold)
  and `rim_chamfer` 1.0 breaks on the chassis slots and the aux counterbore.

## Flush top edge — derived, not tuned (v6)

`ffs_backing()` used to be capped by a plane hand-tuned to one `ffs_oz`
(`ffs_pad_top_inset = 4.699`); every vertical move of the sensor pushed the pad
through the flat top face or left a gap under it. That parameter is gone.

`ffs_top_limit()` now derives the boundary: across the seat bar's span
(`bar_x0`…`bar_x1`) it is the bar's own top face in the tilted mount plane;
outboard of the bar it is the panel's top edge, using each side's drop step. The
pad is flush by construction at any sensor position. Same fix closed a related
bug — the "bar zone" term in `ffs_back_allowed()` spanned the full panel width,
so outboard of the bar the pad was allowed above the panel's top edge.

**This does not make the top edge flush on its own.** Check 9 measures the
sensor against that same boundary, and at the v6 position 3193mm³ of real sensor
and cradle sits above it (2859mm³ at the v7 position — still not zero). `ffs_clearance_cut()` has to notch the bar there —
closing those notches would put plastic where the sensor is. Sweeping `ffs_oz`
down from −57 (rot 110) shrank the breach 2435 → 429mm³ at −69 without reaching
zero, so at these rotations it needs less `ffs_rot` or a taller `mount_pad_top`.

## v5 prototype print (2026-09-01)

`driver-side-bracket-v5.stl`, manifold, genus 7. Same fit-check spec as v3:
**PLA, 0.8 nozzle, 2 walls, 10% infill, supports on**, rear face down.

## v7 (2026-09-03) — shape work, no fitment behind it

Everything here came off reading the model, not off the car. No v7 test print
has been fitted yet.

**Panel bottom edge, flat to the left.** The curve carried the bottom-left
corner ~30mm below where it needed to be, backing nothing. It now runs the
original curve right of the FPR's RIGHT ear (x 43) and holds flat at that
station's height, Z −130.98, out to the left edge. `bottom_z()` derives the
station from `fpr_x`/`fpr_ear_spacing`, so the flat follows the FPR if it moves.

**Boss clearance is per-face.** `tower_boss_clear` could only grow a pocket
uniformly, so tightening the web between the two mounts also gave away
top/bottom clearance. `boss_section_2d()` now takes `grow_xneg`/`grow_xpos`
overrides and `tower_boss_clearance()` drives each boss separately. Left inner
face 4mm, right inner face 6mm, everything else on `tower_boss_clear` (+
`boss_clear_extra_r` on the right). The refactor was checked no-op first: with
the overrides set back to the uniform value the volume matched to 0.005%.

**Pocket mouth coved (`boss_pocket_fillet_r` 2.0).** Where the pocket wall met
the pad's underside was a 270° re-entrant lip sitting directly in the bolt load
path — a section through the mount at x 8 measured it square. `boss_pocket()`
now sweeps the last 2mm of the pocket in on a quarter circle. It is paid for out
of side clearance **at the seat plane only**, full clearance returns one radius
down. Measured minimum clearance to the nominal boss is exactly **2.0mm** (clear
at 1.9, first contact at 2.1), at the left boss's inner face. If the eyeballed
26 × 18 boss section worries you, this radius is the first thing to shrink.

**Sensor pocket dilation is now exact.** `ffs_clearance_cut()` approximated the
sensor+hose dilation by unioning 10 shifted copies, which left stair-step
shelves down the pocket wall — a fringe of sub-0.4mm blades at the cradle boss's
lower-left corner. Replaced with a true `minkowski()` against a sphere. The old
comment's "~4.5min" cost no longer applies: only the imported cradle STL made
that slow, and that half already goes through the exact 2D-projection path, so a
full render is **~38s**. The sphere also dilates −Y, which the shifted copies
never did, so the cut is clipped at the panel front face — the sensor never
lives behind that plane.

**`ffs_cut_clear` 3.0 → 1.0, and a trap it exposed.** The pocket outline is
closed with `offset(r=-k) offset(r=ffs_cut_clear+k)`. `k` was hard-coded to 1,
which closed the cradle's ⌀6.5 ear holes only while `ffs_cut_clear + 1 ≥ 3.25`.
At clearance 2.0 that inequality broke and each ear hole survived the projection
as a **⌀2.5mm pin of body standing in the pocket** — two extra shells in the
mesh, unprintable. `k` is now `ffs_cut_close = 4.0`, independent of the
clearance, and used by both `ffs_clearance_cut()` and `ffs_backing()` so the
backing rim still lands on the pocket wall. Constraint to preserve:
**`ffs_cut_close` must exceed 3.25 − `ffs_cut_clear`.**

**Sensor moved.** `ffs_oy` is new — cradle standoff forward of the panel front
face, where the placement used to be pinned to `panel_t`. Set to 2.0 to stop the
sensor's bottom burying itself in the shroud (check 5 17316 → 12668mm³).
`ffs_ox` 81 → 80 to feed the left cradle ear, whose bolt lands at Z ≈ −10, above
`panel_top_z` — it has no panel behind it, only `ffs_backing()`. Material within
10mm of that ear's bolt axis went **2258 → 2504mm³**; the right ear is 2875mm³
and did not move. If that ear needs a step change rather than a nudge, drop
`ffs_oz` ~4mm so it lands on the panel edge instead of above it.

## v7 export (2026-09-03)

`driver-side-bracket-v7.stl` — 43820 triangles, **1 shell**, 149515mm³,
bounding box 119.0 × 25.9 × 147.6mm (X −16…103, Y 0…25.9, Z −131…16.6).
Not yet printed.

## v7 fitment (2026-09-15) — `v7 fitment pics/`

Printed v7 bolted at both chassis holes with the FPR, DW filter and sensor
mostly plumbed in Redhorse fittings. Tight but good. What v8 does about it:

- **Seat pads gapped off the chassis tabs**, a wedge touching at the pad top:
  ~3mm at the right pad's bottom (side photos _024–_027), ~1mm at the left.
  Over the 28mm pad that is ~6° and ~2°, so the tilt is **split per mount**:
  right 14 → 8 (`chassis_hole_tilt_r`, new), left 14 → 12. Estimated off
  photos, not feeler-gauged.
- **Fuse box keep-out re-drawn** to the ~5mm plug-to-box gap seen at the car:
  75mm tall (was 140), notch full height, left face x −20 → 9.2.
- **Sensor loom dropped from the drawing** — it was what fouled check 8.
- **Sensor turned 6° CW to 136°** (about its body centre, for connector room)
  and slid a net 1mm right along the fuel passage.
- **Check 6 removed** — it modelled a hose joint that doesn't exist as drawn.

## v8 (2026-09-15)

**Per-mount tilt.** `seat_bar()` is one pad per boss, each flat in its own
mount frame; `shroud_half()`'s hull blends the bar between them. Everything
that followed the single tilt — the fillets, `ffs_top_limit()` and
`ffs_back_allowed()` — now runs through `tilt_slices()`, which cuts it into X
slices at `tilt_at(x)`. The refactor was checked no-op first: with the right
tilt set back to 14 the body matched v7 to 8mm³ (tessellation noise).
Both seat faces were probed flat — nothing proud of either pad's front plane.

**Watch the right washer seat.** At the v8 sensor position the pocket nicks
**2.3mm³** off the right pad's front edge, about 7mm from the bolt axis — just
inside an M8 washer's 8mm radius. Left seat is untouched.

## v8 export (2026-09-15)

`driver-side-bracket-v8.stl` — 50234 triangles, **1 shell**, 147904mm³,
bounding box 119.0 × 25.5 × 147.6mm (X −16…103, Y 0…25.5, Z −131…16.6).
Not yet printed.

## v8 fitment (2026-09-16) — `v8 fitment pics/`

Printed v8 bolted up and plumbed. Nearly a perfect fit; two changes for v9:

- **Left arm body bumped the chassis mount** behind the seat pad (_023–_032):
  the chassis bracket reaches further down out of the pillar than the ghost.
  Left boss extended **10mm down** (`boss_drop_l`, eyeballed) — ghost and
  pocket both; right boss untouched. The deeper pocket opens a small window
  through the panel at its lower inner (−X) corner. Add material back there
  if v9 fits with clearance to spare.
- **Sensor turned 1° CW to 137°** (about its body centre) and slid **2mm
  right** along the fuel passage. Plug-to-fuse-box drops 3.2 → 2.0mm as
  drawn — the box ghost is still `[MEASURE]`, so watch it at the car.

## v9 export (2026-09-16)

`driver-side-bracket-v9.stl` — 43892 triangles, **1 shell**, 143878mm³
(−4664 vs v8, the deeper left pocket), bounding box unchanged at
119.0 × 25.5 × 147.6mm. Right washer-seat nick not re-probed at the new
sensor position. Not yet printed.

## v10 export (2026-09-16)

v9 was never printed. `fpr_rot` is new: it turns the FPR ghost and its printed
ear holes together, and the flat bottom edge follows the right ear. With the
turn alone, the adjuster grazed the sensor (check 3, 15.7mm³); the 5mm drop
clears it. The third M5 moved to where the model shows ~10.5mm of straight-on
tool clearance; the FPR vacuum hose isn't drawn and passes ~8mm below it.
Checks match v9 (1/3/4/7/8 clear, 2 57mm³, 5 12967mm³, 9 3212mm³).

`driver-side-bracket-v10.stl` — 17674 triangles, **1 shell**, **0 non-manifold edges**, 144170mm³,
bounding box 119.0 × 25.5 × 147.6mm. Rivnut goes at the new hole.

Re-exported after Bambu Studio flagged 5 non-manifold edges: `panel()`'s
minkowski round-over left sliver faces on the curved bottom edge (v8/v9 had
them too). Now stacked insets. Check the exported mesh for edges not shared by
exactly two faces before calling a print file done.

## Print notes

- **Orientation: panel flat, rear face down.** The rear face is the pillar-wall datum and gets the flat first-layer finish. The hook arms then point up at 60° off the bed — self-supporting. Nut pockets open downward and bridge ~9.5mm at their ceiling, which ASA handles.
- **Pause at Z 6.0 for the two FPR nuts** (v12+).
- 4 perimeters, 30% gyroid, standard ASA profile — same as the battery tray.
- 137 × 148 flat in ASA wants a warm chamber and a brim at the corners.

## Status

- [x] Cradle hole pattern reverse-engineered from the STL
- [x] Parametric panel, hook mount, both component interfaces, ghost preview
- [x] Boolean clash checks — bracket clear of both components
- [ ] Measure the chassis bolt size and the boss section
- [x] v1 test print + at-car fitment (2026-08-26): tilt 20° not 30°, FPR right
      fitting hit the fuse box → full v3 relayout (FPR low-left, sensor high-right)
- [x] v3 test print + at-car fitment (2026-08-28) → v4 rework
- [x] v4 test print + at-car fitment (2026-09-01): right mount arm fouled the
      fuse box arm, seat plane still too steep, left arm tie bottoming → v5
      (tilt 10, pad top 16, boss clearance 6)
- [ ] **Measure `chassis_hole_tilt` properly** — walked 30 → 20 → 10 by eye alone
- [ ] Caliper the Redhorse AN6 hose ends + LowDoller sender (no published drawings)
- [ ] Measure the fuse box keep-out for real: left face, wall standoff, notch —
      checks 7 and 8 stay dirty until this is real
- [ ] Cables between panel bottom-left and the DWF110 filter — future keep-out
- [ ] Re-aim the FPR return elbow ghost at the sensor inlet (stale from v1)
- [x] v5 test print + at-car fitment (2026-09-02): panel's lower half kicked off
      the pillar wall → tilt 10 → 13; sensor re-placed (61,−57)/105° →
      (73,−44)/125°; backing pad's tuned top cap replaced by `ffs_top_limit()`
- [ ] **Check 9 is 3212mm³** — the sensor crests the flat top edge at the v9
      position. Settle the sensor, then drive this to zero or accept the notches
- [x] ~~Check 6~~ — removed at v8, not a real joint as drawn
- [ ] v6 test print
- [x] v7 exported (2026-09-03) as `driver-side-bracket-v7.stl` — shape work
      only (flat bottom edge, per-face boss clearance, coved pocket mouth, exact
      sensor dilation, sensor +2 forward / 1 right)
- [x] v7 test print + at-car fitment (2026-09-15): pads gapped ~3mm right /
      ~1mm left → tilt split 8 / 12; fuse box re-drawn; sensor 136°
- [x] v8 exported (2026-09-15) as `driver-side-bracket-v8.stl`
- [x] v8 test print + at-car fitment (2026-09-16): left arm body hit the
      chassis mount → left boss +10mm down; sensor 137°, 2mm right
- [x] v9 exported (2026-09-16) as `driver-side-bracket-v9.stl`
- [x] v10 exported (2026-09-16) — FPR 5° CW / −5mm, third M5 → (38, −89)
- [ ] v10 test print + at-car fitment — left pocket clearance (re-fill the
      breakthrough if roomy), plug-to-fuse-box gap
- [x] v12 exported (2026-09-23) — cable-tie slots, bottom edge −3 under the
      FPR, third M5 → (38, −94), FPR nuts embedded on a 2mm raised pad
- [ ] v12 ASA print — pause at Z 6.0 for the FPR nuts; re-run check 3
      (FPR ∧ sensor) after the FPR's 2mm move forward

## v9 fitment (2026-09-21) — `v9 fitment pics/`

v9 went on the car with both mounts bolted and everything mounted. The
`boss_drop_l` relief cleared the left arm — the conflict from the v8 fit is gone.

Alan's reading of the LEFT chassis mount, which drove all of v11's boss work: it
is a **U** whose two legs hang to different depths, and the outer (his left) leg
also **ramps**, sitting higher at the seat end than at the wall. Air under the
legs, eyeballed: 4 inner, 5 outer at the wall, ~8–10 outer at the seat.

## v11 (2026-09-21)

Boss work, all on the left mount:

- `boss_drop_l` split into per-leg reaches plus per-leg air. The outer leg is a
  ramp, built as a hull between the pocket's end sections so it comes out linear.
- The boss ghost now models the leg reaches, so it no longer tracks the pocket.
  That is what makes the new check 6 mean anything.
- The opening where the left arm meets the pad's back is **closed** (was
  6.8 × 9.7mm at v10, 5.0 × 6.0 at the first pass). Measured by projecting the
  whole bracket along the bolt axis and reading the void, not off a render.
- `boss_pocket_fillet_r` 2 → 1 to buy that. The cove pulls every pocket face in
  by its full radius, so at 1.1mm of floor air a 2mm cove bit the boss (check 6
  hit 5.5mm³). The web is worth more than a millimetre of lip radius.
- `shroud_fillet_r` was tried at 8 and 10 and rejected: +3 and +7mm³. The arm is
  already fuller than that cove, so the radius is not what limits strength there.

FPR turned to 7° and dropped 1 more along its tilted axis. Sensor down 4 along
its own axis — which alone put it 0.77 INSIDE the fuse box — then `ffs_yaw` 2°
about the body's left end swings the connector forward and pulls it back out.
`ffs_yaw` is capped by check 3: 3° touches the FPR, 4° buries 21mm³ in it. The
cradle's mounting face now sits 2° off the panel, so the M5 ears bear on an edge
rather than flat; drift across the panel is ~0.3mm, inside the 1mm those holes
already rattle.

## v11 export (2026-09-21)

`driver-side-bracket-v11.stl` — 17694 triangles, **1 shell**, **0 non-manifold
edges**, 153663mm³ (+9493 vs v10, mostly `ffs_backing` filling the yaw wedge),
bounding box 119.0 × 25.5 × 147.7mm.

Non-manifold edges came back twice more during v11, both times from a sensor
move landing the clearance cut tangent to something. They are always the same
thing: **zero-area triangles with a repeated vertex**, thrown by the sphere
minkowski in `ffs_clearance_cut()`. Dropping them changes no geometry, so the
export now runs through `clean_stl.py` before the file is
called done. Volume and bounding box must come out identical.

## v12 (2026-09-23)

Zip-tie pair for the sensor connector's cable: two vertical 3 × 8 through-slots,
10 c-c, centred on (−6, −72) — 10mm in from the right edge, 15mm below the
right arm's root on the flat face (`tie_*`, derived from `panel_right_x` and the
arm bite). The band crosses behind in a 2mm-deep × 6mm rear-face channel so it
doesn't hold the panel off the pillar wall. Right slot keeps ~3.5mm to the edge;
the channel clears the version engraving by ~1.5mm.

Bottom edge under the FPR pulled down 3mm (`bottom_flat_drop`): flat now at
Z −134.09. The flat starts where the curve reaches that height (X 51.4, was the
right ear at 43.3), so the two meet without a step.

Third M5 moved 5mm down to **(38, −94)** — the rivnut goes there.

**FPR nuts embedded.** The two ear pockets no longer open out the rear face:
1.1mm skin, hex pocket to 6.0mm, then a two-layer stepped bridge (bolt-wide
slot, then bolt-wide square) under the ceiling. **Pause the print at Z 6.0**
(before the first layer above 6.0), drop in two M5 hex nuts, resume. Clamped
plastic above the nut is **4.0mm** (was 3.1 with the open rear pocket): the
steel bracket now sits on a 2mm raised pad (`fpr_pad()`) spanning both ears,
9mm round each hole, and running down to the panel's bottom edge, chamfered 45°
up from the plate face. Moves the FPR 2mm forward. Use **M5 × 12 with a washer** so the tip stops inside the rear skin.
Sensor ear nuts are unchanged: their pockets tilt 15° with the cradle and can't
be sealed flat. Clash checks were not re-run after the FPR's 2mm move.

`driver-side-bracket-v12.stl`, engraved `asandov v12`.
