// =============================================================================
// Parametric FPR Bracket — Aeromotive A1000 Gen II EFI (13138/13139/13140)
// =============================================================================
// The regulator bolts to this plate's FRONT face using its two factory tapped
// holes (10-24, supplied socket head cap screws). The plate's base flange has
// slotted holes — the interface to the future chassis-mount assembly that will
// also carry the flex fuel sensor bracket.
//
// !!! VERIFY WITH CALIPERS BEFORE PRINTING (marked [MEASURE]) !!!
// Web sources give the Aeromotive pattern as 1.200" / 10-24 but no official
// dimension drawing exists — measure the actual regulator.
//
// PRINT MATERIAL: ASA (engine bay). Print plate-face down or on its side —
// see BUILD-NOTES.md.
// =============================================================================

// ---- REGULATOR MOUNT PATTERN ----
reg_hole_spacing   = 30.48;  // [MEASURE] center-to-center of the 2 tapped holes (1.200" = 30.48mm, standard Aeromotive pattern)
reg_screw_clear_d  = 5.0;    // clearance hole for 10-24 screw (major dia 4.83mm)
reg_screw_head_d   = 9.0;    // counterbore dia for 10-24 SHCS head (head ~7.9mm + slop)
reg_grip_t         = 3.0;    // material left under the screw head (mm) — with 1/2" (12.7mm) screws this leaves ~9.7mm of thread engagement in the regulator body
reg_holes_horizontal = true; // true = holes side-by-side (regulator upright, adjuster up)

// ---- REGULATOR KEEP-OUT ENVELOPE (ghost preview only — not printed) ----
// [MEASURE] all of these on the actual unit. Used to visualize clearance.
reg_body_dia       = 57.2;   // main billet body diameter (~2.25")
reg_body_h         = 70;     // main body height (side-port section + cap)
reg_total_h        = 118;    // overall height incl. adjuster screw + jam nut
reg_back_to_axis   = 32;     // [MEASURE] distance from the plate front face to the body centerline — the back of the upper housing (where tapped holes live) to body axis
reg_holes_z        = 48;     // [MEASURE] height of the tapped-hole pair above the body's bottom face
an8_fitting_dia    = 26;     // AN-8 hose end hex/socket OD on the side ports
an8_fitting_len    = 40;     // how far a side fitting + hose tail sticks out per side
return_fitting_dia = 22;     // ORB-06 -> AN-6 fitting on the bottom return port
return_fitting_len = 45;     // downward stick-out incl. hose bend start

// ---- PLATE ----
plate_w            = 50;     // plate width (mm) — narrower than the body so side fittings/wrenches clear
plate_h            = 60;     // plate height (mm)
plate_t            = 10;     // plate thickness (mm)
plate_corner_r     = 6;      // corner rounding on the top two corners
holes_z_from_top   = 14;     // regulator hole pair distance down from plate top edge

// ---- BASE FLANGE (interface to future chassis assembly) ----
flange_depth       = 40;     // how far the foot extends rearward (mm)
flange_t           = 8;      // flange thickness (mm)
flange_slot_w      = 6.5;    // slot width — M6 clearance
flange_slot_len    = 14;     // slot length (adjustability for the assembly plate)
flange_slot_spacing = 32;    // center-to-center across X
flange_slot_y      = 24;     // slot center distance rearward from the plate back face
gusset_base        = 30;     // gusset reach along the flange (mm)
gusset_height      = 40;     // gusset reach up the plate (mm)
gusset_thickness   = 5;      // matches wall convention from battery tray
gusset_shape       = "CURVED";  // "CURVED" | "STRAIGHT"
gusset_curve_segments = 48;

// ---- PREVIEW ----
show_regulator_ghost = true; // ghost keep-out model (preview only; excluded from render/STL via %)

// ---- DERIVED ----
holes_z = plate_h - holes_z_from_top;                 // Z of the hole pair on the plate
hx = reg_hole_spacing / 2;

// =============================================================================
// MAIN ASSEMBLY
// =============================================================================
// Coordinate frame: plate front face (regulator side) at Y=0, plate extends to
// Y=plate_t; flange extends rearward +Y along the bottom. X centered on 0.

bracket();
if (show_regulator_ghost) %regulator_ghost();

module bracket() {
    difference() {
        union() {
            plate_body();
            base_flange();
            flange_gussets();
        }
        regulator_screw_holes();
        flange_slots();
    }
}

// =============================================================================
// MODULES
// =============================================================================

module plate_body() {
    // Vertical plate, top two corners rounded
    translate([0, plate_t, 0])
        rotate([90, 0, 0])
            linear_extrude(plate_t)
                rounded_top_rect_2d(plate_w, plate_h, plate_corner_r);
}

