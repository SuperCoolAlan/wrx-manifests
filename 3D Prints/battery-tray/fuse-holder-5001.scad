// =============================================================================
// Blue Sea 5001 MEGA/AMG fuse block — visualisation model
// =============================================================================
// VISUALISATION ONLY (cable-layout.scad). Not for printing.
//
// Local frame: origin = centre of the base on the MOUNT FACE.
//   X = long axis (studs at ±25.40), Y = across the width, Z = out from the mount face.
//
// Sources, per dimension:
//   DXF   = read off 5001.dxf (Blue Sea catalog drawing, rev 6, 2006) — line geometry,
//           so ±0.1 mm at best and only the 4 catalog dims are actually toleranced.
//   MEAS  = measured by Alan (CPU-99).
//   ASSUMED = not on the drawing, not measured. Verify before trusting for fit.
// =============================================================================

// ---- base (DXF) ----
fh_len          = 103.38;   // 4.070"
fh_wid          = 38.10;    // 1.500"
fh_base_h       = 10.16;    // 0.400" base plate
fh_base_r       = 6;        // end corner radius — ASSUMED from the top view
fh_mount_x      = 88.58/2;  // 3.488" centres
fh_mount_d      = 5.3;      // #10 / M5 clearance

// ---- terminal pedestal + plates (DXF, END view) ----
fh_ped_w        = 25.0;     // moulded pedestal ±12.5
fh_ped_top      = 18.07;    // pedestal top above mount face
fh_ped_len      = 78;       // ASSUMED — runs under both terminals
fh_plate_w      = 19.05;    // brass terminal plate ±9.52
fh_plate_top    = 22.14;    // plate top above mount face  (plate is 18.81 -> 22.14)
fh_plate_len    = 24;       // ASSUMED
fh_stud_x       = 25.40;    // 2.000" centres
fh_stud_d       = 7.94;     // 5/16"-18
fh_stud_len     = 18;       // above the plate — ASSUMED, drawing stops at the nut. MEASURE: sets the max stack.
fh_nut_af       = 14.3;     // ±7.14 in the DXF (that is 9/16" A/F, not the 1/2" a plain 5/16 nut would have)
fh_nut_h        = 5.6;
fh_washer_d     = 18.0;
fh_washer_t     = 1.8;

// ---- MEGA fuse (Littelfuse 298 series) ----
fh_fuse_len     = 68.6;
fh_fuse_w       = 19.05;    // matches the DXF top-view outline
fh_fuse_body_t  = 10.0;     // plastic body
fh_fuse_body_len= 35;
fh_fuse_eye_t   = 1.6;      // ASSUMED eyelet strip thickness — this sets where the bar lands, VERIFY with a caliper
fh_fuse_face    = fh_plate_top + fh_fuse_eye_t;   // Z of the face the bar / ring lug sits on

// ---- cover (DXF side view + MEAS) ----
fh_cover_len    = 93.4;     // DXF: end walls at 5.0 and 98.4 along the base
fh_cover_top    = 39.7;     // DXF roof; 41.87 catalog height is the ridge on top
fh_cover_wall   = 2.0;      // ASSUMED
fh_cover_r      = 4;        // roof corner radius — ASSUMED
fh_win_w        = 22.78;    // MEAS 0.897" (CPU-99) — cable window width in the end wall
fh_win_z0       = 19.0;     // ASSUMED window bottom above the mount face
fh_win_h        = 16.0;     // ASSUMED window height. Both drive whether the bar passes uncut.
fh_stud_to_cover_end = fh_cover_len/2 - fh_stud_x;   // 21.3 — stud centre to cover end wall

module fh_rrect(l, w, r) { offset(r) offset(-r) square([l, w], center=true); }

// fuse_lift   = what sits under the fuse eyelets (lug / spacer thickness)
// notch_sides = [] | [1] | [-1] | [-1,1]: cover side walls (local ±Y) to notch, open from the
//               cover's bottom edge up to notch_top, notch_w wide, centred on local x = notch_x.
//               The strap crosses here, so the cover still drops straight on over it.
module fuse_holder_5001(cover = true, fuse = true, alpha = 0.85, fuse_lift = 0,
                        notch_sides = [], notch_x = fh_stud_x, notch_w = 21, notch_top = 31) {
    // base
    color("#222", alpha) difference() {
        linear_extrude(fh_base_h) fh_rrect(fh_len, fh_wid, fh_base_r);
        for (sx = [-1, 1]) translate([sx*fh_mount_x, 0, -1]) cylinder(d = fh_mount_d, h = fh_base_h + 2, $fn = 24);
    }
    // pedestal
    color("#222", alpha) translate([-fh_ped_len/2, -fh_ped_w/2, fh_base_h - 0.01])
        cube([fh_ped_len, fh_ped_w, fh_ped_top - fh_base_h]);
    for (sx = [-1, 1]) translate([sx*fh_stud_x, 0, 0]) {
        color("goldenrod") translate([-fh_plate_len/2, -fh_plate_w/2, fh_ped_top - 0.01])
            cube([fh_plate_len, fh_plate_w, fh_plate_top - fh_ped_top]);
        color("silver") translate([0, 0, fh_plate_top - 0.01]) cylinder(d = fh_stud_d, h = fh_stud_len, $fn = 24);
    }
    if (fuse) color("#c8a24a", 0.9) translate([0, 0, fuse_lift]) {
        translate([-fh_fuse_len/2, -fh_fuse_w/2, fh_plate_top]) cube([fh_fuse_len, fh_fuse_w, fh_fuse_eye_t]);
        translate([-fh_fuse_body_len/2, -fh_fuse_w/2, fh_plate_top]) cube([fh_fuse_body_len, fh_fuse_w, fh_fuse_body_t]);
    }
    if (cover) color("#9cf", 0.25) difference() {
        translate([0, 0, fh_base_h]) linear_extrude(fh_cover_top - fh_base_h)
            fh_rrect(fh_cover_len, fh_wid, fh_cover_r);
        translate([0, 0, fh_base_h - 1]) linear_extrude(fh_cover_top - fh_base_h - fh_cover_wall + 1)
            fh_rrect(fh_cover_len - 2*fh_cover_wall, fh_wid - 2*fh_cover_wall, fh_cover_r - fh_cover_wall);
        // end-wall cable windows
        for (sx = [-1, 1]) translate([sx*fh_cover_len/2, 0, fh_win_z0 + fh_win_h/2])
            cube([fh_cover_wall*2 + 2, fh_win_w, fh_win_h], center = true);
        // side-wall notches for the bridge strap
        for (sy = notch_sides) translate([notch_x - notch_w/2, sy*fh_wid/2 - fh_cover_wall - 1, fh_base_h - 1])
            cube([notch_w, 2*fh_cover_wall + 2, notch_top - fh_base_h + 1]);
    }
}

// Nut + washer stack on a stud, `z0` = face it clamps down onto (local Z).
module fh_nut_stack(z0) {
    color("silver") {
        translate([0, 0, z0]) cylinder(d = fh_washer_d, h = fh_washer_t, $fn = 32);
        translate([0, 0, z0 + fh_washer_t]) cylinder(d = fh_nut_af / cos(30), h = fh_nut_h, $fn = 6);
    }
}

// standalone preview
if ($preview && is_undef(fh_no_demo)) {
    fuse_holder_5001();
    for (sx = [-1, 1]) translate([sx*fh_stud_x, 0, 0]) fh_nut_stack(fh_fuse_face);
    echo(str("5001: fuse face Z=", fh_fuse_face, "  stud->cover end=", fh_stud_to_cover_end, "  cover top=", fh_cover_top));
}
