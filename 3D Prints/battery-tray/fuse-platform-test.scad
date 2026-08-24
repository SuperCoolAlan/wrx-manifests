// =============================================================================
// Fuse Platform — Standalone Test Print
// =============================================================================
// Extracted from battery-tray-mtx35.scad to validate, before committing to a
// full tray print:
//   - platform slab thickness
//   - hex (honeycomb) weight-reduction pattern
//   - the 4 M5 mounting holes (2 per fuse holder): either press-fit rivet nuts
//     OR heat-set threaded inserts (toggle use_threaded_inserts below). The rivet
//     nuts cracked the boss on install; heat-set inserts melt in with no radial
//     press force, so they shouldn't split the plastic.
//
// The platform is rebased to the origin and laid FLAT (bottom face on Z=0) so it
// slices/prints directly. The tray body, heat shield, back support wall, and
// gussets are intentionally dropped — this is just the platform slab. The slab is
// thickened to 11.3mm here so the full 10mm heat-set inserts are housed inside a
// flat slab (no protruding stubs) — see platform_thickness below.
//
// Coordinate mapping from the parent file:
//   parent outer_w  -> Y = 0      (front of the rearward fuse footprint)
//   parent platform_bot_z -> Z = 0
//   parent platform_top_z -> Z = platform_thickness
// The parent's 5mm wall-join strip is retained at the front (Y < 0 before the
// final translate) so the slab is a faithful slice of the real part.
//
// PRINT MATERIAL: ASA recommended (engine bay heat), same as the tray.
// =============================================================================

// ---- PLATFORM ----
platform_x_width            = 108;  // X dimension of platform (mm)
platform_y_depth            = 82;   // Y dimension of the rearward fuse footprint (mm)
platform_thickness          = 11.3; // slab thickness (mm) — thickened from the original 8mm so the whole 10mm insert is housed inside a FLAT slab (= insert pocket 10.3 + 1mm below the tip). No protruding boss stubs -> prints flat. (Real tray keeps 8mm + local bosses; this is a test-print convenience.)
back_support_wall_thickness = 5;    // front wall-join strip retained from parent (mm)
platform_x_origin           = 0;    // X start position of platform

// ---- FUSE HOLDER DIMENSIONS (Blue Sea 5001-style MEGA) ----
fuse_holder_length          = 103.38; // long axis (along X — parallel to battery)
fuse_holder_width           = 38.10;  // short axis (along Y — stacked direction)
fuse_mount_hole_spacing     = 88.58;  // distance between the 2 mount-hole centers along X
fuse_gap                    = 2;      // gap between the two fuse holders along Y (mm)

// ---- ORIGINAL M5 RIVET NUT HOLES (replaced by heat-set inserts — kept for reference) ----
// fuse_mount_hole_dia         = 7.3;    // M5 rivet nut press-fit hole (6.91-8.51mm spec range)
// fuse_mount_rivet_grip_t     = 2.5;    // material thickness AT each rivet location (mm) — grip ledge the rivet bites into; set to rivet-nut spec max (2.5) to match the production tray
// fuse_mount_rivet_length     = 12.0;   // full rivet length from top of platform (mm)
// fuse_mount_counterbore_dia  = 11.0;   // counterbore diameter from underside (mm)

