// =============================================================================
// Parametric Battery Tray — Interstate MTX-35 AGM (BCI Group 35)
// =============================================================================
// Designed for: 2004 WRX engine bay, OEM battery tray location
// Target battery: Interstate MTX-35 AGM
//   L: 9 1/16" (9.0625") = 230.19mm
//   W: 6 15/16" (6.9375") = 176.21mm
//   H: 8 7/8"  (8.8750") = 225.43mm
//
// PRINT MATERIAL: ASA recommended (engine bay heat survival)
// PETG works but softens earlier under prolonged heat soak
// Do NOT use PLA — will deform within months in engine bay heat
// =============================================================================

// ---- BATTERY DIMENSIONS (Interstate MTX-35) ----
batt_length = 230.19;   // 9 1/16"
batt_width  = 176.21;   // 6 15/16"
batt_height = 225.43;   // 8 7/8"  (reference only — wall height set below)

// ---- TRAY PARAMETERS ----
clearance       = 3.0;   // gap between battery and inner wall, per side (mm) — bumped from 2.0 to absorb ASA shrinkage + measurement variance
wall_thickness  = 5.0;   // wall thickness (mm) — outside perimeter lip walls; matches floor_thickness for uniform slab feel
floor_thickness = 5.0;   // floor thickness (mm) — matches OEM ~5mm, minimizes installed battery height penalty
wall_height_mm  = 10.0;  // lip height above the floor (mm). The 3mm support ridges eat into this: engagement against the battery case is wall_height_mm - ridge_height, so this gives 7mm of capture (6.35 gave only 3.35). Costs no hood clearance — the lip sits at the bottom of a 225mm battery.

// ---- BASE FILLETS ----
// Concave cove where the cavity walls meet the floor. The wall/floor junction is a sharp
// internal 90 deg on the TENSION side (cable pull bends the fuse wall outboard) and lands
// on a layer boundary — the usual FDM crack start. Radius 3 exactly fills the dead space:
// inward it uses the 3mm battery clearance, upward the 3mm the ridges already lift the
// battery, so the battery's bottom corner lands tangent and nothing is stolen.
include_base_fillets = true;
base_fillet_r        = 3.0;   // must stay <= min(clearance, ridge_height)

// ---- CORNER COVE (heat shield x fuse wall) ----
// The inside corner where the fuse wall meets the heat shield is a sharp internal 90 deg
// running the wall's full height, and that bond is the fuse wall's only lateral brace.
// A cove spreads the load out of the corner. r=3 fits the dead space exactly: X 5-8 uses
// the battery's X clearance, Y 184.21-187.21 its Y clearance, and the arc is centred on
// the battery's own corner so it stays tangent.
// The two near nut pockets are left OPEN: the cove skips a band at each bolt height so
// there is still room to get a nut in.
include_corner_cove = true;
corner_cove_r       = 3.0;    // must stay <= clearance
// Height of the clear band at each nut pocket, for the HORIZONTAL layout only — there the
// bolts sit 9.71mm from the wall edge and the corner has to stay reachable. The vertical
// layout moves them to ~24mm, so corner_cove() ignores this and runs the cove full height.
// (Do NOT make this a ternary on fuse_holders_vertical: that variable is defined further
// down the file, so it would read as undef here and silently fall through to the else.)
corner_cove_skip_h  = 20.0;

// ---- FRONT CORNER COVE (heat shield x Y_MIN gusset) ----
// Same gulley on the front corner. It differs from the back: above the 10mm lip there is
// no Y_MIN wall, only the heat-shield gusset, and that gusset's concave profile thins as
// it rises. The cove is capped where the gusset still has >= corner_cove_r of material to
// blend into — beyond that it would be a thin fin hanging off the shield face.
include_front_cove = true;

// ---- FEATURES ----
include_drainage   = true;   // Holes in floor for water egress
drainage_dia       = 10.0;   // diameter of drainage holes (mm) — bumped from 8mm for better flow

// ---- SUPPORT RIDGES (raise battery off floor, create drainage channels) ----
include_support_ridges = true;
ridge_count            = 4;     // number of longitudinal ridges across width — creates (ridge_count - 1) channels
ridge_width            = 5.0;   // each ridge width in Y direction (mm)
ridge_height           = 3.0;   // ridges raise battery this far above floor (mm) — water flows through these channels
ridge_x_margin         = 15.0;  // ridges inset from inner cavity X edges (mm)
ridge_outer_inset      = 8.0;   // move outermost ridges this many mm INWARD from default position — keeps battery stable (no teeter)
include_mount_tabs = false;  // External flange tabs for bolting to chassis (off — using OEM hold-down/strap)
mount_tab_width    = 25.0;   // width of each mounting tab (mm)
mount_tab_length   = 30.0;   // how far each tab extends from tray (mm)
mount_hole_dia     = 7.0;    // ~M6 clearance (7mm); use 9mm for M8
include_corner_fillet = true;  // soften corners (cosmetic)
corner_fillet_r    = 3.0;

// ---- EXTRA CORNER PRUNE (chassis clearance) ----
// Test print bumped the chassis at the X_MAX / Y_MAX corner (far short side,
// fuse-wall long side). Round the two X_MAX corners with larger radii than the
// cosmetic 3mm fillet, each independently tunable. Cut runs full height
// (floor + lip). NOTE: at r >= ~17 the arc passes outside the inner cavity
// corner, so the 1/4" lip wall opens at the corner — fine, the strap holds the
// battery; the floor stays solid. At r >= ~27.3 the arc reaches the battery's
// (sharp) corner point at 3mm clearance — stay below that.
include_corner_prune     = true;
corner_prune_ymax_radius = 24.35;  // X_MAX/Y_MAX roundover (mm) — 18 + 1/4" more chassis clearance; lip opens at this corner
corner_prune_ymin_radius = 24.35;  // X_MAX/Y_MIN roundover (mm) — matched to Y_MAX so both X_MAX corners are symmetric; lip opens at this corner

// ---- WEIGHT REDUCTION ----
include_wall_lightening = false;  // cut oval windows in side walls
lightening_count        = 3;       // windows per long side
lightening_width        = 30.0;
lightening_height       = 25.0;

// ---- J-HOOK HOLD-DOWN CLEARANCE ----
// OEM Subaru strap uses 2× J-hooks that pass UP through slots at the center of the long sides.
// One slot per long side; positioned at the midpoint of the long axis (X = outer_l / 2).
include_jhook_slots      = true;
jhook_slot_width         = 10.0;    // slot width along battery long axis X (mm) — M6 rod ~6mm + 2mm tolerance per side
jhook_slot_inward_depth  = 5.0;     // how far the slot extends INWARD from the lip wall into the cavity (mm)
jhook_slot_x_position    = 0.5;     // fraction along outer_l where slot is centered (0.5 = middle)
jhook_slot_top_round_r   = 2.5;     // fillet radius at the top corners of the slot in the lip wall (mm)

// ---- HEAT SHIELD WALL (asymmetric, inspired by OEM 82122AA031 design) ----
// Heat shield goes on a SHORT side of the battery (the side facing the engine).
// Battery length (9 1/16") runs along X axis; battery width (6 15/16") runs along Y axis.
// Short sides are X_MIN and X_MAX. The engine-facing short side = X_MIN (adjust if your install differs).
include_heat_shield      = true;
heat_shield_side         = "X_MIN";  // "X_MIN" or "X_MAX" — pick the engine-facing short side
heat_shield_height_mm    = 203.2;    // 8.00" — covers ~90% of battery height
heat_shield_thickness    = 5.0;      // engine-facing heat shield wall thickness — matches all other walls

// ---- HEAT SHIELD WALL TOP-EDGE ROUNDING ----
// Rounds the two LONG top edges of the heat shield wall (the edges running the full battery-width).
// Eliminates sharp 90° edges on top of the wall — easier on hands, looks more refined.
include_hs_top_round      = true;
hs_top_round_radius       = 4.0;    // radius of rounded top edges of the heat shield wall (mm)

// ---- HEAT SHIELD STRUCTURAL GUSSETS ----
// Two corner bridges INSIDE the tray, between the heat shield and the long-side lip walls.
// Each gusset bridges from the TOP of the long-side lip wall up to a point on the heat shield.
// Curved (concave) gussets distribute load gradually — less stress concentration at the wall base.
include_heat_shield_gussets = true;
gusset_shape             = "CURVED"; // "CURVED" = concave quarter-ellipse hypotenuse (preferred), "STRAIGHT" = right triangle
gusset_base              = 75.0;     // X-extent along the top edge of long-side lip wall (mm) — ~2.95"
gusset_height            = 180.0;    // Z-extent up the heat shield, above the lip wall top (mm) — ~7.1" (~89% of wall height above lip)
gusset_thickness_match_wall = true;  // match wall_thickness (recommended); set false to override below
gusset_thickness_override = 6.0;     // only used if gusset_thickness_match_wall = false
gusset_curve_segments    = 48;       // smoothness of the curved hypotenuse (higher = smoother, slower render)

// ---- INTEGRATED FUSE HOLDER MOUNT ----
// Removed per user — revisit if/when fuse integration is desired
include_fuse_mount       = false;

// ---- FUSE PLATFORM (Blue Sea 5001-style MEGA holders, 2× side-by-side) ----
// Platform extends rearward (+Y direction) from the back-LEFT corner of the tray
// (the X_MIN / Y_MAX corner where the heat shield meets the back lip wall).
// Two fuse holders sit side-by-side, oriented with their LONG AXIS along X
// (parallel to battery long axis — cable runs flow naturally along the battery edge).
// Mounted via M5 thermal heat-set threaded inserts melted into the platform
// (replaced the press-fit rivet nuts, which cracked the boss on install).
include_fuse_platform     = true;
platform_x_width          = 88;    // 2x38.10 holders + 2mm gap + ~5mm margin each side    // X dimension of platform (mm) — fits one fuse length (103.38) + ~2mm margin per side (tight)
platform_y_depth          = 82;     // Y dimension extending REARWARD (mm) — fits 2× 38.10mm fuses + 2mm gap + ~2mm margin per side (tight)
platform_thickness        = 11.3;   // platform slab thickness (mm) — thickened from 8mm so the full 10mm heat-set insert is captured inside the slab (= 10.3 bore + 1mm floor), matching fuse-platform-test.scad. Top Z is fixed by terminal alignment, so the extra thickness extends DOWNWARD (to where the old stubs ended). Gussets carry structural load.
platform_top_z_offset     = -10;    // shift platform top this much (mm) relative to top of heat shield (negative = lower); -10 = fuse stud/cable lug aligned with battery terminal Z for horizontal cable routing
platform_x_origin         = 0;      // X start position of platform (0 = flush with X_MIN heat shield edge)
back_support_wall_thickness = 5;    // thickness of vertical support wall connecting platform to back of tray (mm) — matches all other walls

// ---- FUSE HOLDER DIMENSIONS (Blue Sea 5001-style MEGA) ----
fuse_holder_length        = 103.38; // long axis (now along X — parallel to battery)
fuse_holder_width         = 38.10;  // short axis (now along Y — stacked direction)
fuse_mount_hole_spacing   = 88.58;  // distance between the 2 mount-hole centers along the long axis (X)
fuse_gap                  = 2;      // gap between the two fuse holders along Y (mm) — tight

// ---- HOLDER ORIENTATION ----
// false = long axis along X, the two holders stacked in Z (original layout)
// true  = long axis along Z (VERTICAL), the two holders side by side in X.
// Vertical is preferred: ring terminals leave a stud along the holder's long axis, so
// the lugs then exit UP (straight over the wall to the battery terminal) and DOWN (down
// the outboard face, past the tie slots) instead of sideways off the ends. It also moves
// the bolts well clear of the heat shield — edge distance 9.71mm -> ~26mm — which is what
// made the nut pockets unreachable in the horizontal layout.
// TRUE = long axis along Z, holders side by side in X. Chosen for the bolt clearance
// (edge distance ~24mm vs 9.71 horizontal, which is what made the nut pockets unreachable)
// and because the loads then exit downward past the tie slots.
// COST, accepted deliberately: the 5001's cover exits are on the holder ENDS, so vertical
// offers only up/down entry. Three cables arrive from above (battery to each fuse, plus the
// alternator — the EJ25's sits top-front), against two top exits, so one is forced into a
// 180 deg reversal. That needs the legs ~112mm apart for 1/0; confirmed there is bay space
// for it. Set false for horizontal, where every cable turns only 90 deg instead.
fuse_holders_vertical = true;
fuse_holder_gap_x     = 2;    // gap between the two holders side by side (mm) — check your cover width

