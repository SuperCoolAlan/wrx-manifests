// =============================================================================
// 5001-A <-> 5001-B bridge bus bar — formed C110 flat bar (Linear CPU-92)
// =============================================================================
// Two uses:
//   1. `bridge_bar()`   — the formed 3D part, placed by cable-layout.scad for clearance.
//                         Print it in PETG/ASA as a FIT DUMMY before forming the copper.
//   2. `bridge_flat()`  — 2D marking layout: cut length, hole centres, twist zones, bend
//                         tangents. Open this file alone and set `layout = "flat"`.
//
// Local frame: origin = centre of stud A ON THE FUSE FACE. X toward stud B, Y = out from
// the mount face (bar thickness at the tips), Z = up the legs.
//
// Two styles, `bar_style`:
//   "straight" — flat strap on top of the fuse eyelets, crossing the covers' facing side
//                walls through a notch cut up from each cover's bottom edge. Cut + 2 holes,
//                no forming. RECOMMENDED. (Spacer only if lug_under_fuse, see below.)
//   "U"        — the CPU-92 shape: flat tip -> 90 deg twist in the leg (so the bend is
//                easy-way) -> squared U out the covers' end windows. Kept as the fallback.
//                Both twists end with the width along Y; +90 or -90 gives the same part
//                because the bar is symmetric, so twist handedness is NOT a fit-up concern.
//                Caveat: the leg and the 1/0 feed lug both need stud A's end window.
// =============================================================================

layout    = "assembly";    // "assembly" (holders + bar, no tray) | "3d" (bar alone) | "flat" (marking drawing) | "both"
bar_style = "straight";    // "straight" | "U"
section   = false;         // assembly: slice through the upper studs to see the stacks

fh_no_demo = true;
include <fuse-holder-5001.scad>
lug_t = 3.0;               // 1/0 ring-lug tongue — ASSUMED, CPU-103 measures it
// Stack order on the studs. false (Alan, 2026-09-13): plate -> fuse -> strap -> lug -> washer -> nut, no spacer.
// true: lugs under the fuse for cover headroom, which then needs the 19x19 spacer under the fuse on stud B.
lug_under_fuse = false;
under_t = lug_under_fuse ? lug_t : 0;    // what sits under the fuse eyelets

// ---- stock (ordered 2026-09-02) ----
bar_w   = 19.05;        // 3/4"
bar_t   = 3.18;         // 1/8"

// ---- geometry ----
bar_span        = 40.10;  // stud centre to centre — from battery-tray-mtx35.scad fuse_hx_ctr
bar_hole_d      = 8.5;    // M8 clearance
bar_tip_ext     = 9.5;    // hole centre to bar end (= half width, square end)
bar_flat        = 12;     // hole centre to twist start. >= 8.5 keeps the M8 washer on flat metal.
                          // 12 starts the twist inside the cover; ~24 puts it fully outside.
bar_twist       = 22;     // 90 deg twist length. Outer-edge strain: 15mm=41%, 20mm=25%, 22mm=21%, 25mm=16%.
bar_lead        = 3;      // straight after the twist before the bend tangent — the twist must not run into the bend
bar_r_in        = 6.35;   // inside bend radius = 2t. Form on a 12.7 mm round (1/2" bolt shank) — NOT a "13 mm socket", its OD is ~18.
bar_k           = 0.42;   // K-factor for r/t = 2 (bend allowance on the neutral axis)

// ---- derived ----
bar_leg_tan     = bar_flat + bar_twist + bar_lead;          // tangent point above the stud centre
bar_rise        = bar_r_in + bar_t;                         // U top (outside) above the tangent
bar_top_z       = bar_leg_tan + bar_rise;                   // U top above the stud centre
bar_top_str     = bar_span - bar_t - 2*bar_r_in;            // straight inside the U
bar_ba          = (PI/2) * (bar_r_in + bar_k*bar_t);        // bend allowance, each 90
bar_leg_dev     = bar_tip_ext + bar_leg_tan;                // developed leg, tip end to tangent
bar_dev_len     = 2*bar_leg_dev + bar_top_str + 2*bar_ba;   // total developed (cut) length

// ---- straight strap ----
bar_str_len = bar_span + 2*bar_tip_ext;     // 59.2

module bridge_bar(twist_slices = 44) {
    if (bar_style == "straight") bridge_strap(); else bridge_u(twist_slices);
}

// Strap lies on the fuse face: thickness along Y (0..t), width along Z, centred on the studs.
module bridge_strap() {
    difference() {
        translate([-bar_tip_ext, 0, -bar_w/2]) cube([bar_str_len, bar_t, bar_w]);
        for (x = [0, bar_span]) translate([x, -1, 0]) rotate([-90, 0, 0])
            cylinder(d = bar_hole_d, h = bar_t + 2, $fn = 32);
    }
}