// ---- M5 THERMAL HEAT-SET INSERTS (active) ----
// On-hand inserts: M5, tapered brass, OD 7.0mm (wide knurled/grip end) -> 6.1mm
// (thin lead end), available in 10mm and 12mm lengths. The 10mm is the better
// match for this 8mm slab (12mm would need a 4mm boss stub and crowds the gussets
// on the real tray). Heat-set melts in — pilot just under the thin OD so the
// knurls bite, plus a shallow lead-in counterbore to seat the wide end square.
insert_length               = 10.0;   // chosen insert length (mm) — M5x10 (M5x12 also on hand)
insert_pilot_dia            = 6.2;    // pilot/melt hole dia (mm) — bumped from 6.1; the 6.1 test bore printed too tight in ASA for the insert to seat, so opened 0.1mm
insert_leadin_dia           = insert_pilot_dia;  // = pilot (6.1) -> NO wider mouth; the bore is a uniform 6.1mm column from the top. The tapered insert's 7mm wide end just melts into the straight 6.1 hole.
insert_leadin_depth         = 1.5;    // lead-in depth from the TOP face (mm) — moot while leadin_dia == pilot (kept so a flared mouth can be reintroduced by bumping leadin_dia)
insert_seat_clearance       = 0.3;    // extra pocket depth beyond insert length (mm) — so the insert seats fully flush at the top
insert_pocket_floor         = 1.0;    // solid floor left below the insert as a positive depth-stop (mm)
insert_stub_dia             = 16.0;   // downward stub OD (mm) — matches the 16mm rivet boss (fph_boss_dia) for a clean cylindrical extension
insert_drain                = true;   // cut a small center drain through the pocket floor so water/condensation can't pool in the hole (engine-bay duty)
insert_drain_dia            = 3.0;    // drain hole dia (mm) — smaller than the 6.1 pilot leaves an annular floor LEDGE as a depth-stop; set >= insert_pilot_dia to remove the floor entirely (fully open / through pocket)
// FLAT-SLAB CAPTURE: instead of stubs hanging below an 8mm slab, the whole platform
// is thickened to 11.3mm (= 10.3 pocket + 1mm floor) so the full 10mm insert is
// housed inside a flat slab that prints flat. The bore is a uniform 6.1mm column
// from the top face down 10.3mm; a 3mm center DRAIN then punches through the 1mm
// floor so condensation drains out the underside (floor survives as a ~1.55mm ring
// that doubles as a positive depth-stop). Stub logic auto-disables at this
// thickness: insert_length + seat_clearance + pocket_floor - platform_thickness
//   =  10 + 0.3 + 1.0 - 11.3  =  0  -> no stubs.

// ---- TOP-EDGE ROUNDING ----
include_fp_top_round        = true;
fp_top_round_radius         = 3.5;    // radius of rounded top edges of the platform (mm)

// ---- HEX THROUGH-CUTS (weight reduction) ----
include_fuse_platform_hex_cuts = true;
fph_hex_F           = 10.0;  // mm — hex flat-to-flat dimension
fph_hex_wall        = 3.0;   // mm — wall thickness between adjacent hexes
fph_perimeter_rim   = 4.0;   // mm — front/rear horizontal rim thickness
fph_mid_rib         = 4.0;   // mm — mid horizontal rib (in the fuse gap)
fph_boss_dia        = 16.0;  // mm — solid boss diameter around each rivet
fph_bay_inset       = 1.5;   // mm — visual margin: bay area shrunk before clipping the hex grid

// Column thickness for the 3 solid vertical "keeper" columns (gusset-aligned in
// the parent). Only used by the hex module to size those columns.
fp_gusset_thickness = 5;

// ---- TEST CROP ----
// Print only part of the platform to validate insert fit/grip without committing
// filament to the full slab.
//   "FULL"   = whole platform (both fuse rows, 4 holes)
//   "CORNER" = ONE corner, ONE hole — a real platform chunk (hex + rounded edge)
//   "FUSE1"  = near half (1 fuse row, 2 holes)
//   "FUSE2"  = far half  (1 fuse row, 2 holes)
//   "BOSS"   = a single ~30mm square coupon around ONE insert hole (fastest fit test)
print_section = "CORNER";

// =============================================================================
// ASSEMBLY (rebased to origin, flat on Z=0)
// =============================================================================
// World-space Y landmarks (module coords + the back_support_wall_thickness shift)
_pym     = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
_f1c_y   = back_support_wall_thickness + _pym + fuse_holder_width/2;          // fuse1 row center
_f2c_y   = back_support_wall_thickness + _pym + fuse_holder_width + fuse_gap + fuse_holder_width/2;  // fuse2 row center
_split_y = (_f1c_y + _f2c_y) / 2;                                            // mid rib (row split)
// World-space X landmarks (the two mount holes share these X positions)
_pxm     = (platform_x_width - fuse_holder_length) / 2;
_hole_x_near = _pxm + (fuse_holder_length - fuse_mount_hole_spacing) / 2;
_split_x = _hole_x_near + fuse_mount_hole_spacing / 2;   // midpoint between the 2 X holes
_boss_half   = 15;  // half-size of the single-boss coupon (mm)

if (print_section == "FULL") {
    platform_assembly();
} else {
    intersection() {
        platform_assembly();
        if (print_section == "CORNER")
            // near-X / near-Y quadrant -> one hole, one rounded outer corner
            translate([-10, -10, -10])
                cube([_split_x + 10, _split_y + 10, platform_thickness + 20]);
        else if (print_section == "FUSE1")
            translate([-10, -10, -10])
                cube([platform_x_width + 20, _split_y + 10, platform_thickness + 20]);
        else if (print_section == "FUSE2")
            translate([-10, _split_y, -10])
                cube([platform_x_width + 20,
                      back_support_wall_thickness + platform_y_depth - _split_y + 10,
                      platform_thickness + 20]);
        else if (print_section == "BOSS")
            translate([_hole_x_near - _boss_half, _f1c_y - _boss_half, -10])
                cube([2*_boss_half, 2*_boss_half, platform_thickness + 20]);
    }
}