// ---- HEAT SHIELD NUT-ACCESS CHAMFER ----
// The two near-end nut pockets start at X 4.98, right against the heat shield's inner
// face at X 5.0, so there is no room to get the nut in. Rather than a square cutout,
// this is a CHAMFER: the inner face eases back over hs_nut_chamfer_len in Y, reaching
// full depth at the pocket mouth and holding it through the corner. Blind — the
// engine-side face stays solid, so the shield keeps shielding.
include_hs_nut_access = false;   // off — the taper fix restored the full 5mm wall, so the pocket clears
hs_nut_relief_depth = 3.0;   // depth into the inner face at the pocket (mm); 3.0 leaves 2.0mm of shield
hs_nut_chamfer_len  = 8.0;   // Y run of the ramp from full wall to full depth (mm) -> ~21 deg
hs_nut_win_z_height = 12.0;  // Z height (mm) — nut is 9.47 across corners, so this is nut + ~1.3/side

// ---- FUSE HOLDER MOUNTING METHOD ----
// "BOLT"   = M5 through-bolt with a plain hex nut recessed into the CAVITY face. The
//            wall's cavity face is flush with the battery box, so a proud nut would eat
//            the 3mm battery clearance — the nut sits in a pocket instead.
// "INSERT" = the original M5 heat-set inserts (bores only, blind from the mount face).
// Through-bolting puts the ASA in compression between head and nut rather than relying
// on brass gripping plastic that creeps at engine-bay temperature.
// M5 is set by the holder, not by us: the Blue Sea 5001 drawing calls out
// "2 MOUNTING HOLES FOR #10 [M5] SCREW". M6 will not pass without drilling the holder.
fuse_mount_mode   = "BOLT";
bolt_clear_dia    = 5.5;   // M5 clearance through-hole, medium fit (mm)
nut_af            = 8.0;   // M5 hex nut across-flats, ISO 4032 (mm)
nut_pocket_af     = 8.2;   // pocket across-flats (mm) — +0.2 is a light press so the nut stays put during assembly
nut_thickness     = 4.7;   // M5 nut thickness, ISO 4032 (mm)
// Bolt tension pulls the nut against the pocket's OUTBOARD floor, so depth beyond the
// nut is thread relief at the cavity end. Without it, an over-long bolt would poke
// past the flush cavity face and hit the battery.
nut_pocket_relief = 1.5;   // spare thread depth past the nut (mm)
nut_pocket_depth  = nut_thickness + nut_pocket_relief;   // leaves 5.1mm of wall under the bolt
// Hex pocket is oriented POINT-UP: bored horizontally into a vertical wall, a flat
// ceiling would sag. A vertex at top gives two ~30°-from-vertical faces that self-support.

// ---- M5 HEAT-SET THREADED INSERTS (active) ----
// Validated on fuse-platform-test.scad + fuse-insert-dia-test-3. Uniform 6.65mm melt-bore; the slab is
// thickened to 11.3mm so the full 10mm insert is captured inside it (1mm floor),
// with a 3mm center drain. (Stub logic below auto-disables at this thickness.)
insert_length              = 10.0;  // insert length (mm) — M5x10
insert_pilot_dia           = 6.65;  // uniform melt-bore dia (mm) — validated via fuse-insert-dia-test-3 (.60/.65/.70 ladder in ASA); 6.65 seats clean, flush, no mushrooming
insert_leadin_dia          = insert_pilot_dia;  // = pilot -> no wider mouth, uniform bore (tapered 7mm end melts into the straight hole)
insert_leadin_depth        = 1.5;   // (moot while leadin_dia == pilot; kept so a flared mouth can be reintroduced)
insert_seat_clearance      = 0.3;   // extra bore depth beyond insert length (mm) so it seats flush at the top
insert_pocket_floor        = 1.0;   // material left below the insert tip (mm)
insert_stub_dia            = 16.0;  // downward boss-stub OD (mm) — matches fph_boss_dia
insert_drain               = true;  // cut a small center drain so condensation can't pool around the brass (engine-bay duty)
insert_drain_dia           = 3.0;   // drain dia (mm) — < pilot keeps an annular floor ledge as a depth-stop; >= pilot opens the floor fully

// ---- ORIGINAL M5 RIVET NUT HOLES (replaced by heat-set inserts — kept for reference) ----
// M5 rivet nut through-hole — manufacturer spec: 6.91-8.51mm acceptable range, 7.3mm chosen
// fuse_mount_hole_dia       = 7.3;    // M5 rivet nut press-fit hole — middle of 6.91-8.51mm spec range
// fuse_mount_rivet_grip_t   = 2.5;    // material thickness AT each rivet location (mm) — rivet nut spec is 0.5-2.5mm; set to spec max (2.5) for the strongest grip ledge that still seats the rivet
// fuse_mount_rivet_length   = 12.0;   // full rivet length from top of platform (mm) — counterbore extends below platform if needed to clear gusset corners
// fuse_mount_counterbore_dia = 11.0;  // diameter of counterbore from underside of platform (mm) — clears rivet body

// ---- FUSE PLATFORM TOP-EDGE ROUNDING ----
// Rounds the 3 OUTSIDE top edges of the platform (left, rear, right) with quarter-cylindrical fillets.
// The FRONT top edge (where the platform meets the wall) stays SQUARE.
// Built via minkowski with sphere on an inset core, then intersected with the original bounds to
// keep the bottom and front faces flat/sharp.
include_fp_top_round      = true;
fp_top_round_radius       = 3.5;    // radius of rounded top edges of the platform (mm)

// ---- FUSE PLATFORM HEXAGONAL THROUGH-CUTS ----
// Honeycomb cut pattern through the full platform thickness (top to bottom) to
// reduce mass. Keeps: 3 vertical solid columns (gusset-aligned), front/mid/rear
// horizontal rims, 16mm bosses around each rivet. The hex grid fills the 4 bays
// between these keepers. Bay area is inset before clipping the grid so hexes
// don't run all the way into the keeper edges.
// Lattice OFF. On the narrowed 88mm wall the four 40mm boss keep-outs overlap each other
// and both end bands, so the pattern was down to fragments and saved ~10g on a ~380g part
// — not worth the three-way tuning between boss/gusset insets and the sliver filter.
// A solid wall is stiffer and has no sliver failure mode. Set true to bring it back
// (widen platform_x_width back toward 108 first, or the pattern has no room to read).
include_fuse_platform_hex_cuts = false;
fph_hex_F           = 10.0;  // mm — hex flat-to-flat dimension
fph_hex_wall        = 3.0;   // mm — wall thickness between adjacent hexes
fph_perimeter_rim   = 4.0;   // mm — front/rear horizontal rim thickness
fph_mid_rib         = 4.0;   // mm — mid horizontal rib (in the fuse gap)
fph_boss_dia        = 16.0;  // mm — solid boss around each fastener (M5 nut pocket A/C 9.47 -> 3.3mm collar)
fph_bay_inset       = 1.5;   // mm — visual margin: bay area is shrunk by this before clipping the hex grid
// Solid band at the X_MIN end of the fuse wall, where it bonds into the heat shield.
// Must stay solid: this bond is the wall's only lateral brace, and the heat-shield
// gusset thins to nothing near the top, so lattice cells there degenerate into slivers.
// Solid full-height columns at BOTH X ends of the fuse wall, each wide enough to
// swallow that end's insert boss. X_MIN is the heat-shield join (the wall's only
// lateral brace); X_MAX is the free edge, the highest-stress line in bending.
// Leaving either as lattice put a boss keep-out mid-cell and produced hairline
// crescents instead of whole cells.
fph_bond_band       = 22.0;  // mm — solid column at the X_MIN (heat-shield) end
fph_end_band        = 22.0;  // mm — solid column at the X_MAX (free) end
// Sliver filter: erode-then-dilate the cell set, deleting any cell narrower than
// 2x this. Cells clipped by the bay edge otherwise survive as hairline slivers —
// unprintable at a 0.8mm nozzle and crack starters in ASA.
fph_min_cell        = 3.5;   // mm — erosion radius; cells thinner than 2x this are dropped
// Margin around the heat-shield gusset keep-out. The gusset's concave arc sweeps
// through the lattice field; too small a margin leaves cells sliced into fragments
// by the arc instead of removed whole. Tuned by eye until no partial cell survives.
// Margin around each fastener boss before clipping cells. In the vertical layout the
// bosses sit mid-field rather than inside the solid end columns, so too small a margin
// leaves cells sliced into crescents instead of removed whole.
fph_boss_inset      = 12.0;   // mm — grow the boss keep-out by this
fph_gusset_inset    = 13.0;  // mm — grow the gusset keep-out by this before clipping cells

// ---- FUSE PLATFORM STRUCTURAL GUSSETS ----
// Curved buttresses UNDER the platform, attached to the outer face of the back support wall.
// Prevents the cantilevered platform from flexing or snapping at the wall joint.
include_fuse_platform_gussets = true;
fp_gusset_y_base          = 82;     // Y-extent: how far the gusset reaches REARWARD along platform underside (mm) — matches platform_y_depth for full-length support
fp_gusset_z_height        = 80;     // Z-extent: how far the gusset reaches DOWN the back support wall (mm)
fp_gusset_thickness       = 5;      // X-thickness of each gusset rib (mm) — matches all other walls

// ---- BACK SUPPORT WALL LIGHTENING ----
// Truss + slot cutouts through the vertical back support wall (the slab holding
// the fuse platform). Removes ~35-45% of wall mass while preserving load paths:
//   - solid edge verticals at left/right (I-beam-style flanges, carry bending)
//   - solid mid-band around middle gusset's X column (gusset force transfer)
//   - solid horizontal bands top (joins to platform) and bottom (joins to rear lip)
// Lower zone (no gussets behind): Warren-truss with 3 alternating triangles
// Upper zone (between gusset X-columns): 1 vertical stadium slot per bay
include_back_wall_lightening = true;
bwl_edge_band               = 15;     // mm — solid verticals at left and right edges of wall
bwl_mid_band_half           = 9;      // mm — half-width of solid mid band around middle gusset
bwl_top_band                = 8;      // mm — solid horizontal band just under platform
bwl_bot_band                = 8;      // mm — solid horizontal band just above rear lip
bwl_chord_band              = 6;      // mm — solid horizontal band between upper/lower zones
bwl_webbing                 = 6;      // mm — wall material between adjacent cutouts (truss thickness)