// 19x19 spacer from the same stock, goes under the fuse eyelet on stud B (matches the lug on A)
module bridge_spacer() {
    difference() {
        translate([-bar_w/2, 0, -bar_w/2]) cube([bar_w, bar_t, bar_w]);
        translate([0, -1, 0]) rotate([-90, 0, 0]) cylinder(d = bar_hole_d, h = bar_t + 2, $fn = 32);
    }
}

module bridge_u(twist_slices = 44) {
    difference() {
        union() {
            bb_leg(twist_slices);
            translate([bar_span, 0, 0]) mirror([1, 0, 0]) bb_leg(twist_slices);
            translate([bar_t/2 + bar_r_in, bar_t/2 - bar_w/2, bar_leg_tan + bar_r_in])
                cube([bar_top_str, bar_w, bar_t]);
        }
        for (x = [0, bar_span]) translate([x, -1, 0]) rotate([-90, 0, 0])
            cylinder(d = bar_hole_d, h = bar_t + 2, $fn = 32);
    }
}

module bb_slice(k, n) {   // zero-thickness cross-section, rotated k/n of 90 deg about the leg axis
    translate([0, bar_t/2, bar_flat + bar_twist*k/n]) rotate([0, 0, 90*k/n])
        translate([-bar_w/2, -bar_t/2, 0]) cube([bar_w, bar_t, 0.01]);
}

module bb_leg(n) {
    // flat tip: width along X, thickness along Y
    translate([-bar_w/2, 0, -bar_tip_ext]) cube([bar_w, bar_t, bar_tip_ext + bar_flat]);
    // twist
    for (k = [0 : n-1]) hull() { bb_slice(k, n); bb_slice(k+1, n); }
    // straight lead, now width along Y
    translate([-bar_t/2, bar_t/2 - bar_w/2, bar_flat + bar_twist]) cube([bar_t, bar_w, bar_lead + 0.01]);
    // easy-way bend toward +X, axis along Y
    translate([bar_t/2 + bar_r_in, bar_t/2 + bar_w/2, bar_leg_tan]) rotate([90, 0, 0])
        linear_extrude(bar_w) intersection() {
            difference() { circle(r = bar_r_in + bar_t, $fn = 64); circle(r = bar_r_in, $fn = 64); }
            translate([-(bar_r_in + bar_t), 0]) square([bar_r_in + bar_t, bar_r_in + bar_t]);
        }
}

// ---- flat marking / dimension drawing (2D, mm). X along the bar from end A. ----
// Render:  openscad -o bridge-bar-drawing.png -D 'layout="flat"' --projection=o --imgsize=2400,1400 bridge-bar.scad
//          openscad -o bridge-bar-drawing.svg -D 'layout="flat"' bridge-bar.scad   (2D export, text becomes outlines)
dl = 0.25;   // dimension line weight
module dim_arrow(a = 0) rotate(a) polygon([[0, 0], [-2.2, 0.8], [-2.2, -0.8]]);
module dim_text(t, p, a = 0) translate(p) rotate(a) text(t, size = 2.6, halign = "center", valign = "bottom", font = "Liberation Sans");
// horizontal dimension between x0 and x1 at height y; ext = extension line length toward the part
module dim_h(x0, x1, y, label, ext = 4, above = true) color("black") {
    translate([x0, y - dl/2]) square([x1 - x0, dl]);
    translate([x0, dim_arrow_pos(y)]) dim_arrow(0);   translate([x1, y]) dim_arrow(0); translate([x0, y]) dim_arrow(180);
    for (x = [x0, x1]) translate([x - dl/2, above ? y - ext : y]) square([dl, ext]);
    dim_text(label, [(x0 + x1)/2, y + 1]);
}
function dim_arrow_pos(y) = y;   // (kept simple; arrows sit on the line)
module dim_v(y0, y1, x, label, ext = 4) color("black") {
    translate([x - dl/2, y0]) square([dl, y1 - y0]);
    translate([x, y1]) dim_arrow(90); translate([x, y0]) dim_arrow(-90);
    for (y = [y0, y1]) translate([x, y - dl/2]) square([ext, dl]);
    dim_text(label, [x - 1, (y0 + y1)/2], 90);
}
module centre_mark(p, r = 6) color("black") translate(p) { square([2*r, dl], center = true); square([dl, 2*r], center = true); }
module note(t, p, size = 2.6) color("black") translate(p) text(t, size = size, font = "Liberation Sans");