module platform_assembly() {
    translate([0, back_support_wall_thickness, 0])
        difference() {
            union() {
                platform_slab();
                insert_stubs();   // downward boss extensions (auto-disabled when slab is thick enough)
            }
            if (include_fuse_platform_hex_cuts) platform_hex_cuts();
            platform_holes();
        }
}

// =============================================================================
// MODULES
// =============================================================================

module platform_slab() {
    // Horizontal slab. All 4 outside top edges rounded via minkowski + sphere,
    // clipped to the original bounds to keep the bottom and side faces flat.
    y_front = -back_support_wall_thickness;                  // retained wall-join strip
    y_depth = back_support_wall_thickness + platform_y_depth;
    r = include_fp_top_round ? fp_top_round_radius : 0;

    if (r > 0) {
        intersection() {
            // Original bounding box clips the minkowski overhang on the bottom
            translate([platform_x_origin, y_front, 0])
                cube([platform_x_width, y_depth, platform_thickness]);

            // Inner core offset inward by r on all sides + top; bottom flush.
            // After minkowski with sphere(r) it grows back to the bounds.
            minkowski() {
                translate([platform_x_origin + r, y_front + r, 0])
                    cube([platform_x_width - 2*r,
                          y_depth - 2*r,
                          platform_thickness - r]);
                sphere(r=r, $fn=24);
            }
        }
    } else {
        translate([platform_x_origin, y_front, 0])
            cube([platform_x_width, y_depth, platform_thickness]);
    }
}

module platform_holes() {
    // 4 holes: 2 per fuse holder, 2 fuse holders stacked along Y.
    // Through-hole at rivet diameter (7.3mm); counterbore (11mm) from the bottom
    // leaves a 2mm rivet-grip layer at the top of the slab.
    platform_bot_z = 0;
    platform_top_z = platform_thickness;

    // X positions of the 2 mount holes (shared by both fuses, stacked along Y)
    platform_x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    fuse_x_start = platform_x_origin + platform_x_edge_margin;
    fuse_inset_from_end = (fuse_holder_length - fuse_mount_hole_spacing) / 2;
    hole_x_near = fuse_x_start + fuse_inset_from_end;
    hole_x_far  = hole_x_near + fuse_mount_hole_spacing;

    // Y centers of the 2 fuse holders
    platform_y_edge_margin = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
    fuse1_y_start  = platform_y_edge_margin;                       // parent outer_w -> 0
    fuse2_y_start  = fuse1_y_start + fuse_holder_width + fuse_gap;
    fuse1_y_center = fuse1_y_start + fuse_holder_width / 2;
    fuse2_y_center = fuse2_y_start + fuse_holder_width / 2;

    // ---- HEAT-SET INSERT path (active) ----
    // Uniform 6.1mm bore at the thin OD so the brass melts in, sunk from the TOP
    // face deep enough to swallow the full insert (+ seat clearance), leaving a
    // 1mm floor below. A 3mm center drain then opens that floor to the underside.
    insert_pocket_depth = insert_length + insert_seat_clearance;
    pocket_bot_z = platform_top_z - insert_pocket_depth;
    stub_height  = max(0, insert_pocket_depth + insert_pocket_floor - platform_thickness);
    stub_bot_z   = -stub_height;
    for (hx = [hole_x_near, hole_x_far]) {
        for (hy = [fuse1_y_center, fuse2_y_center]) {
            translate([hx, hy, pocket_bot_z])
                cylinder(d=insert_pilot_dia, h=insert_pocket_depth + 1, $fn=48);
            translate([hx, hy, platform_top_z - insert_leadin_depth])
                cylinder(d=insert_leadin_dia, h=insert_leadin_depth + 1, $fn=48);
            // Center drain: punches through the floor from inside the pocket out
            // the bottom of the stub so condensation can't pool around the brass.
            if (insert_drain && insert_drain_dia > 0)
                translate([hx, hy, stub_bot_z - 1])
                    cylinder(d=insert_drain_dia,
                             h=(pocket_bot_z + 0.5) - (stub_bot_z - 1), $fn=32);
        }
    }