// ---- FUSE WALL (vertical mount — supersedes the horizontal platform) ----
// The mounting surface is turned 90° into a vertical wall at the back-left (Y_MAX)
// corner. The two fuse holders sit LONG-AXIS HORIZONTAL, stacked vertically, and
// bolt to the REAR (+Y, outboard) face via M5 heat-set inserts that bore in
// HORIZONTALLY (-Y). The wall rises from the back lip; its left end (X=0..heat
// shield thickness) bonds into the tall X_MIN heat shield for lateral bracing —
// this replaces the removed curved gussets. Set fuse_wall_mode=false to revert to
// the legacy horizontal platform.
fuse_wall_mode      = true;
fuse_wall_thickness = 11.3;  // Y thickness (mm) — houses the 10mm insert horizontally (10.3 bore + 1mm floor); matches the validated slab
// Wall rises from the back lip up to fuse_wall_top_z. Default top reuses the proven
// terminal-alignment height (floor + heat-shield height + platform_top_z_offset,
// ~198mm) so the fuses sit high and cables route only a short hop up to the battery
// terminal. Override fuse_wall_top_z with a literal to taste.
// Wall top. Previously tied to the heat shield height, which left ~40mm of wall above the
// holders doing nothing. Nothing routes over this edge: the battery's rear face is only
// 3mm from the wall's inner face, so a cable can never cross the top and turn inboard —
// it stays outboard until it clears the battery top (Z 233.4). So the wall only has to
// carry the holders plus a rim. Set from the holders: holder top + fuse_top_inset.
fuse_wall_top_z     = 168.2;
// Gap from the wall top down to the top edge of the holders. This is really a cable-bend
// budget: lowering the holders lengthens the vertical run from the upper lug to the wall's
// top edge, which is the radius the cable turns through to get over it. 34 gives 60.3mm of
// rise — about 4.3x OD for 1/0, inside the usual 4-6x minimum bend spec.
// Sets where the holders sit in the wall's height, which splits a fixed budget between
// TOP bend room (upper lug -> over the wall top, to the battery) and BOTTOM bend room
// (lower lug -> down and away: audio feed on one, alternator charge on the other).
// 40 gives 66mm top / 81mm bottom, both past the ~60mm minimum for 1/0.
// Upper limit is ~44: below that the holder's bottom edge drops past Z 50 where the foot
// S-curve starts easing the mount face inboard, and the holder would no longer bear flat.
fuse_top_inset      = 10;   // rim above the holders (mm)
fuse_wall_round_r   = 3;     // radius for rounding the wall's OUTER edges — top, left/right sides, rear face (mm). Inner face + base stay flat (bonding surfaces). 0 = sharp.
fuse_wall_lattice_round = 0.6;  // roundover radius on the lattice OPENING edges/rims (mm) — softens every cell rim on both faces. 0 = sharp.
// Solid FOOT at the bottom of the wall: the bottom fuse_wall_foot_height (above the
// floor) stays solid (flat cavity face = battery-box wall) and the lattice lands on
// top of it. The rear/outboard face of this foot is shaped as a smooth S-curve below.
fuse_wall_foot_height = 45;   // height of the solid foot above the floor (mm)
// Foot chamfer (rear/outboard face): shape the bottom-outboard as a smooth S-curve
// (ogee) easing from the full mount face down into the tray's outside wall, tangent at
// both ends. Height matched to the foot so the lattice lands on the foot top. 0 = disable.
fuse_wall_foot_chamfer_h = fuse_wall_foot_height - wall_height_mm;   // S-curve height above wall base (mm)
// Inner relief: hollow the wall from the CAVITY side down to a thin web flush with the
// rear mount face. Set = fuse_wall_thickness (default) to disable, so the lattice ribs
// are the same full thickness as the solid foot — one uniform slab, cells cut clean
// through. Lower it only to trade wall stiffness for weight.
fuse_wall_web_thickness = fuse_wall_thickness;   // retained web thickness at the mount face (mm); bosses stay full fuse_wall_thickness
// Wall lightening style: "TRUSS" = Warren triangular cutouts (prints better
// right-side-up — angled edges self-support; matches the old back support wall) or
// "HEX" = honeycomb. Both keep a perimeter rim, 16mm bosses, and the gusset solid.
fuse_wall_lightening_style = "TRIROUND";  // TRUSS | TRIROUND | DIAMOND | HEXPOINTY | HEX
// Lattice bottom: the openwork tiles down to the TOP of the solid foot so it lands on
// the foot's top surface; the solid foot carries load to the floor below. (Lower it to
// run the lattice further down; higher for a taller solid base.)
fuse_wall_lightening_z_base = floor_thickness + fuse_wall_foot_height;
// Graded ribs: optionally thicken the lattice ribs near the bottom edge. Off by
// default — the lattice now lands on a solid foot, so no bridging is needed, and the
// rib-growth offset would otherwise notch the bottom cells into "tree" shapes. Raise
// fuse_wall_bottom_rib_boost only if running the lattice down into open base material.
fuse_wall_bottom_rib_boost = 0;     // max extra rib half-thickness near the bottom (mm); 0 = clean uniform cells
fuse_wall_bottom_bridge_h  = 32;    // height over which the thickening fades out (mm)
fwt_tri_base    = 26;        // truss triangle base width along X (mm)
fwt_tri_height  = 30;        // truss row height along Z (mm)
fwt_webbing     = 6;         // web (wall material) left between adjacent triangles (mm)

// ---- HOLDER CENTRES (vertical layout) ----
fuse_hx_ctr = [ platform_x_origin + platform_x_width/2 - (fuse_holder_width + fuse_holder_gap_x)/2,
                platform_x_origin + platform_x_width/2 + (fuse_holder_width + fuse_holder_gap_x)/2 ];

// ---- HEAT SHIELD CABLE CLAMP (disabled) ----
// Kept parametric but off: the alternator run loops in open bay off the X_MIN side and is
// clamped only at the fuse wall, so the shield face needs no penetrations.
include_hs_tie_slots = false;   // off: alternator is clamped only under the fuse brackets
hs_tie_y        = 155.0;  // Y centre of the pair (mm) — mid-span of the shield
hs_tie_z        = 190.0;  // Z height (mm) — inside the vertical descent, above where it peels off
hs_tie_pitch    = 22.0;   // Y centre-to-centre (mm) — suits a 13mm cable plus a heavy tie
hs_tie_w        = 3.0;    // slot width in Y (mm) — also the bridged span
hs_tie_h        = 10.0;   // slot height in Z (mm)
// The tie's band crosses the CAVITY face, which has only 3mm of battery clearance. This
// channel lets it sit flush instead of eating into that gap.
hs_tie_relief_d = 2.0;    // channel depth into the cavity face (mm)
hs_tie_relief_h = 6.0;    // channel height in Z (mm)

// ---- CABLE TIE-DOWN SLOTS ----
// Pairs of through-slots in the fuse wall's SOLID FOOT (no lattice below Z 50). A tie
// passes out one slot, round the cable, back in the other. Purpose is strain relief:
// the engine moves relative to the chassis-mounted tray, and without an anchor that
// motion is reacted at the fuse stud, swinging a 183mm cantilever. Anchoring low puts
// the load into the floor instead. Slots are elongated in Z so the printed ceiling
// spans only tie_slot_w — self-supporting at a 0.8mm nozzle.
include_cable_tie_slots = true;
tie_slot_w      = 3.0;    // slot width along X (mm) — also the bridged span
tie_slot_h      = 10.0;   // slot height along Z (mm)
tie_slot_pitch  = 22.0;   // centre-to-centre of the two slots in a pair (mm)
// Height of the pair. Lower is structurally better — cable load goes more directly into
// the floor instead of bending the wall. Bounded below by the foot S-curve, which thins
// the wall toward the base: 8.15mm of material at Z 25, 6.30mm at Z 15.
tie_slot_z      = 25.0;
// X centre of each pair. Vertical holders put a lug directly above each pair, so the
// cables run straight down onto them; horizontal falls back to the old hand-picked spots.
// X centre of each pair. The audio feed rises straight to its lug so its pair sits under
// it. The alternator arrives from the engine side and hugs the wall further left — it
// crosses Z 25 at about X 14 — so its pair is shifted toward the heat shield. Not further:
// at pitch 22 a centre of 18 puts the outer slot at X 7, leaving 5.5mm of edge material.
// One pair directly under each lower lug. The audio feed rises against the wall and passes
// its pair cleanly; the alternator's U-loop hangs in open bay and will likely want its own
// P-clamp rather than these — they are placed under the lug as the defensible default.
tie_slot_x      = fuse_holders_vertical ? fuse_hx_ctr : [25, 54];

// ---- DERIVED ----
inner_l = batt_length + 2 * clearance;   // cavity length
inner_w = batt_width  + 2 * clearance;   // cavity width
wall_h  = wall_height_mm;                // wall height above floor (absolute)
outer_l = inner_l + 2 * wall_thickness;
outer_w = inner_w + 2 * wall_thickness;
total_h = wall_h + floor_thickness;

// =============================================================================
// MAIN ASSEMBLY
// =============================================================================

difference() {
    union() {
        // Tray body (box with cavity)
        tray_body();
        // Mounting tabs
        if (include_mount_tabs) mounting_tabs();
        // Heat shield wall (asymmetric, one short side)
        if (include_heat_shield) heat_shield();
        // Heat shield structural gussets
        if (include_heat_shield && include_heat_shield_gussets) heat_shield_gussets();
        // Cove up the heat-shield / fuse-wall inside corner
        if (include_corner_cove && include_heat_shield && include_fuse_platform && fuse_wall_mode)
            corner_cove();
        if (include_front_cove && include_heat_shield) front_corner_cove();
        // Cove fillets at the wall/floor junction
        if (include_base_fillets) base_fillets();
        // Support ridges (raise battery off floor for drainage)
        if (include_support_ridges) support_ridges();
        // Fuse holder mounting pad
        if (include_fuse_mount && include_heat_shield) fuse_mount_pad();
        // ---- FUSE MOUNTING ----
        if (include_fuse_platform) {
            if (fuse_wall_mode) {
                // NEW: vertical fuse wall at the back-left corner (fuses bolt to
                // the rear face via horizontal heat-set inserts). No gussets —
                // the wall rises from the back lip and bonds into the heat shield.
                fuse_wall();
                // Foot that binds the wall's outboard down to the tray bottom edge
                fuse_wall_foot_buttress();
            } else {
                // LEGACY: horizontal cantilevered platform + curved gussets
                fuse_platform();
                if (include_fuse_platform_gussets) fuse_platform_gussets();
                fuse_platform_insert_stubs();
            }
        }
    }
    // Drainage
    if (include_drainage) drainage_holes();
    // Lightening windows
    if (include_wall_lightening) lightening_windows();
    // J-hook slots through long-side lip walls
    if (include_jhook_slots) jhook_slots();
    // Extra roundover on the two X_MAX corners (chassis clearance)
    if (include_corner_prune) {
        corner_prune_cut(corner_prune_ymax_radius, "Y_MAX");
        corner_prune_cut(corner_prune_ymin_radius, "Y_MIN");
    }
    // Fuse mounting screw holes (subtracted after pad is added)
    if (include_fuse_mount && include_heat_shield) fuse_mount_holes();
    // ---- FUSE MOUNTING cuts ----
    if (include_fuse_platform) {
        if (fuse_wall_mode) {
            if (include_hs_tie_slots && include_heat_shield) hs_tie_slots();
            // Cable strain-relief tie slots through the solid foot
            if (include_cable_tie_slots) cable_tie_slots();
            // Fastener cuts into the rear wall face (bolt-through or heat-set insert)
            if (fuse_mount_mode == "BOLT") fuse_wall_bolt_holes();
            else                           fuse_wall_insert_holes();
            // Reach-in windows so the captive nuts can actually be seated
            if (fuse_mount_mode == "BOLT" && include_hs_nut_access && include_heat_shield)
                hs_nut_access_windows();
            // Wall-face lightening (pattern set by fuse_wall_lightening_style)
            if (include_fuse_platform_hex_cuts) fuse_wall_lightening_cuts();
            // Inner relief: hollow from the cavity side, keeping the lattice/rim/
            // bosses flush at the mount face so holders bear on a flat surface
            fuse_wall_inner_relief();
            // Foot chamfer: trim the overhanging bottom-outboard corner
            fuse_wall_foot_chamfer();
        } else {
            // LEGACY platform cuts
            fuse_platform_holes();
            if (include_back_wall_lightening) back_support_wall_lightening();
            if (include_fp_top_round) back_support_wall_right_fillet();
            if (include_fuse_platform_hex_cuts) fuse_platform_hex_cuts();
        }
    }
}

// =============================================================================
// MODULES
// =============================================================================

module hs_tie_slots() {
    // Through-slots along X, plus a flush channel on the cavity face for the tie band.
    rr = hs_tie_w/2;
    for (dy = [-hs_tie_pitch/2, hs_tie_pitch/2])
        translate([-1, hs_tie_y + dy, hs_tie_z])
            rotate([0, 90, 0])
                linear_extrude(heat_shield_thickness + 2)
                    hull()
                        for (da = [-(hs_tie_h/2 - rr), hs_tie_h/2 - rr])
                            translate([da, 0]) circle(r = rr, $fn = 20);
    // recess for the tie band on the battery side
    translate([heat_shield_thickness - hs_tie_relief_d,
               hs_tie_y - hs_tie_pitch/2 - hs_tie_w,
               hs_tie_z - hs_tie_relief_h/2])
        cube([hs_tie_relief_d + 1, hs_tie_pitch + 2*hs_tie_w, hs_tie_relief_h]);
}