module bridge_flat() {
    if (bar_style == "straight") bridge_drawing_straight(); else bridge_flat_u();
}

module bridge_drawing_straight() {
    hA = bar_tip_ext;  hB = bar_tip_ext + bar_span;  yc = bar_w/2;
    // strap
    color("#e8a75a") difference() {
        square([bar_str_len, bar_w]);
        for (x = [hA, hB]) translate([x, yc]) circle(d = bar_hole_d, $fn = 48);
    }
    for (x = [hA, hB]) centre_mark([x, yc]);
    // dimensions
    dim_h(0, bar_str_len, bar_w + 16, str(bar_str_len), ext = 15);                 // overall
    dim_h(0, hA, bar_w + 8, str(hA), ext = 7);                                       // end to hole A
    dim_h(hA, hB, bar_w + 8, str(bar_span, "  (stud centres)"), ext = 7);            // hole to hole
    dim_h(hB, bar_str_len, bar_w + 8, str(bar_tip_ext), ext = 7);                   // hole B to end
    dim_v(0, bar_w, -8, str(bar_w), ext = 7);                                        // width
    dim_v(0, yc, -16, str(yc), ext = 15);                                            // hole on centreline
    note(str("2x  DIA ", bar_hole_d, " THRU"), [hA - 6, -14]);
    note(str("STOCK: C110 flat bar ", bar_w, " x ", bar_t, "  (3/4\" x 1/8\")"), [0, -24]);
    note("BRIDGE STRAP  5001-A <-> 5001-B upper studs   qty 1", [0, -30]);
    // spacer (only when the lug goes under the fuse)
    sx = bar_str_len + 22;
    if (lug_under_fuse) translate([sx, 0]) {
        color("#e8a75a") difference() { square([bar_w, bar_w]); translate([yc, yc]) circle(d = bar_hole_d, $fn = 48); }
        centre_mark([yc, yc]);
        dim_h(0, yc, bar_w + 8, str(yc), ext = 7);
        dim_h(0, bar_w, bar_w + 16, str(bar_w), ext = 15);
        dim_v(0, yc, bar_w + 8, str(yc), ext = 7);
        note(str("DIA ", bar_hole_d, " THRU"), [-2, -14]);
        note("SPACER  qty 1", [-2, -20]);
        note("under fuse, stud B", [-2, -25], 2.2);
    }
    note("All mm. Deburr both faces. Hole edge distance 5.3 mm: M8 flat washer under the nut.", [0, -38], 2.2);
}

module bridge_flat_u() {
    hA  = bar_tip_ext;                       // hole A centre
    tA0 = hA + bar_flat;  tA1 = tA0 + bar_twist;
    bA  = bar_leg_dev;    bA1 = bA + bar_ba;
    bB1 = bA1 + bar_top_str; bB = bB1 + bar_ba;
    tB1 = bB + bar_lead;  tB0 = tB1 + bar_twist;
    hB  = bar_dev_len - bar_tip_ext;
    color("#c60") difference() {
        square([bar_dev_len, bar_w]);
        for (x = [hA, hB]) translate([x, bar_w/2]) circle(d = bar_hole_d, $fn = 32);
    }
    bb_mark(hA,  str("hole A  ", hA));
    bb_mark(tA0, str("twist A start  ", tA0));
    bb_mark(tA1, str("twist A end  ", tA1));
    bb_mark(bA,  str("bend A tangent  ", bA));
    bb_mark(bA1, str("bend A end  ", bA1));
    bb_mark(bB1, str("bend B tangent  ", bB1));
    bb_mark(bB,  str("bend B end  ", bB));
    bb_mark(tB1, str("twist B end  ", tB1));
    bb_mark(tB0, str("twist B start  ", tB0));
    bb_mark(hB,  str("hole B  ", hB));
    color("black") translate([0, -14]) text(str("cut ", bar_dev_len, " mm  (", bar_w, " x ", bar_t, ")  span ", bar_span,
                                               "  r_in ", bar_r_in, "  U top +", bar_top_z), size = 3);
}

if (bar_style == "straight") {
    echo(str("BRIDGE STRAP: ", bar_str_len, " x ", bar_w, " x ", bar_t, ", holes ", bar_hole_d, " at ", bar_span, " centres",
             lug_under_fuse ? str(", +1 spacer ", bar_w, " sq") : ", no spacer (lug on top of strap)"));
    echo(str("A-upper stack (lug on ", lug_under_fuse ? "plate" : "strap", "): nut top ", strap_face + bar_t + (lug_under_fuse ? 0 : lug_t) + fh_washer_t + fh_nut_h,
             ", feed lug barrel top ~", (lug_under_fuse ? fh_plate_top : strap_face + bar_t) + lug_t + 13.5, " vs cover roof inside ", fh_cover_top - fh_cover_wall));
} else echo(str("BRIDGE BAR: developed ", bar_dev_len, " mm | leg tangent +", bar_leg_tan, " | U top +", bar_top_z,
         " above stud | top straight ", bar_top_str, " | bend allowance ", bar_ba, " each"));