    // ---- ORIGINAL RIVET-NUT path (kept for reference) ----
    // Through-hole at rivet diameter (7.3mm) with an 11mm counterbore from the
    // underside, leaving a 2.5mm rivet-grip layer at the top of the slab.
    // counterbore_top_z = platform_top_z - fuse_mount_rivet_grip_t;  // grip layer stays at top
    // counterbore_clearance_depth = max(platform_thickness - fuse_mount_rivet_grip_t,
    //                                   fuse_mount_rivet_length - fuse_mount_rivet_grip_t);
    // counterbore_bot_z = counterbore_top_z - counterbore_clearance_depth;
    //
    // for (hx = [hole_x_near, hole_x_far]) {
    //     for (hy = [fuse1_y_center, fuse2_y_center]) {
    //         // Through-hole at rivet diameter through the full platform
    //         translate([hx, hy, platform_bot_z - 1])
    //             cylinder(d=fuse_mount_hole_dia, h=platform_thickness + 2, $fn=32);
    //         // Counterbore from the underside
    //         translate([hx, hy, counterbore_bot_z - 1])
    //             cylinder(d=fuse_mount_counterbore_dia, h=counterbore_clearance_depth + 2, $fn=48);
    //     }
    // }
}

module insert_stubs() {
    // Downward cylindrical extensions of each rivet boss. Because the 10mm insert
    // is longer than the 8mm slab, each boss grows a stub below the underside so
    // the full insert length is captured in solid material (top flush, 1mm floor).
    // Sized/positioned to sit exactly under the 16mm bosses, so the hex cuts (which
    // already exclude the boss footprint) never touch them.
    platform_top_z = platform_thickness;
    insert_pocket_depth = insert_length + insert_seat_clearance;
    stub_height = max(0, insert_pocket_depth + insert_pocket_floor - platform_thickness);

    // Hole positions (same math as platform_holes)
    platform_x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    fuse_x_start = platform_x_origin + platform_x_edge_margin;
    fuse_inset_from_end = (fuse_holder_length - fuse_mount_hole_spacing) / 2;
    hole_x_near = fuse_x_start + fuse_inset_from_end;
    hole_x_far  = hole_x_near + fuse_mount_hole_spacing;
    platform_y_edge_margin = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
    fuse1_y_start  = platform_y_edge_margin;
    fuse2_y_start  = fuse1_y_start + fuse_holder_width + fuse_gap;
    fuse1_y_center = fuse1_y_start + fuse_holder_width / 2;
    fuse2_y_center = fuse2_y_start + fuse_holder_width / 2;

    if (stub_height > 0) {
        for (hx = [hole_x_near, hole_x_far]) {
            for (hy = [fuse1_y_center, fuse2_y_center]) {
                // From -stub_height up to +0.01 (slight overlap to weld onto slab)
                translate([hx, hy, -stub_height])
                    cylinder(d=insert_stub_dia, h=stub_height + 0.01, $fn=48);
            }
        }
    }
}

module platform_hex_cuts() {
    // Honeycomb through-cut. Cut shape = (bay area inset by fph_bay_inset)
    // INTERSECT (hex grid). Extruded through the full platform thickness.
    // Keeps: 3 solid vertical columns, front/mid/rear rims, 16mm rivet bosses.
    platform_bot_z = 0;

    // Rivet positions (replicate platform_holes logic)
    platform_x_edge_margin = (platform_x_width - fuse_holder_length) / 2;
    fuse_x_start = platform_x_origin + platform_x_edge_margin;
    fuse_inset_from_end = (fuse_holder_length - fuse_mount_hole_spacing) / 2;
    hole_x_near = fuse_x_start + fuse_inset_from_end;
    hole_x_far  = hole_x_near + fuse_mount_hole_spacing;
    platform_y_edge_margin = (platform_y_depth - 2*fuse_holder_width - fuse_gap) / 2;
    fuse1_y_start  = platform_y_edge_margin;
    fuse2_y_start  = fuse1_y_start + fuse_holder_width + fuse_gap;
    fuse1_y_center = fuse1_y_start + fuse_holder_width / 2;
    fuse2_y_center = fuse2_y_start + fuse_holder_width / 2;
    rib_mid_y = (fuse1_y_center + fuse2_y_center) / 2;

    // Column X positions (gusset-aligned in the parent)
    col_mid_x   = platform_x_origin + platform_x_width/2 - fp_gusset_thickness/2;
    col_right_x = platform_x_origin + platform_x_width - fp_gusset_thickness;