module cable_tie_slots() {
    // Stadium-shaped slots, bored along -Y through the foot.
    y_start = outer_w - wall_thickness + fuse_wall_thickness + 2;
    depth   = fuse_wall_thickness + 6;
    rr      = tie_slot_w / 2;
    for (xc = tie_slot_x)
        for (dx = [-tie_slot_pitch/2, tie_slot_pitch/2])
            translate([xc + dx, y_start, tie_slot_z])
                rotate([90, 0, 0])
                    linear_extrude(depth)
                        hull()
                            for (dz = [-(tie_slot_h/2 - rr), tie_slot_h/2 - rr])
                                translate([0, dz]) circle(r = rr, $fn = 24);
}

module corner_cove_2d(r) {
    // Cove hugging a corner whose walls run +X and -Y from the origin.
    difference() {
        translate([0, -r]) square([r, r]);
        translate([r, -r]) circle(r = r, $fn = 32);
    }
}

module front_corner_cove() {
    // Vertical cove at the heat-shield / Y_MIN corner. Walls run +X and +Y from the
    // corner, so the back cove's profile is mirrored in Y.
    r  = corner_cove_r;
    x0 = heat_shield_thickness;
    y0 = wall_thickness;
    z0 = floor_thickness;
    // Cap: the gusset (concave quarter-ellipse) must still be >= r thick in X.
    // x_max(b) = base - base*sqrt(1 - ((b-h)/h)^2);  solve x_max = r for b.
    g_on  = include_heat_shield && include_heat_shield_gussets;
    b_lim = gusset_height * (1 - sqrt(1 - pow((gusset_base - r)/gusset_base, 2)));
    z1    = g_on ? floor_thickness + wall_h + b_lim   // blends into the gusset
                 : floor_thickness + wall_h;          // no gusset: stop at the lip top
    translate([x0, y0, z0])
        linear_extrude(z1 - z0)
            scale([1, -1]) corner_cove_2d(r);
}

module corner_cove() {
    r  = corner_cove_r;
    x0 = heat_shield_thickness;          // heat shield inner face
    y1 = outer_w - wall_thickness;       // fuse wall cavity face
    z0 = floor_thickness;                // continuous with the base fillets
    z1 = fuse_wall_top_z;
    fuse2_z = fuse_wall_top_z - fuse_top_inset - fuse_holder_width/2;
    fuse1_z = fuse2_z - fuse_holder_width - fuse_gap;
    difference() {
        translate([x0, y1, z0])
            linear_extrude(z1 - z0)
                corner_cove_2d(r);
        // keep the nut pockets reachable (horizontal layout only) — evaluated here, in a
        // module body, where every global is already assigned
        if (!fuse_holders_vertical && corner_cove_skip_h > 0)
            for (zc = [fuse1_z, fuse2_z])
                translate([x0 - 1, y1 - r - 1, zc - corner_cove_skip_h/2])
                    cube([r + 2, r + 2, corner_cove_skip_h]);
    }
}

module cove_profile_2d(r) {
    // Concave quarter: material hugging the (0,0) corner, bounded by an arc of radius r.
    difference() {
        square([r, r]);
        translate([r, r]) circle(r = r, $fn = 32);
    }
}

module base_fillets() {
    r  = base_fillet_r;
    zf = floor_thickness;
    x0 = wall_thickness;              x1 = wall_thickness + inner_l;
    y0 = wall_thickness;              y1 = wall_thickness + inner_w;
    // Four straight runs; they overlap harmlessly at the corners.
    // X_MIN (inward +X)
    translate([x0, y1, zf]) rotate([90, 0, 0])
        linear_extrude(inner_w) cove_profile_2d(r);
    // X_MAX (inward -X)
    translate([x1, y1, zf]) rotate([90, 0, 0])
        linear_extrude(inner_w) scale([-1, 1]) cove_profile_2d(r);
    // Y_MIN (inward +Y)
    translate([x0, y0, zf]) rotate([0, 0, 90]) rotate([90, 0, 0])
        linear_extrude(inner_l) cove_profile_2d(r);
    // Y_MAX (inward -Y)
    translate([x0, y1, zf]) rotate([0, 0, 90]) rotate([90, 0, 0])
        linear_extrude(inner_l) scale([-1, 1]) cove_profile_2d(r);
}

module tray_body() {
    difference() {
        // Outer block
        if (include_corner_fillet) {
            rounded_box(outer_l, outer_w, total_h, corner_fillet_r);
        } else {
            cube([outer_l, outer_w, total_h]);
        }
        // Inner cavity (the part the battery sits in)
        translate([wall_thickness, wall_thickness, floor_thickness])
            cube([inner_l, inner_w, wall_h + 1]);
    }
}

module mounting_tabs() {
    // Four tabs — one at each corner of the long sides
    // Adjust positions to match your chassis mounting points after physical measurement
    tab_z_offset = 0;          // sit at floor level
    tab_thickness = floor_thickness;
    inset = wall_thickness;    // distance from corner inward along long edge

    // Front-left
    translate([inset, -mount_tab_length, tab_z_offset])
        tab(mount_tab_width, mount_tab_length, tab_thickness);
    // Front-right
    translate([outer_l - inset - mount_tab_width, -mount_tab_length, tab_z_offset])
        tab(mount_tab_width, mount_tab_length, tab_thickness);
    // Rear-left
    translate([inset, outer_w, tab_z_offset])
        tab(mount_tab_width, mount_tab_length, tab_thickness);
    // Rear-right
    translate([outer_l - inset - mount_tab_width, outer_w, tab_z_offset])
        tab(mount_tab_width, mount_tab_length, tab_thickness);
}

module tab(w, l, t) {
    difference() {
        cube([w, l, t]);
        // Hole through the tab
        translate([w/2, l/2, -1])
            cylinder(d=mount_hole_dia, h=t+2, $fn=24);
    }
}

module drainage_holes() {
    // Holes positioned IN the channels between support ridges (when ridges are enabled),
    // so the battery resting on the ridges has clear water paths to each hole.
    // If ridges are disabled, falls back to a 3×2 grid.
    cols = 3;  // holes along X direction
    margin_l = inner_l * 0.2;
    span_l = inner_l - 2 * margin_l;

    if (include_support_ridges && ridge_count >= 2) {
        n_channels = ridge_count - 1;
        for (ch = [0 : n_channels - 1]) {
            // Channel center = midpoint between adjacent ridges (uses actual inset positions)
            y_center = (ridge_y_pos(ch) + ridge_width + ridge_y_pos(ch + 1)) / 2;
            for (col = [0 : cols - 1]) {
                x_pos = wall_thickness + margin_l + col * span_l / (cols - 1);
                translate([x_pos, y_center, -1])
                    cylinder(d=drainage_dia, h=floor_thickness+2, $fn=32);
            }
        }
    } else {
        // Fallback: 3×2 grid
        rows = 2;
        margin_w = inner_w * 0.2;
        span_w = inner_w - 2 * margin_w;
        for (i = [0 : cols-1]) {
            for (j = [0 : rows-1]) {
                x = wall_thickness + margin_l + (cols == 1 ? span_l/2 : i * span_l / (cols-1));
                y = wall_thickness + margin_w + (rows == 1 ? span_w/2 : j * span_w / (rows-1));
                translate([x, y, -1])
                    cylinder(d=drainage_dia, h=floor_thickness+2, $fn=32);
            }
        }
    }
}

module lightening_windows() {
    // Cut oval windows in the two long side walls
    z_center = floor_thickness + wall_h/2;
    for (side = [0, 1]) {
        y_pos = side == 0 ? -1 : outer_w - wall_thickness + 1;
        for (i = [0 : lightening_count - 1]) {
            x_center = wall_thickness + inner_l * (i + 1) / (lightening_count + 1);
            translate([x_center, y_pos, z_center])
                rotate([90, 0, 0])
                    rotate([0, 0, 90])
                        scale([lightening_height/lightening_width, 1, 1])
                            cylinder(d=lightening_width, h=wall_thickness+2, center=true, $fn=48);
        }
    }
}

module heat_shield() {
    // Tall wall on one SHORT side (X_MIN or X_MAX), inspired by OEM 82122AA031 design
    // Acts as radiant heat shield from engine bay heat.
    // If include_hs_top_round is true, ONLY the OUTSIDE top edge (engine-facing) is rounded.
    // The INSIDE top edge (cavity-facing) stays square.
    shield_h = heat_shield_height_mm;
    total_h = shield_h + floor_thickness;
    r = include_hs_top_round ? hs_top_round_radius : 0;

    if (heat_shield_side == "X_MIN") {
        // X_MIN: outside is the LEFT face of the polygon (X=0), inside is RIGHT (X=heat_shield_thickness)
        if (r > 0) {
            translate([0, outer_w, 0])
                rotate([90, 0, 0])
                    linear_extrude(outer_w)
                        rounded_top_one_corner_rect_2d(heat_shield_thickness, total_h, r, "LEFT");
        } else {
            cube([heat_shield_thickness, outer_w, total_h]);
        }
    } else if (heat_shield_side == "X_MAX") {
        // X_MAX: outside is the RIGHT face (X=w), inside is LEFT
        if (r > 0) {
            translate([outer_l - heat_shield_thickness, outer_w, 0])
                rotate([90, 0, 0])
                    linear_extrude(outer_w)
                        rounded_top_one_corner_rect_2d(heat_shield_thickness, total_h, r, "RIGHT");
        } else {
            translate([outer_l - heat_shield_thickness, 0, 0])
                cube([heat_shield_thickness, outer_w, total_h]);
        }
    } else if (heat_shield_side == "Y_MIN") {
        translate([0, 0, 0])
            cube([outer_l, heat_shield_thickness, total_h]);
    } else if (heat_shield_side == "Y_MAX") {
        translate([0, outer_w - heat_shield_thickness, 0])
            cube([outer_l, heat_shield_thickness, total_h]);
    }
}

module rounded_top_one_corner_rect_2d(w, h, r, round_corner) {
    // 2D rectangle from (0,0) to (w, h) with ONE top corner rounded.
    // round_corner = "LEFT"  → top-left rounded, top-right square
    // round_corner = "RIGHT" → top-right rounded, top-left square
    // Built by SUBTRACTING the corner sliver outside the arc, not by hull()ing a circle
    // into the rect. With r > w/2 (here r=4 on a w=5 wall) the circle reaches x=2r=8,
    // and a hull drags the opposite face out to meet it — silently tapering the wall
    // from w at the base to 2r at the top. Subtraction can only ever remove material.
    if (round_corner == "LEFT") {
        difference() {
            square([w, h]);
            difference() {                                 // sliver: corner box minus the arc
                translate([0, h - r]) square([r, r]);
                translate([r, h - r]) circle(r=r, $fn=48);
            }
        }
    } else {  // round_corner == "RIGHT"
        difference() {
            square([w, h]);
            difference() {
                translate([w - r, h - r]) square([r, r]);
                translate([w - r, h - r]) circle(r=r, $fn=48);
            }
        }
    }
}

module fuse_mount_pad() {
    // Pad extends OUTWARD from the heat shield wall (away from battery cavity)
    // Sized to mount Fastronix 500-040 250A MEGA fuse holder via #10 screws
    x_center = outer_l * fuse_mount_x_position;
    z_center = floor_thickness + heat_shield_height_mm * fuse_mount_z_position;
    if (heat_shield_side == "Y_MIN") {
        // Heat shield on -Y side; pad extends in -Y direction
        translate([x_center - fuse_mount_pad_l/2, -fuse_mount_pad_w, z_center - fuse_mount_pad_t/2])
            cube([fuse_mount_pad_l, fuse_mount_pad_w + heat_shield_thickness, fuse_mount_pad_t + 1]);
    } else {
        // Heat shield on +Y side; pad extends in +Y direction
        translate([x_center - fuse_mount_pad_l/2, outer_w - heat_shield_thickness, z_center - fuse_mount_pad_t/2])
            cube([fuse_mount_pad_l, fuse_mount_pad_w + heat_shield_thickness, fuse_mount_pad_t + 1]);
    }
}

module fuse_mount_holes() {
    // 4× #10 screw clearance holes in a rectangular pattern through the fuse mount pad
    x_center = outer_l * fuse_mount_x_position;
    z_center = floor_thickness + heat_shield_height_mm * fuse_mount_z_position;
    pad_face_y = (heat_shield_side == "Y_MIN") ? -fuse_mount_pad_w/2 : outer_w + fuse_mount_pad_w/2 - heat_shield_thickness;
    for (dx = [-fuse_screw_spacing_l/2, fuse_screw_spacing_l/2]) {
        for (dz = [-fuse_screw_spacing_w/2, fuse_screw_spacing_w/2]) {
            translate([x_center + dx, pad_face_y, z_center + dz])
                rotate([90, 0, 0])
                    cylinder(d=fuse_screw_dia, h=fuse_mount_pad_w + heat_shield_thickness + 4, center=true, $fn=24);
        }
    }
}