// ---- assembly preview: the two holders as mounted (long axis up, side by side) ----
// Frame: X across the holders, Y out from the mount face (mount face at Y=0), Z up.
// Origin = holder A's centre on the mount face; upper studs at Z = +fh_stud_x.
strap_face = fh_plate_top + under_t + fh_fuse_eye_t;   // strap seats on the fuse eyelet
holder_up  = [[0,1,0,0],[0,0,1,0],[1,0,0,0],[0,0,0,1]]; // holder local X->Z, Y->X, Z->Y

module bb_lug(barrel_dir = [0,0,1]) {   // 1/0 ring lug dummy: tongue on the stud, barrel pointing barrel_dir
    color("#b87333") {
        translate([0, lug_t/2, 0]) cube([16, lug_t, 22], center = true);
        translate([0, 7, 0]) rotate([0, 0, 0]) translate(barrel_dir * 11) cylinder(d = 13.5, h = 30, $fn = 24);
    }
}

module bridge_assembly() {
    for (i = [0, 1]) translate([i*bar_span, 0, 0]) multmatrix(holder_up) {
        fuse_holder_5001(fuse_lift = under_t,
                         notch_sides = bar_style == "straight" ? [i == 0 ? 1 : -1] : [],
                         notch_top = strap_face + bar_t + 0.5);
        bar_top = strap_face + (bar_style == "straight" ? bar_t : 0);
        translate([ fh_stud_x, 0, 0]) fh_nut_stack(bar_top + (i == 0 && !lug_under_fuse ? lug_t : 0));
        translate([-fh_stud_x, 0, 0]) fh_nut_stack(fh_plate_top + fh_fuse_eye_t + lug_t);
    }
    // lugs: feed on A-upper, alternator / audio on the lower studs
    feed_lug_y  = lug_under_fuse ? fh_plate_top : strap_face + (bar_style == "straight" ? bar_t : 0);
    lower_lug_y = lug_under_fuse ? fh_plate_top : fh_plate_top + fh_fuse_eye_t;
    translate([0, feed_lug_y, fh_stud_x]) bb_lug([0,0,1]);
    for (i = [0, 1]) translate([i*bar_span, lower_lug_y, -fh_stud_x]) bb_lug([0,0,-1]);
    // bridge
    color("#c60") translate([0, strap_face, fh_stud_x]) bridge_bar();
    if (bar_style == "straight" && lug_under_fuse) color("#c60") translate([bar_span, fh_plate_top, fh_stud_x]) bridge_spacer();
}

if (is_undef(bb_no_demo)) {   // included by cable-layout.scad with bb_no_demo set
    if (layout == "assembly") {
        // section: keep everything below the upper-stud axis and look straight down at the cut
        if (section) difference() { bridge_assembly(); translate([-50, -1, fh_stud_x]) cube([150, 100, 100]); }
        else bridge_assembly();
    }
    if (layout == "3d" || layout == "both") color("#c60") bridge_bar();
    if (layout == "flat") bridge_flat();
    if (layout == "both") translate([0, -60, 0]) bridge_flat();
}

// Camera. Top-level only (OpenSCAD ignores $vp* inside blocks). An including file passes its
// own camera as bb_vpr/bb_vpt/bb_vpd BEFORE the include — $-variables can't be overridden
// the normal way, the include's assignment wins.
$vpr = !is_undef(bb_vpr) ? bb_vpr : layout == "assembly" ? (section ? [0, 0, 0] : [70, 0, 205]) : layout == "flat" ? [0, 0, 0] : [60, 0, 30];
$vpt = !is_undef(bb_vpt) ? bb_vpt : layout == "assembly" ? [bar_span/2, 20, section ? fh_stud_x - 20 : fh_stud_x] : layout == "flat" ? [(lug_under_fuse ? bar_str_len + 22 + bar_w : bar_str_len)/2 + (lug_under_fuse ? -2 : 8), 2, 0] : [bar_span/2, 0, 20];
$vpd = !is_undef(bb_vpd) ? bb_vpd : layout == "assembly" ? (section ? 150 : 240) : layout == "flat" ? (lug_under_fuse ? 235 : 230) : 160;