module rounded_top_rect_2d(w, h, r) {
    // centered on X=0, base at y=0, both top corners rounded
    hull() {
        translate([-w/2, 0]) square([w, h - r]);
        translate([-w/2 + r, h - r]) circle(r=r, $fn=48);
        translate([ w/2 - r, h - r]) circle(r=r, $fn=48);
    }
}

module regulator_screw_holes() {
    // Screws insert from the BACK (+Y) through the plate into the regulator's
    // tapped holes. Counterbore from the back leaves reg_grip_t at the front.
    positions = reg_holes_horizontal
        ? [[-hx, holes_z], [hx, holes_z]]
        : [[0, holes_z - hx], [0, holes_z + hx]];
    for (p = positions) {
        // through clearance hole
        translate([p[0], -1, p[1]])
            rotate([-90, 0, 0])
                cylinder(d=reg_screw_clear_d, h=plate_t + 2, $fn=32);
        // counterbore from the back face
        translate([p[0], reg_grip_t, p[1]])
            rotate([-90, 0, 0])
                cylinder(d=reg_screw_head_d, h=plate_t - reg_grip_t + 1, $fn=48);
    }
}

module base_flange() {
    translate([-plate_w/2, plate_t, 0])
        cube([plate_w, flange_depth, flange_t]);
}

module flange_slots() {
    // 2 slotted M6 holes, slot long axis along Y (fore-aft adjustability)
    for (sx = [-flange_slot_spacing/2, flange_slot_spacing/2])
        translate([sx, plate_t + flange_slot_y, -1])
            slot_z(flange_slot_w, flange_slot_len, flange_t + 2);
}

module slot_z(w, len, h) {
    // stadium slot along Y, extruded in Z
    hull() {
        translate([0, -(len - w)/2, 0]) cylinder(d=w, h=h, $fn=32);
        translate([0,  (len - w)/2, 0]) cylinder(d=w, h=h, $fn=32);
    }
}

module flange_gussets() {
    // Curved gussets on top of the flange bracing the plate's back face, one per
    // side edge. Corner at (y=plate_t, z=flange_t); base runs rearward (+Y) along
    // the flange, height runs up (+Z) the plate.
    // rotate([90,0,90]) maps polygon +X -> world +Y, +Y -> world +Z, extrude -> +X.
    for (sx = [-plate_w/2, plate_w/2 - gusset_thickness])
        translate([sx, plate_t, flange_t])
            rotate([90, 0, 90])
                linear_extrude(gusset_thickness)
                    gusset_2d_shape(gusset_base, gusset_height);
}

module gusset_2d_shape(base, height) {
    // same helper as battery tray: concave quarter-ellipse hypotenuse
    if (gusset_shape == "STRAIGHT") {
        polygon([[0,0], [base, 0], [0, height]]);
    } else {
        difference() {
            polygon([[0,0], [base, 0], [base, height], [0, height]]);
            translate([base, height])
                scale([abs(base), height])
                    circle(r=1, $fn=gusset_curve_segments);
        }
    }
}

// =============================================================================
// REGULATOR GHOST (keep-out preview)
// =============================================================================
module regulator_ghost() {
    // Body axis sits reg_back_to_axis in FRONT of the plate face (-Y direction),
    // positioned so the tapped-hole pair lands on the plate's hole positions.
    body_bottom_z = holes_z - reg_holes_z;
    translate([0, -reg_back_to_axis, 0]) {
        // main body
        translate([0, 0, body_bottom_z])
            cylinder(d=reg_body_dia, h=reg_body_h, $fn=64);
        // upper cap + adjuster, tapering envelope
        translate([0, 0, body_bottom_z + reg_body_h])
            cylinder(d1=reg_body_dia, d2=14, h=reg_total_h - reg_body_h, $fn=64);
        // AN-8 side fittings (both side ports, along X)
        for (sx = [-1, 1])
            translate([sx * reg_body_dia/2, 0, body_bottom_z + reg_body_h * 0.35])
                rotate([0, sx * 90, 0])
                    cylinder(d=an8_fitting_dia, h=an8_fitting_len, $fn=32);
        // bottom return fitting (ORB-06)
        translate([0, 0, body_bottom_z - return_fitting_len])
            cylinder(d=return_fitting_dia, h=return_fitting_len + 1, $fn=32);
        // gauge port stub (front, -Y)
        translate([0, -reg_body_dia/2 - 15, body_bottom_z + reg_body_h * 0.35])
            rotate([-90, 0, 0])
                cylinder(d=16, h=16, $fn=32);
    }
}