// Helper: compute Y position of ridge index i, with outermost ridges shifted inward
// The 4 holder fastener positions as [x, z] on the wall face. Every consumer — bolt
// holes, insert bores, and the lattice boss keep-outs — reads this, so a keep-out can
// never drift away from the hole it is protecting.
function fuse_fastener_positions() =
    let(
        // horizontal: holes along X, two rows stacked in Z
        hx0 = platform_x_origin + (platform_x_width - fuse_holder_length)/2
              + (fuse_holder_length - fuse_mount_hole_spacing)/2,
        hx1 = hx0 + fuse_mount_hole_spacing,
        hz1 = fuse_wall_top_z - fuse_top_inset - fuse_holder_width/2,
        hz0 = hz1 - fuse_holder_width - fuse_gap,
        // vertical: holes along Z, two columns side by side in X
        vctr = fuse_wall_top_z - fuse_top_inset - fuse_holder_length/2,
        vz0  = vctr - fuse_mount_hole_spacing/2,
        vz1  = vctr + fuse_mount_hole_spacing/2
    )
    fuse_holders_vertical
        ? [ [fuse_hx_ctr[0], vz0], [fuse_hx_ctr[0], vz1],
            [fuse_hx_ctr[1], vz0], [fuse_hx_ctr[1], vz1] ]
        : [ [hx0, hz0], [hx0, hz1], [hx1, hz0], [hx1, hz1] ];

function ridge_y_pos(i) =
    let(spacing = (inner_w - ridge_width) / (ridge_count - 1))
    let(base_y = wall_thickness + i * spacing)
    (i == 0) ? base_y + ridge_outer_inset :
    (i == ridge_count - 1) ? base_y - ridge_outer_inset :
    base_y;

module fuse_platform() {
    // Two parts:
    //   1) Vertical support wall extending from top of Y_MAX lip wall up to platform bottom,
    //      spanning the X width of the platform — provides structural support
    //   2) Horizontal platform slab extending REARWARD (+Y) from the back of the tray,
    //      holding 2 fuse holders side-by-side along X.
    //      All 4 top OUTSIDE edges (left, rear, right, front) are rounded if include_fp_top_round is true.
    //      The wall is shortened by r at the top so the rounded platform takes over the front-top edge.
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    platform_bot_z = platform_top_z - platform_thickness;
    wall_start_z   = floor_thickness + wall_h;
    y_front = outer_w - back_support_wall_thickness;
    y_rear  = outer_w + platform_y_depth;
    r = include_fp_top_round ? fp_top_round_radius : 0;
    wall_top_z = platform_top_z - r;  // wall stops short of platform top to expose rounded front-top edge

    // Vertical back support wall (top shortened by r so the rounded platform face shows above)
    translate([platform_x_origin, y_front, wall_start_z])
        cube([platform_x_width, back_support_wall_thickness, wall_top_z - wall_start_z]);

    // Horizontal platform slab
    if (r > 0) {
        // Rounded top edges via minkowski + sphere, clipped to original bounds
        intersection() {
            // Original bounding box clips the minkowski overhang on bottom
            translate([platform_x_origin, y_front, platform_bot_z])
                cube([platform_x_width, back_support_wall_thickness + platform_y_depth, platform_thickness]);

            // Inner core: offset inward by r on left/right/front/rear/top; bottom flush
            // After minkowski with sphere(r), grows back to original bounds on offset sides
            // and overflows on the flush bottom (clipped above)
            minkowski() {
                translate([platform_x_origin + r, y_front + r, platform_bot_z])
                    cube([platform_x_width - 2*r,
                          back_support_wall_thickness + platform_y_depth - 2*r,
                          platform_thickness - r]);
                sphere(r=r, $fn=24);
            }
        }
    } else {
        // No rounding: simple sharp cube
        translate([platform_x_origin, y_front, platform_bot_z])
            cube([platform_x_width, back_support_wall_thickness + platform_y_depth, platform_thickness]);
    }
}

module fuse_platform_gussets() {
    // Two curved gussets UNDER the platform: one at each X end (X=0 and X=platform_x_width).
    // Each gusset attaches to the REAR face of the back support wall (at Y=outer_w) and
    // the UNDERSIDE of the platform (at Z=platform_bot_z), with the curve in the YZ plane
    // (front-to-back). Gusset thickness extends along the X axis.
    // Uses nested rotates so rotation order is unambiguous:
    //   inner rotate Z by 90  → polygon's +X → +Y (rearward), polygon's +Y → -X
    //   outer rotate Y by -90 → polygon's now-(-X) direction → -Z (downward), extrusion → -X
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    platform_bot_z = platform_top_z - platform_thickness;

    // Gusset at X=0 end: corner at world (X=fp_gusset_thickness, Y=outer_w, Z=platform_bot_z),
    // extruding in -X so prism occupies X=0..fp_gusset_thickness
    translate([fp_gusset_thickness, outer_w, platform_bot_z])
        rotate([0, -90, 0])
            rotate([0, 0, 90])
                linear_extrude(fp_gusset_thickness)
                    gusset_2d_shape(fp_gusset_y_base, fp_gusset_z_height);

    // Gusset at X=platform_x_width end: corner at world (X=platform_x_width, Y=outer_w, Z=platform_bot_z),
    // extruding in -X so prism occupies X=(platform_x_width - thick)..platform_x_width
    translate([platform_x_width, outer_w, platform_bot_z])
        rotate([0, -90, 0])
            rotate([0, 0, 90])
                linear_extrude(fp_gusset_thickness)
                    gusset_2d_shape(fp_gusset_y_base, fp_gusset_z_height);

    // Middle gusset: centered at X = platform_x_width / 2, halfway between the two end gussets
    // Corner at (X = midpoint + thickness/2), extruding in -X so prism is centered on the midpoint
    translate([platform_x_width / 2 + fp_gusset_thickness / 2, outer_w, platform_bot_z])
        rotate([0, -90, 0])
            rotate([0, 0, 90])
                linear_extrude(fp_gusset_thickness)
                    gusset_2d_shape(fp_gusset_y_base, fp_gusset_z_height);
}

module fuse_platform_holes() {
    // 4 holes through the platform: 2 per fuse holder, 2 fuse holders total
    // Each fuse oriented with long axis along X (parallel to battery long axis)
    // Mount holes spaced fuse_mount_hole_spacing apart along X
    // Two fuses stacked along Y (each at a different Y center, both share the same 2 X positions)
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    platform_bot_z = platform_top_z - platform_thickness;

    // X positions of the 2 mount holes (shared by both fuses since they're stacked, not side-by-side in X)
    platform_x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    fuse_x_start = platform_x_origin + platform_x_edge_margin;
    fuse_inset_from_end = (fuse_holder_length - fuse_mount_hole_spacing) / 2;  // 7.4mm
    hole_x_near = fuse_x_start + fuse_inset_from_end;
    hole_x_far  = hole_x_near + fuse_mount_hole_spacing;

    // Y centers of the 2 fuse holders (stacked along Y inside the platform area)
    platform_y_edge_margin = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
    fuse1_y_start = outer_w + platform_y_edge_margin;                              // fuse1 closer to tray
    fuse2_y_start = fuse1_y_start + fuse_holder_width + fuse_gap;                  // fuse2 further rearward
    fuse1_y_center = fuse1_y_start + fuse_holder_width / 2;
    fuse2_y_center = fuse2_y_start + fuse_holder_width / 2;

    // ---- HEAT-SET INSERT path (active) ----
    // Uniform 6.1mm bore sunk from the TOP face deep enough to swallow the full
    // insert (+ seat clearance), leaving a 1mm floor inside the 11.3mm slab.
    // A 3mm center drain then opens that floor to the underside so condensation
    // can't pool around the brass.
    insert_pocket_depth = insert_length + insert_seat_clearance;
    pocket_bot_z = platform_top_z - insert_pocket_depth;
    stub_height  = max(0, insert_pocket_depth + insert_pocket_floor - platform_thickness);
    stub_bot_z   = platform_bot_z - stub_height;
    for (hx = [hole_x_near, hole_x_far]) {
        for (hy = [fuse1_y_center, fuse2_y_center]) {
            translate([hx, hy, pocket_bot_z])
                cylinder(d=insert_pilot_dia, h=insert_pocket_depth + 1, $fn=48);
            translate([hx, hy, platform_top_z - insert_leadin_depth])
                cylinder(d=insert_leadin_dia, h=insert_leadin_depth + 1, $fn=48);
            if (insert_drain && insert_drain_dia > 0)
                translate([hx, hy, stub_bot_z - 1])
                    cylinder(d=insert_drain_dia,
                             h=(pocket_bot_z + 0.5) - (stub_bot_z - 1), $fn=32);
        }
    }

    // ---- ORIGINAL RIVET-NUT path (kept for reference) ----
    // counterbore_top_z = platform_top_z - fuse_mount_rivet_grip_t;
    // counterbore_clearance_depth = max(platform_thickness - fuse_mount_rivet_grip_t,
    //                                    fuse_mount_rivet_length - fuse_mount_rivet_grip_t);
    // counterbore_bot_z = counterbore_top_z - counterbore_clearance_depth;
    // for (hx = [hole_x_near, hole_x_far]) {
    //     for (hy = [fuse1_y_center, fuse2_y_center]) {
    //         translate([hx, hy, platform_bot_z - 1])
    //             cylinder(d=fuse_mount_hole_dia, h=platform_thickness + 2, $fn=32);
    //         translate([hx, hy, counterbore_bot_z - 1])
    //             cylinder(d=fuse_mount_counterbore_dia, h=counterbore_clearance_depth + 2, $fn=48);
    //     }
    // }
}

module fuse_platform_insert_stubs() {
    // Downward 16mm boss stubs under each mount hole, used only if the slab is too
    // thin to fully house the insert. AUTO-DISABLES (stub_height -> 0) at the
    // current 11.3mm slab. Sit directly under the hex-cut bosses (which already
    // exclude the boss footprint) and clear of the gusset X-bands.
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    platform_bot_z = platform_top_z - platform_thickness;
    insert_pocket_depth = insert_length + insert_seat_clearance;
    stub_height = max(0, insert_pocket_depth + insert_pocket_floor - platform_thickness);

    platform_x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    fuse_x_start = platform_x_origin + platform_x_edge_margin;
    fuse_inset_from_end = (fuse_holder_length - fuse_mount_hole_spacing) / 2;
    hole_x_near = fuse_x_start + fuse_inset_from_end;
    hole_x_far  = hole_x_near + fuse_mount_hole_spacing;
    platform_y_edge_margin = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
    fuse1_y_start = outer_w + platform_y_edge_margin;
    fuse2_y_start = fuse1_y_start + fuse_holder_width + fuse_gap;
    fuse1_y_center = fuse1_y_start + fuse_holder_width / 2;
    fuse2_y_center = fuse2_y_start + fuse_holder_width / 2;

    if (stub_height > 0)
        for (hx = [hole_x_near, hole_x_far])
            for (hy = [fuse1_y_center, fuse2_y_center])
                translate([hx, hy, platform_bot_z - stub_height])
                    cylinder(d=insert_stub_dia, h=stub_height + 0.01, $fn=48);
}