    // Hex tiling math: hexes spaced as if size F_eff = F + wall, drawn at size F
    F_eff = fph_hex_F + fph_hex_wall;
    s_eff = F_eff / sqrt(3);
    col_spacing_x = 1.5 * s_eff;          // X spacing between hex columns
    row_spacing_y = F_eff;                // Y spacing within a column
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
                        // Full rearward footprint
                        translate([platform_x_origin, 0])
                            square([platform_x_width, platform_y_depth]);
                        // KEEP: left column
                        translate([platform_x_origin, 0])
                            square([fp_gusset_thickness, platform_y_depth]);
                        // KEEP: middle column
                        translate([col_mid_x, 0])
                            square([fp_gusset_thickness, platform_y_depth]);
                        // KEEP: right column
                        translate([col_right_x, 0])
                            square([fp_gusset_thickness, platform_y_depth]);
                        // KEEP: front rim
                        translate([platform_x_origin, 0])
                            square([platform_x_width, fph_perimeter_rim]);
                        // KEEP: mid horizontal rib (in fuse gap)
                        translate([platform_x_origin, rib_mid_y - fph_mid_rib/2])
                            square([platform_x_width, fph_mid_rib]);
                        // KEEP: rear rim
                        translate([platform_x_origin, platform_y_depth - fph_perimeter_rim])
                            square([platform_x_width, fph_perimeter_rim]);
                        // KEEP: 4 rivet bosses
                        translate([hole_x_near, fuse1_y_center]) circle(d = fph_boss_dia, $fn = 32);
                        translate([hole_x_far,  fuse1_y_center]) circle(d = fph_boss_dia, $fn = 32);
                        translate([hole_x_near, fuse2_y_center]) circle(d = fph_boss_dia, $fn = 32);
                        translate([hole_x_far,  fuse2_y_center]) circle(d = fph_boss_dia, $fn = 32);
                    }

                // HEX GRID — flat-top hexes, offset columns.
                // CENTER-ONLY FILTER: only emit hexes whose center is inside the
                // inset bay area (drops sliver hexes); the outer intersection()
                // clips any partial overflow at bay edges.
                let(
                    front_y   = fph_perimeter_rim + fph_bay_inset,
                    mid_y_bot = rib_mid_y - fph_mid_rib/2 - fph_bay_inset,
                    mid_y_top = rib_mid_y + fph_mid_rib/2 + fph_bay_inset,
                    rear_y    = platform_y_depth - fph_perimeter_rim - fph_bay_inset,
                    left_x    = platform_x_origin + fp_gusset_thickness + fph_bay_inset,
                    mid_x_lo  = col_mid_x - fph_bay_inset,
                    mid_x_hi  = col_mid_x + fp_gusset_thickness + fph_bay_inset,
                    right_x   = col_right_x - fph_bay_inset,
                    bcd2      = (fph_boss_dia/2 + fph_bay_inset) * (fph_boss_dia/2 + fph_bay_inset)
                ) {
                    for (col = [0 : n_cols]) {
                        for (row = [-1 : n_rows]) {
                            cx = platform_x_origin + col * col_spacing_x;
                            cy = row * row_spacing_y
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

// =============================================================================
// CONSOLE NOTES
// =============================================================================
echo("============================================");
echo("FUSE PLATFORM TEST PRINT");
echo(str("Footprint: ", platform_x_width, " x ",
         back_support_wall_thickness + platform_y_depth, " x ", platform_thickness, " mm"));
echo(str("           ", platform_x_width/25.4, " x ",
         (back_support_wall_thickness + platform_y_depth)/25.4, " x ",
         platform_thickness/25.4, " inches"));
echo(str("M5 HEAT-SET insert pockets: uniform ", insert_pilot_dia,
         "mm bore, ", insert_length + insert_seat_clearance,
         "mm deep -> full ", insert_length, "mm insert sits flush in the ",
         platform_thickness, "mm slab (", insert_pocket_floor, "mm floor)."));
echo(insert_drain
     ? str("Center drain: ", insert_drain_dia, "mm through each pocket floor",
           insert_drain_dia >= insert_pilot_dia ? " (>= pilot -> floor fully open)." : " (annular ledge stop retained).")
     : "Center drain: DISABLED (blind floor, may trap condensation).");
// ORIGINAL rivet-nut note (kept for reference):
// echo("4x M5 rivet-nut holes: 7.3mm grip (top 2mm) / 11mm counterbore below.");
echo("PRINT IN ASA. Flat on bed, no supports needed.");
echo("============================================");