// =============================================================================
// FUSE WALL (vertical mount) — NEW
// =============================================================================
module fuse_wall() {
    // Vertical mounting plate at the back-left (Y_MAX) corner.
    //   X: platform_x_origin .. platform_x_origin + platform_x_width
    //   Y: inner face flush with the cavity back wall (outer_w - wall_thickness),
    //      extending OUTWARD by fuse_wall_thickness so the rear mount face sits
    //      just rearward of the tray (no battery intrusion).
    //   Z: rises from the top of the back lip (floor + wall_h) up to fuse_wall_top_z.
    // The left end overlaps the X_MIN heat shield (X 0..heat_shield_thickness),
    // so a plain union bonds them — that bond is the lateral brace.
    wall_z_base = floor_thickness + wall_h;       // sits on the back lip
    wall_height = fuse_wall_top_z - wall_z_base;   // rises up toward the terminal
    y_inner     = outer_w - wall_thickness;
    r = fuse_wall_round_r;
    if (r > 0) {
        // Round ALL FOUR long vertical edges (hull of corner cylinders — keeps the
        // side/cavity/rear FACES flat, so the heat-shield bond and battery-box face
        // stay flat) intersected with a top/rear roundover (inset-core minkowski) so
        // the top edge is softened too. Base + cavity faces stay flat for bonding.
        intersection() {
            hull() {
                for (cx = [platform_x_origin + r, platform_x_origin + platform_x_width - r])
                    for (cy = [y_inner + r, y_inner + fuse_wall_thickness - r])
                        translate([cx, cy, wall_z_base])
                            cylinder(r = r, h = wall_height, $fn = 24);
            }
            intersection() {
                translate([platform_x_origin, y_inner, wall_z_base])
                    cube([platform_x_width, fuse_wall_thickness, wall_height]);
                minkowski() {
                    translate([platform_x_origin + r, y_inner, wall_z_base])
                        cube([platform_x_width - 2*r,
                              fuse_wall_thickness - r,
                              wall_height - r]);
                    sphere(r = r, $fn = 24);
                }
            }
        }
    } else {
        translate([platform_x_origin, y_inner, wall_z_base])
            cube([platform_x_width, fuse_wall_thickness, wall_height]);
    }
}

module hs_nut_access_windows() {
    // Chamfered lead-in on the heat shield's INNER face beside each near nut pocket.
    // Profile in (X, Y): rides the inner face until y0, ramps back to xd by the pocket
    // mouth, then holds full depth out to the shield's Y end. Max X is clamped to the
    // inner face so the nut pocket wall (flats at X 5.61) is never breached.
    y_face = outer_w - wall_thickness;              // pocket mouth / cavity face
    y0     = y_face - hs_nut_chamfer_len;           // ramp starts here at zero depth
    xi     = heat_shield_thickness;                 // inner face
    xd     = xi - hs_nut_relief_depth;              // deepest point
    fuse2_z = fuse_wall_top_z - fuse_top_inset - fuse_holder_width/2;
    fuse1_z = fuse2_z - fuse_holder_width - fuse_gap;
    for (zc = [fuse1_z, fuse2_z])
        translate([0, 0, zc - hs_nut_win_z_height/2])
            linear_extrude(hs_nut_win_z_height)
                polygon([[xi, y0], [xi, outer_w], [xd, outer_w], [xd, y_face]]);
}

module fuse_wall_bolt_holes() {
    // M5 through-bolt: clearance hole through the wall, plus a hex nut pocket opening
    // on the CAVITY face so the nut finishes flush and never touches the battery.
    y_inner = outer_w - wall_thickness;
    y_mount = y_inner + fuse_wall_thickness;
    for (fp = fuse_fastener_positions()) {
        translate([fp[0], y_mount + 1, fp[1]])
            rotate([90, 0, 0])
                cylinder(d = bolt_clear_dia, h = fuse_wall_thickness + 2, $fn = 32);
        // Hex pocket, cut in from the cavity face. rotate([0,0,30]) puts a vertex at +Z
        // once rotate([90,0,0]) maps local +Y to world +Z, so the roof self-supports.
        translate([fp[0], y_inner + nut_pocket_depth, fp[1]])
            rotate([90, 0, 0])
                rotate([0, 0, 30])
                    cylinder(d = nut_pocket_af / cos(30), h = nut_pocket_depth + 1, $fn = 6);
    }
}

module fuse_wall_insert_holes() {
    // Heat-set insert bores into the REAR face (legacy alternative to BOLT mode).
    y_mount = outer_w - wall_thickness + fuse_wall_thickness;
    insert_pocket_depth = insert_length + insert_seat_clearance;
    for (fp = fuse_fastener_positions())
        translate([fp[0], y_mount + 1, fp[1]])
            rotate([90, 0, 0])
                cylinder(d=insert_pilot_dia, h=insert_pocket_depth + 1, $fn=48);
}

// ---- shared lightening helpers (used by both truss and hex) ----
module fuse_wall_bay_2d(z_base = undef) {
    // 2D bay in (X, Z): wall inset by the perimeter rim, MINUS the 16mm boss pads
    // and the heat-shield gusset footprint — the region the lightening may cut.
    // z_base overrides the bottom of the bay (default = wall base); pass a lower
    // value to run the lattice down through the foot toward the tray bottom edge.
    real_z_base = floor_thickness + wall_h;
    wall_z_base = is_undef(z_base) ? real_z_base : z_base;
    wall_height = fuse_wall_top_z - wall_z_base;
    x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    x_start       = platform_x_origin + x_edge_margin;
    x_inset       = (fuse_holder_length - fuse_mount_hole_spacing) / 2;
    hole_x_near   = x_start + x_inset;
    hole_x_far    = hole_x_near + fuse_mount_hole_spacing;
    fuse2_z = fuse_wall_top_z - fuse_top_inset - fuse_holder_width/2;
    fuse1_z = fuse2_z - fuse_holder_width - fuse_gap;
    g_on = include_heat_shield && include_heat_shield_gussets;
    difference() {
        offset(r = -fph_perimeter_rim)
            translate([platform_x_origin, wall_z_base])
                square([platform_x_width, wall_height]);
        for (fp = fuse_fastener_positions())
            translate(fp) circle(d = fph_boss_dia + 2*fph_boss_inset, $fn = 32);
        if (g_on)
            offset(r = fph_gusset_inset)
                translate([heat_shield_thickness, real_z_base])
                    gusset_2d_shape(gusset_base, gusset_height);
        // Solid join column at the heat-shield end
        if (fph_bond_band > 0)
            translate([platform_x_origin - 1, wall_z_base - 1])
                square([fph_bond_band + 1, wall_height + 2]);
        // Solid column at the free end
        if (fph_end_band > 0)
            translate([platform_x_origin + platform_x_width - fph_end_band, wall_z_base - 1])
                square([fph_end_band + 1, wall_height + 2]);
    }
}

module fuse_wall_cut_extrude() {
    // Extrude a 2D (X, Z) cut pattern through the full wall thickness (+margins).
    // rotate([90,0,0]) maps local +Y -> world +Z, local +Z(extrude) -> world -Y.
    y_mount = outer_w - wall_thickness + fuse_wall_thickness;
    translate([0, y_mount + 1, 0])
        rotate([90, 0, 0])
            linear_extrude(fuse_wall_thickness + 2)
                children();
}

module fuse_wall_lightening_clip() {
    // The only region the lattice is allowed to remove: the wall (full thickness,
    // above the lip) PLUS the outboard buttress foot (below the lip). Keeps the
    // floor and the tray's back lip solid when the lattice tiles down to the bottom.
    y_inner     = outer_w - wall_thickness;
    y_mount     = y_inner + fuse_wall_thickness;
    wall_z_base = floor_thickness + wall_h;
    union() {
        translate([platform_x_origin - 1, y_inner - 1, wall_z_base])
            cube([platform_x_width + 2, fuse_wall_thickness + 2, fuse_wall_top_z - wall_z_base + 2]);
        translate([platform_x_origin - 1, outer_w, -1])
            cube([platform_x_width + 2, y_mount - outer_w + 1, wall_z_base + 1]);
    }
}

module fuse_pattern_2d(zb, h) {
    if      (fuse_wall_lightening_style == "DIAMOND")  _pat_diamond(zb, h);
    else if (fuse_wall_lightening_style == "HEXPOINTY")_pat_hexpointy(zb, h);
    else if (fuse_wall_lightening_style == "TRIROUND") _pat_triround(zb, h);
    else if (fuse_wall_lightening_style == "HEX")      _pat_hex(zb, h);
    else                                               _pat_truss(zb, h);
}

module fuse_wall_lattice_cut_2d() {
    // 2D (X,Z) lattice cut = cells (bay ∩ pattern), with ribs THICKENED near the
    // bottom so the openwork bridges load into the base. Thickening = grow the ribs
    // (bay − cells) inside a bottom band and subtract that growth from the cells, so
    // cells shrink (ribs fatten) toward the base. Graded over nb bands for a taper.
    zb = fuse_wall_lightening_z_base;
    h  = fuse_wall_top_z - zb;
    nb = 3;
    difference() {
        // offset(-k) offset(+k) drops sliver cells; survivors regrow to size.
        offset(r = fph_min_cell) offset(r = -fph_min_cell)
            intersection() { fuse_wall_bay_2d(zb); fuse_pattern_2d(zb, h); }
        if (fuse_wall_bottom_rib_boost > 0)
            for (i = [0 : nb - 1]) {
                boost_i = fuse_wall_bottom_rib_boost * (nb - i) / nb;
                top_i   = zb + fuse_wall_bottom_bridge_h * (i + 1) / nb;
                intersection() {
                    offset(r = boost_i)
                        difference() {
                            fuse_wall_bay_2d(zb);
                            intersection() { fuse_wall_bay_2d(zb); fuse_pattern_2d(zb, h); }
                        }
                    translate([platform_x_origin - 5, zb - 1])
                        square([platform_x_width + 10, top_i - (zb - 1)]);
                }
            }
    }
}

module fuse_wall_lightening_cuts() {
    // Chosen lightening pattern as cells, ribs graded thicker near the bottom edge
    // (fuse_wall_lattice_cut_2d), clipped to wall+buttress (skips floor/lip) and
    // extruded through the wall thickness.
    intersection() {
      fuse_wall_lightening_clip();
      if (fuse_wall_lattice_round > 0)
        minkowski() {
          fuse_wall_cut_extrude()
            fuse_wall_lattice_cut_2d();
          sphere(r = fuse_wall_lattice_round, $fn = 12);
        }
      else
        fuse_wall_cut_extrude()
          fuse_wall_lattice_cut_2d();
    }
}

module fuse_wall_foot_buttress() {
    // Solid foot filling the FULL wall footprint (cavity face y_inner -> outboard
    // mount face y_mount) from the wall base (z = wall_z_base) down to the tray
    // bottom (z=0). This seats the wall's whole base on the floor — closing the
    // cavity-side void the wall otherwise had — and carries the outboard part down
    // to the bottom-rear edge. fuse_wall_foot_chamfer() then tapers the outboard
    // side; the cavity side stays full as the wall's base.
    if (fuse_wall_foot_chamfer_h > 0 && fuse_wall_thickness > wall_thickness) {
        y_inner     = outer_w - wall_thickness;           // cavity face (sits on floor)
        y_mount     = y_inner + fuse_wall_thickness;      // outboard (mount) face
        wall_z_base = floor_thickness + wall_h;           // wall starts here; foot fills below
        r = fuse_wall_round_r;
        if (r > 0) {
            // Round the foot's 4 long vertical edges (hull of corner cylinders) to
            // match the wall above; faces + top (bonds to wall) + bottom (floor) flat.
            hull() {
                for (cx = [platform_x_origin + r, platform_x_origin + platform_x_width - r])
                    for (cy = [y_inner + r, y_mount - r])
                        translate([cx, cy, 0])
                            cylinder(r = r, h = wall_z_base, $fn = 24);
            }
        } else {
            translate([platform_x_origin, y_inner, 0])
                cube([platform_x_width, y_mount - y_inner, wall_z_base]);
        }
    }
}

module fuse_wall_foot_chamfer() {
    // Shape the bottom-outboard of the wall + buttress as a smooth S-curve (ogee):
    // the rear face eases OUT of the full mount face (y_mount) at z_top and eases
    // back IN to the tray's outside wall (outer_w) at the bottom, vertical-tangent at
    // both ends. No corner, no cantilever, self-supporting. Subtracts the region
    // outboard of the S-curve, running the wall's full X length.
    if (fuse_wall_foot_chamfer_h > 0 && fuse_wall_thickness > wall_thickness) {
        y_inner     = outer_w - wall_thickness;
        y_mount     = y_inner + fuse_wall_thickness;     // full rear (mount) face
        y_edge      = outer_w;                            // tray outside wall (blend target)
        wall_z_base = floor_thickness + wall_h;
        z_top       = wall_z_base + fuse_wall_foot_chamfer_h;  // full thickness reached here
        xw = platform_x_width + 2;
        x_end = platform_x_origin + platform_x_width + 1;
        steps = 48;
        // cosine ogee: Y(0)=outer_w, Y(z_top)=y_mount, dY/dz=0 at both ends
        scurve = [ for (i = [0 : steps]) let(z = z_top * i / steps)
                     [ z, y_edge + (y_mount - y_edge) * (1 - cos(180 * z / z_top)) / 2 ] ];
        // rotate([0,-90,0]) maps polygon (a,b) -> world (Z=a, Y=b) and extrudes along -X.
        translate([x_end, 0, 0])
            rotate([0, -90, 0])
                linear_extrude(xw)
                    polygon(concat([[-1, y_edge]], scurve,
                                   [[z_top, y_mount + 1], [-1, y_mount + 1]]));
    }
}

module fuse_wall_inner_relief() {
    // Weight cut from the INNER (battery-cavity) side: hollow the lightening bay down
    // to fuse_wall_web_thickness, leaving that web FLUSH WITH THE REAR (mount) face.
    // This keeps the lattice ribs, perimeter rim, and boss pads all coplanar at the
    // outer edge so the fuse holders bear on a continuous flat surface; material is
    // removed from the cavity side instead. Reuses fuse_wall_bay_2d (already excludes
    // rim/bosses/gusset). Each insert keeps its full-depth boss (10.3 bore + 1mm floor).
    if (fuse_wall_web_thickness < fuse_wall_thickness) {
        y_inner = outer_w - wall_thickness;
        y_mount = y_inner + fuse_wall_thickness;            // rear (mount) face — web stays flush here
        relief_depth = fuse_wall_thickness - fuse_wall_web_thickness + 1;  // +1 clears the inner face
        // Start at the web's inner boundary and cut inward (-Y) to past the inner face.
        // Relief starts at the lattice base (foot top), NOT the wall base, so it never
        // hollows the solid foot — otherwise the foot S-curve (outboard) and this relief
        // (cavity side) would meet in the middle and slice the lower wall to a sliver.
        translate([0, y_mount - fuse_wall_web_thickness, 0])
            rotate([90, 0, 0])
                linear_extrude(relief_depth)
                    fuse_wall_bay_2d(fuse_wall_lightening_z_base);
    }
}

module _pat_truss(zb, h) {
    // Warren truss — alternating up/down triangles (industrial, structural).
    nC = ceil(platform_x_width / fwt_tri_base) + 2;
    nR = ceil(h / fwt_tri_height) + 2;
    union()
        for (row = [0 : nR]) for (col = [-1 : nC]) {
            z0 = zb + row * fwt_tri_height; z1 = z0 + fwt_tri_height;
            x  = platform_x_origin + col * fwt_tri_base;
            offset(r = -fwt_webbing/2) polygon([[x, z0], [x + fwt_tri_base, z0], [x + fwt_tri_base/2, z1]]);
            offset(r = -fwt_webbing/2) polygon([[x + fwt_tri_base/2, z1], [x + 1.5*fwt_tri_base, z1], [x + fwt_tri_base, z0]]);
        }
}

module _pat_triround(zb, h) {
    // Same Warren truss but with softly rounded triangle corners (refined look).
    rr = 3;
    nC = ceil(platform_x_width / fwt_tri_base) + 2;
    nR = ceil(h / fwt_tri_height) + 2;
    union()
        for (row = [0 : nR]) for (col = [-1 : nC]) {
            z0 = zb + row * fwt_tri_height; z1 = z0 + fwt_tri_height;
            x  = platform_x_origin + col * fwt_tri_base;
            offset(r = rr, $fn = 24) offset(r = -(rr + fwt_webbing/2))
                polygon([[x, z0], [x + fwt_tri_base, z0], [x + fwt_tri_base/2, z1]]);
            offset(r = rr, $fn = 24) offset(r = -(rr + fwt_webbing/2))
                polygon([[x + fwt_tri_base/2, z1], [x + 1.5*fwt_tri_base, z1], [x + fwt_tri_base, z0]]);
        }
}

module _pat_diamond(zb, h) {
    // Argyle diamond lattice — rotated squares; top/bottom are apexes (self-support).
    R  = fwt_tri_base / 2;
    sx = 2*R + fwt_webbing;
    sz = R + fwt_webbing/2;          // rows half-stepped in Z for a continuous lattice
    nC = ceil(platform_x_width / sx) + 2;
    nR = ceil(h / sz) + 2;
    union()
        for (row = [0 : nR]) for (col = [-1 : nC]) {
            cx = platform_x_origin + col * sx + ((row % 2 == 0) ? 0 : sx/2);
            cz = zb + row * sz;
            translate([cx, cz]) offset(r = -fwt_webbing/2)
                polygon([[0, R], [R, 0], [0, -R], [-R, 0]]);
        }
}

module _pat_hexpointy(zb, h) {
    // POINTY-top honeycomb — vertex at top/bottom is an apex (prints far better than
    // flat-top hex on a vertical wall) while keeping the honeycomb aesthetic.
    F_eff = fph_hex_F + fph_hex_wall;
    s_eff = F_eff / sqrt(3);
    row_spacing_z = 1.5 * s_eff;
    col_spacing_x = F_eff;
    row_x_offset  = F_eff / 2;
    hex_d = 2 * fph_hex_F / sqrt(3);
    nC = ceil(platform_x_width / col_spacing_x) + 2;
    nR = ceil(h / row_spacing_z) + 2;
    union()
        for (row = [-1 : nR]) for (col = [-1 : nC]) {
            cz = zb + row * row_spacing_z;
            cx = platform_x_origin + col * col_spacing_x + ((row % 2 == 0) ? 0 : row_x_offset);
            translate([cx, cz]) rotate(30) circle(d = hex_d, $fn = 6);
        }
}

module _pat_hex(zb, h) {
    // Flat-top honeycomb (legacy look; has horizontal top spans — least print-friendly).
    F_eff = fph_hex_F + fph_hex_wall;
    s_eff = F_eff / sqrt(3);
    col_spacing_x = 1.5 * s_eff;
    row_spacing_z = F_eff;
    col_z_offset  = F_eff / 2;
    hex_d  = 2 * fph_hex_F / sqrt(3);
    nC = ceil(platform_x_width / col_spacing_x) + 2;
    nR = ceil(h / row_spacing_z) + 2;
    union()
        for (col = [0 : nC]) for (row = [-1 : nR]) {
            cx = platform_x_origin + col * col_spacing_x;
            cz = zb + row * row_spacing_z + ((col % 2 == 0) ? 0 : col_z_offset);
            translate([cx, cz]) circle(d = hex_d, $fn = 6);
        }
}

module support_ridges() {
    // Longitudinal ridges running along the battery's long axis (X direction).
    // Outermost ridges are inset inward so the battery sits stably on them (no teeter).
    if (ridge_count >= 2) {
        for (i = [0 : ridge_count - 1]) {
            y_pos = ridge_y_pos(i);
            translate([wall_thickness + ridge_x_margin, y_pos, floor_thickness])
                cube([inner_l - 2 * ridge_x_margin, ridge_width, ridge_height]);
        }
    }
}

module heat_shield_gussets() {
    // Two corner bridges INSIDE the tray cavity, between heat shield wall and long-side lip walls.
    // Sits ABOVE the lip wall in air — does NOT intrude into the battery's footprint.
    // Shape: CURVED (concave quarter-ellipse, distributes load smoothly) or STRAIGHT (right triangle).
    g_thick = gusset_thickness_match_wall ? wall_thickness : gusset_thickness_override;
    x_sign = (heat_shield_side == "X_MIN") ? 1 : -1;
    x_anchor = (heat_shield_side == "X_MIN") ? heat_shield_thickness : (outer_l - heat_shield_thickness);

    // Y_MIN corner gusset (occupies Y from 0 to wall_thickness, sits on top of Y_MIN lip wall)
    translate([x_anchor, wall_thickness, floor_thickness + wall_h])
        rotate([90, 0, 0])
            linear_extrude(wall_thickness)
                gusset_2d_shape(gusset_base * x_sign, gusset_height);

    // Y_MAX corner gusset
    translate([x_anchor, outer_w, floor_thickness + wall_h])
        rotate([90, 0, 0])
            linear_extrude(wall_thickness)
                gusset_2d_shape(gusset_base * x_sign, gusset_height);
}

module jhook_slots() {
    // Rectangular cut through each long-side lip wall + the floor below,
    // at the midpoint of the long axis. The TOP corners of the cut (where the slot
    // opens at the top of the lip wall) are filleted by jhook_slot_top_round_r.
    x_center     = outer_l * jhook_slot_x_position;
    z_lo         = -1;
    z_hi         = floor_thickness + wall_h + 1;
    wall_top     = floor_thickness + wall_h;
    slot_y_total = wall_thickness + jhook_slot_inward_depth;

    // Y_MIN side: extrude profile from Y = slot_y_total in -Y direction
    translate([x_center, slot_y_total, 0])
        rotate([90, 0, 0])
            linear_extrude(slot_y_total + 1)
                jhook_slot_profile_2d(jhook_slot_width, z_lo, z_hi,
                                      wall_top, jhook_slot_top_round_r);

    // Y_MAX side: extrude profile from Y = outer_w + 1 in -Y direction
    translate([x_center, outer_w + 1, 0])
        rotate([90, 0, 0])
            linear_extrude(slot_y_total + 1)
                jhook_slot_profile_2d(jhook_slot_width, z_lo, z_hi,
                                      wall_top, jhook_slot_top_round_r);
}

module jhook_slot_profile_2d(w, z_lo, z_hi, wall_top, r) {
    // 2D profile in (X, Z) for the slot cut. Main rectangle plus two fillet wedges
    // at the top corners — the wedges add cut area beyond the slot's nominal width
    // in the top r-band so the lip wall material gets a quarter-circle fillet at its
    // (otherwise sharp) corner where the wall's top face meets the slot's vertical face.
    union() {
        // Main slot rectangle (centered on X=0, spans z_lo..z_hi)
        translate([-w/2, z_lo]) square([w, z_hi - z_lo]);

        if (r > 0) {
            // LEFT fillet wedge: corner square minus the quarter-circle
            difference() {
                translate([-w/2 - r, wall_top - r]) square([r, r]);
                translate([-w/2 - r, wall_top - r]) circle(r = r, $fn = 32);
            }
            // RIGHT fillet wedge: corner square minus the quarter-circle
            difference() {
                translate([w/2, wall_top - r]) square([r, r]);
                translate([w/2 + r, wall_top - r]) circle(r = r, $fn = 32);
            }
        }
    }
}

module rounded_rect_2d(w, h, r) {
    // 2D rounded rectangle, anchored at (0,0), extending to (w, h).
    // Uses offset() shrink-then-grow trick — produces clean arcs at corners.
    offset(r=r, $fn=64)
        offset(r=-r, $fn=64)
            square([w, h]);
}

module gusset_2d_shape(base, height) {
    // 2D shape in XY plane: anchored at origin, extending to (base, 0) along X and (0, height) along Y.
    // Shape depends on gusset_shape parameter.
    if (gusset_shape == "STRAIGHT") {
        // Right triangle
        polygon([[0,0], [base, 0], [0, height]]);
    } else {
        // CURVED: rectangle minus a quarter-ellipse from the (base, height) corner
        // This produces a concave hypotenuse that bulges INWARD toward the (base, height) corner,
        // leaving the gusset shape concentrated near (0,0) and tapering smoothly to the wall and floor edges.
        difference() {
            polygon([[0,0], [base, 0], [base, height], [0, height]]);
            translate([base, height])
                scale([abs(base), height])
                    circle(r=1, $fn=gusset_curve_segments);
        }
    }
}

module corner_prune_cut(R, y_side) {
    // Corner wedge (square minus quarter-cylinder) subtracted at an X_MAX
    // vertical edge (y_side = "Y_MIN" or "Y_MAX"), leaving an R roundover.
    // Replaces the 3mm cosmetic fillet at that corner only. Full height so
    // floor + lip both clear.
    cy = (y_side == "Y_MAX") ? outer_w - R : R;   // arc center Y
    y0 = (y_side == "Y_MAX") ? outer_w - R : -2;  // wedge cube Y start
    translate([outer_l - R, cy, 0])
        difference() {
            translate([0, y0 - cy, -1])
                cube([R + 2, R + 2, total_h + 2]);
            translate([0, 0, -2])
                cylinder(r = R, h = total_h + 4, $fn = 96);
        }
}

module rounded_box(l, w, h, r) {
    // Outer box with vertical edges rounded (radius r)
    hull() {
        for (x = [r, l-r]) {
            for (y = [r, w-r]) {
                translate([x, y, 0])
                    cylinder(r=r, h=h, $fn=32);
            }
        }
    }
}

module back_support_wall_lightening() {
    // Cuts Warren-truss triangles through the back support wall.
    // 2D shapes are defined in (X, Z) then rotated about X so extrusion runs -Y
    // through the wall thickness.
    wall_start_z   = floor_thickness + wall_h;
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    platform_bot_z = platform_top_z - platform_thickness;
    gusset_bot_z   = platform_bot_z - fp_gusset_z_height;

    // Lower zone (no gussets behind): 3-triangle Warren truss spanning full inner width
    lz_x0 = platform_x_origin + bwl_edge_band;
    lz_x1 = platform_x_origin + platform_x_width - bwl_edge_band;
    lz_z0 = wall_start_z + bwl_bot_band;
    lz_z1 = gusset_bot_z - bwl_chord_band;
    lz_w  = lz_x1 - lz_x0;
    base  = lz_w / 2;

    // Upper zone (between gusset X-columns): one down-pointing triangle per bay
    uz_z0 = gusset_bot_z + bwl_chord_band;
    uz_z1 = platform_bot_z - bwl_top_band;
    left_bay_x0  = platform_x_origin + bwl_edge_band;
    left_bay_x1  = platform_x_origin + platform_x_width/2 - bwl_mid_band_half;
    right_bay_x0 = platform_x_origin + platform_x_width/2 + bwl_mid_band_half;
    right_bay_x1 = platform_x_origin + platform_x_width - bwl_edge_band;

    // Extrude shapes through wall: -Y from outer_w+0.1 to outer_w - back_support_wall_thickness - 0.1
    translate([0, outer_w + 0.1, 0])
        rotate([90, 0, 0])
            linear_extrude(back_support_wall_thickness + 0.2) {

                // ---- LOWER ZONE: 3 alternating Warren-truss triangles ----
                // Triangle 1 (down): top-left, top-mid, bottom-quarter
                offset(r = -bwl_webbing / 2)
                    polygon([[lz_x0,            lz_z1],
                             [lz_x0 + base,     lz_z1],
                             [lz_x0 + base/2,   lz_z0]]);
                // Triangle 2 (up): bottom-quarter, top-mid, bottom-three-quarter
                offset(r = -bwl_webbing / 2)
                    polygon([[lz_x0 + base/2,   lz_z0],
                             [lz_x0 + base,     lz_z1],
                             [lz_x0 + 1.5*base, lz_z0]]);
                // Triangle 3 (down): top-mid, top-right, bottom-three-quarter
                offset(r = -bwl_webbing / 2)
                    polygon([[lz_x0 + base,     lz_z1],
                             [lz_x0 + 2*base,   lz_z1],
                             [lz_x0 + 1.5*base, lz_z0]]);

                // ---- UPPER ZONE: 1 down-pointing triangle per bay ----
                // Left bay: top-left, top-right, bottom-mid
                offset(r = -bwl_webbing / 2)
                    polygon([[left_bay_x0,                  uz_z1],
                             [left_bay_x1,                  uz_z1],
                             [(left_bay_x0+left_bay_x1)/2,  uz_z0]]);
                // Right bay: top-left, top-right, bottom-mid
                offset(r = -bwl_webbing / 2)
                    polygon([[right_bay_x0,                  uz_z1],
                             [right_bay_x1,                  uz_z1],
                             [(right_bay_x0+right_bay_x1)/2, uz_z0]]);
            }
}

module fuse_platform_hex_cuts() {
    // Through-cut a honeycomb pattern in the platform's rearward extension.
    // Cut shape = (bay area inset by fph_bay_inset) INTERSECT (hex grid).
    // Extruded through full platform thickness (+1mm margin) so cuts go top-to-bottom.
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    platform_bot_z = platform_top_z - platform_thickness;

    // Rivet positions (replicate fuse_platform_holes logic)
    platform_x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    fuse_x_start = platform_x_origin + platform_x_edge_margin;
    fuse_inset_from_end = (fuse_holder_length - fuse_mount_hole_spacing) / 2;
    hole_x_near = fuse_x_start + fuse_inset_from_end;
    hole_x_far  = hole_x_near + fuse_mount_hole_spacing;
    platform_y_edge_margin = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
    fuse1_y_start = outer_w + platform_y_edge_margin;
    fuse2_y_start = fuse1_y_start + fuse_holder_width + fuse_gap;
    fuse1_y_center = fuse1_y_start + fuse_holder_width / 2;
    fuse2_y_center = fuse2_y_start + fuse_holder_width / 2;
    rib_mid_y = (fuse1_y_center + fuse2_y_center) / 2;

    // Column X positions (gusset-aligned)
    col_mid_x   = platform_x_origin + platform_x_width/2 - fp_gusset_thickness/2;
    col_right_x = platform_x_origin + platform_x_width - fp_gusset_thickness;

    // Hex tiling math: hexes spaced as if size F_eff = F + wall, drawn at size F
    F_eff = fph_hex_F + fph_hex_wall;
    s_eff = F_eff / sqrt(3);
    col_spacing_x = 1.5 * s_eff;          // X spacing between hex columns
    row_spacing_y = F_eff;                // Y spacing within a column (shared flat edges)
    col_y_offset  = F_eff / 2;            // Y phase shift between odd/even columns
    hex_d         = 2 * fph_hex_F / sqrt(3);  // vertex-to-vertex diameter of drawn hex

    n_cols = ceil(platform_x_width / col_spacing_x) + 2;
    n_rows = ceil(platform_y_depth / row_spacing_y) + 2;

    translate([0, 0, platform_bot_z - 1])
        linear_extrude(platform_thickness + 2)
            intersection() {
                // BAY AREA (inset for visual margin around keepers)
                offset(r = -fph_bay_inset)
                    difference() {
                        // Full rearward footprint (Y > outer_w; front 5mm is wall transition)
                        translate([platform_x_origin, outer_w])
                            square([platform_x_width, platform_y_depth]);
                        // KEEP: left column (gusset)
                        translate([platform_x_origin, outer_w])
                            square([fp_gusset_thickness, platform_y_depth]);
                        // KEEP: middle column (gusset)
                        translate([col_mid_x, outer_w])
                            square([fp_gusset_thickness, platform_y_depth]);
                        // KEEP: right column (gusset)
                        translate([col_right_x, outer_w])
                            square([fp_gusset_thickness, platform_y_depth]);
                        // KEEP: front rim
                        translate([platform_x_origin, outer_w])
                            square([platform_x_width, fph_perimeter_rim]);
                        // KEEP: mid horizontal rib (in fuse gap)
                        translate([platform_x_origin, rib_mid_y - fph_mid_rib/2])
                            square([platform_x_width, fph_mid_rib]);
                        // KEEP: rear rim
                        translate([platform_x_origin, outer_w + platform_y_depth - fph_perimeter_rim])
                            square([platform_x_width, fph_perimeter_rim]);
                        // KEEP: 4 rivet bosses
                        translate([hole_x_near, fuse1_y_center]) circle(d = fph_boss_dia, $fn = 32);
                        translate([hole_x_far,  fuse1_y_center]) circle(d = fph_boss_dia, $fn = 32);
                        translate([hole_x_near, fuse2_y_center]) circle(d = fph_boss_dia, $fn = 32);
                        translate([hole_x_far,  fuse2_y_center]) circle(d = fph_boss_dia, $fn = 32);
                    }

                // HEX GRID — flat-top hexes, offset columns
                // CENTER-ONLY FILTER: only emit hexes whose center is inside the inset
                // bay area (drops sliver hexes from centers that sit in keeper territory).
                // The outer intersection() still clips any partial overflow at bay edges.
                let(
                    fi        = fph_bay_inset,
                    boss_r    = fph_boss_dia / 2,
                    bcd2      = (fph_boss_dia/2 + fph_bay_inset) * (fph_boss_dia/2 + fph_bay_inset),
                    front_y   = outer_w + fph_perimeter_rim + fph_bay_inset,
                    mid_y_bot = rib_mid_y - fph_mid_rib/2 - fph_bay_inset,
                    mid_y_top = rib_mid_y + fph_mid_rib/2 + fph_bay_inset,
                    rear_y    = outer_w + platform_y_depth - fph_perimeter_rim - fph_bay_inset,
                    left_x    = platform_x_origin + fp_gusset_thickness + fph_bay_inset,
                    mid_x_lo  = col_mid_x - fph_bay_inset,
                    mid_x_hi  = col_mid_x + fp_gusset_thickness + fph_bay_inset,
                    right_x   = col_right_x - fph_bay_inset
                ) {
                    for (col = [0 : n_cols]) {
                        for (row = [-1 : n_rows]) {
                            cx = platform_x_origin + col * col_spacing_x;
                            cy = outer_w + row * row_spacing_y
                                 + ((col % 2 == 0) ? 0 : col_y_offset);
                            in_bay_x = (cx > left_x   && cx < mid_x_lo)
                                    || (cx > mid_x_hi && cx < right_x);
                            in_bay_y = (cy > front_y  && cy < mid_y_bot)
                                    || (cy > mid_y_top && cy < rear_y);
                            d1sq = (cx - hole_x_near)*(cx - hole_x_near) + (cy - fuse1_y_center)*(cy - fuse1_y_center);
                            d2sq = (cx - hole_x_far) *(cx - hole_x_far)  + (cy - fuse1_y_center)*(cy - fuse1_y_center);
                            d3sq = (cx - hole_x_near)*(cx - hole_x_near) + (cy - fuse2_y_center)*(cy - fuse2_y_center);
                            d4sq = (cx - hole_x_far) *(cx - hole_x_far)  + (cy - fuse2_y_center)*(cy - fuse2_y_center);
                            boss_clear = d1sq > bcd2 && d2sq > bcd2 && d3sq > bcd2 && d4sq > bcd2;
                            if (in_bay_x && in_bay_y && boss_clear) {
                                translate([cx, cy])
                                    circle(d = hex_d, $fn = 6);
                            }
                        }
                    }
                }
            }
}

module back_support_wall_right_fillet() {
    // Round the wall's front-right vertical edge — the one closest to the tray's
    // center, where the wall terminates partway across the back lip. Cuts a corner
    // wedge (cube minus quarter-cylinder) so the wall's vertical edge matches the
    // platform's front-right vertical edge (already rounded by the minkowski).
    // Radius is shared with fp_top_round_radius for visual continuity.
    r = fp_top_round_radius;
    wall_start_z   = floor_thickness + wall_h;
    platform_top_z = floor_thickness + heat_shield_height_mm + platform_top_z_offset;
    y_front  = outer_w - back_support_wall_thickness;
    corner_x = platform_x_origin + platform_x_width;
    h_cut    = platform_top_z - wall_start_z + 1;  // extends slightly past platform top (safe — platform is already rounded there)

    translate([corner_x - r, y_front, wall_start_z])
        difference() {
            cube([r, r, h_cut]);
            translate([0, r, -1])
                cylinder(r = r, h = h_cut + 2, $fn = 32);
        }
}

// =============================================================================
// NOTES PRINTED TO CONSOLE WHEN OPENED
// =============================================================================
echo("============================================");
echo(str("Tray outer:  ", outer_l, " x ", outer_w, " x ", total_h, " mm"));
echo(str("Tray outer:  ", outer_l/25.4, " x ", outer_w/25.4, " x ", total_h/25.4, " inches"));
echo(str("Inner cavity: ", inner_l, " x ", inner_w, " mm (battery fit w/ ", clearance, "mm clearance per side)"));
echo(str("Wall height:  ", wall_h, " mm (", wall_h/25.4, " inches; ", wall_h/batt_height*100, "% of battery height)"));
echo(str("Floor thick:  ", floor_thickness, " mm"));
echo(str("Wall thick:   ", wall_thickness, " mm"));
echo("============================================");
echo("PRINT IN ASA. Min 4 walls, 30% infill recommended.");
echo("MEASURE OEM MOUNTING POINTS AND ADJUST TAB POSITIONS BEFORE PRINTING.");
echo("============================================");
