// =============================================================================
// FPR Carrier — Aeromotive A1000 Gen II (13138/13139) w/ STOCK STEEL BRACKET
// =============================================================================
// The regulator keeps its factory stamped-steel bracket (10-24s into the lower
// block, joggle, two ears). The ears bolt to this printed carrier pad via M5
// screws into heat-set inserts (validated 6.65mm bore workflow from the battery
// tray). The carrier's base flange (M6 slots) is the interface to the future
// chassis-mount assembly shared with the flex fuel sensor bracket.
//
// All regulator dimensions below are CALIPER-MEASURED on the actual unit
// (2026-07-25) unless marked [approx].
//
// Frame: mating face (ears press here) at Y=0; regulator forward of it (-Y);
// flange extends rearward (+Y). X centered. Z=0 at flange bottom.
// =============================================================================

// ---- MEASURED: STEEL BRACKET EAR PATTERN ----
ear_spacing        = 52.0;   // hole center-to-center (46.5 inside-inside + 5.5 dia)
ear_hole_d         = 5.5;    // ear hole diameter — M5 passes with 0.5mm slop
ear_center_above_base = 47.0; // ear-hole centerline above FPR bottom face
ear_top_above_base = 53.0;   // bracket top edge above FPR bottom face
bracket_steel_t    = 2.0;    // [approx] stamped steel thickness (ghost only)

// ---- MEASURED: REGULATOR ENVELOPE ----
axis_from_plane    = 27.0;   // body centerline forward of the ear mating plane
                             // (8.6 gap to thin can + 36.86/2; cross-checks with thick can)
can_dia_main       = 41.25;  // thick can diameter
can_dia_top        = 36.86;  // thin top section diameter
can_top_h          = 18.8;   // height of the thin top section
can_top_above_base = 72.25;  // FPR bottom face -> top of can
adjuster_extra_h   = 15.0;   // stud + jam nut above can top (total 87.25)
block_w            = 51.0;   // lower block width across the side-port faces
block_d            = 51.0;   // [approx] lower block depth fore-aft (gauge-port face to rear)
block_h            = 34.0;   // MEASURED: lower block height above FPR bottom; can starts here
port_axis_above_base = 13.0; // MEASURED: side ORB port centers above FPR bottom (gauge port assumed same)

// ---- FITTINGS (keep-out; [approx] — update to your actual hose ends) ----
side_fitting_dia   = 27;     // ORB-08 -> AN-8 adapter + hose-end wrench hex OD
side_fitting_len   = 40;     // stick-out per side incl. hose-end socket
return_fitting_dia = 22;     // ORB-06 -> AN-6 on the bottom return port
return_fitting_len = 45;     // drop below the FPR bottom face
gauge_stub_dia     = 16;     // 1/8" NPT gauge fitting on the FRONT face
gauge_stub_len     = 18;
vac_nipple_dia     = 8;      // vacuum/boost nipple, RIGHT side above the ORB port
vac_nipple_len     = 25;
vac_above_base     = 43.0;   // MEASURED: nipple center above FPR bottom (30mm above ORB center)

// ---- M5 HEAT-SET INSERTS (validated: fuse-insert-dia-test-3, battery tray) ----
insert_length      = 10.0;   // M5x10 insert
insert_pilot_dia   = 6.65;   // uniform melt-bore — seats clean/flush in ASA
insert_seat_clearance = 0.3; // extra depth so the insert sits flush
insert_pocket_floor   = 1.0; // material left behind the insert tip

// ---- CARRIER PAD ----
pad_t              = insert_length + insert_seat_clearance + insert_pocket_floor; // 11.3 validated slab
pad_w              = 72;     // spans the ears (52 c-c + margin around each hole)
pad_corner_r       = 8;      // top corner rounding
pad_top_margin     = 10;     // pad extends this far above the insert centers
fpr_base_above_flange = 10;  // FPR bottom face height above the flange TOP surface
                             // (raise to gain return-fitting ground clearance)

// ---- BASE FLANGE (interface to the future chassis assembly) ----
flange_depth       = 40;     // rearward extent (+Y)
flange_t           = 8;
flange_slot_w      = 6.5;    // M6 clearance slots
flange_slot_len    = 14;
flange_slot_spacing = 48;
flange_slot_y      = 24;     // slot centers rearward of the pad's back face
gusset_base        = 30;     // rearward reach along the flange
gusset_height      = 45;     // upward reach on the pad's back face
gusset_thickness   = 5;
gusset_shape       = "CURVED";
gusset_curve_segments = 48;

// ---- PREVIEW ----
show_ghost         = true;   // regulator + steel bracket keep-out (%-modifier, never exported)

// ---- DERIVED ----
insert_z  = flange_t + fpr_base_above_flange + ear_center_above_base; // insert/ear-hole centers
pad_h     = insert_z + pad_top_margin;                                // pad top (from Z=0)
fpr_base_z = flange_t + fpr_base_above_flange;                        // FPR bottom face height
hx        = ear_spacing / 2;

// =============================================================================
// MAIN ASSEMBLY
// =============================================================================
carrier();
if (show_ghost) %ghost_assembly();

module carrier() {
    difference() {
        union() {
            pad_body();
            base_flange();
            flange_gussets();
        }
        insert_bores();
        flange_slots();
    }
}

// =============================================================================
// CARRIER MODULES
// =============================================================================

module pad_body() {
    // Vertical slab, front face (mating plane) at Y=0, thickness rearward
    translate([0, pad_t, 0])
        rotate([90, 0, 0])
            linear_extrude(pad_t)
                rounded_top_rect_2d(pad_w, pad_h, pad_corner_r);
}

module rounded_top_rect_2d(w, h, r) {
    hull() {
        translate([-w/2, 0]) square([w, h - r]);
        translate([-w/2 + r, h - r]) circle(r=r, $fn=48);
        translate([ w/2 - r, h - r]) circle(r=r, $fn=48);
    }
}

module insert_bores() {
    // Horizontal 6.65mm melt-bores from the mating face (Y=0) rearward, one per
    // ear hole. Depth swallows the full insert + seat clearance, 1mm floor behind.
    depth = insert_length + insert_seat_clearance;
    for (sx = [-hx, hx])
        translate([sx, -1, insert_z])
            rotate([-90, 0, 0])
                cylinder(d=insert_pilot_dia, h=depth + 1, $fn=48);
}

module base_flange() {
    translate([-pad_w/2, pad_t, 0])
        cube([pad_w, flange_depth, flange_t]);
}

module flange_slots() {
    for (sx = [-flange_slot_spacing/2, flange_slot_spacing/2])
        translate([sx, pad_t + flange_slot_y, -1])
            slot_z(flange_slot_w, flange_slot_len, flange_t + 2);
}

module slot_z(w, len, h) {
    hull() {
        translate([0, -(len - w)/2, 0]) cylinder(d=w, h=h, $fn=32);
        translate([0,  (len - w)/2, 0]) cylinder(d=w, h=h, $fn=32);
    }
}

module flange_gussets() {
    // Curved gussets on the flange bracing the pad's back face, one per side edge.
    // rotate([90,0,90]): polygon +X -> world +Y, +Y -> world +Z, extrude -> +X.
    for (sx = [-pad_w/2, pad_w/2 - gusset_thickness])
        translate([sx, pad_t, flange_t])
            rotate([90, 0, 90])
                linear_extrude(gusset_thickness)
                    gusset_2d_shape(gusset_base, gusset_height);
}

module gusset_2d_shape(base, height) {
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
// GHOST (keep-out preview — regulator + steel bracket, measured dims)
// =============================================================================
module ghost_assembly() {
    bz = fpr_base_z;  // FPR bottom face
    translate([0, -axis_from_plane, 0]) {
        // lower ported block
        translate([-block_w/2, -block_d/2, bz])
            cube([block_w, block_d, block_h]);
        // main (thick) can
        translate([0, 0, bz + block_h])
            cylinder(d=can_dia_main, h=(can_top_above_base - can_top_h) - block_h, $fn=64);
        // thin top section
        translate([0, 0, bz + can_top_above_base - can_top_h])
            cylinder(d=can_dia_top, h=can_top_h, $fn=64);
        // adjuster stud + jam nut envelope
        translate([0, 0, bz + can_top_above_base])
            cylinder(d=14, h=adjuster_extra_h, $fn=32);
        // side port fittings (fuel inlets, left + right)
        for (sx = [-1, 1])
            translate([sx * block_w/2, 0, bz + port_axis_above_base])
                rotate([0, sx * 90, 0])
                    cylinder(d=side_fitting_dia, h=side_fitting_len, $fn=32);
        // bottom return fitting
        translate([0, 0, bz - return_fitting_len])
            cylinder(d=return_fitting_dia, h=return_fitting_len + 1, $fn=32);
        // gauge port stub (front face, -Y)
        translate([0, -block_d/2 - gauge_stub_len, bz + port_axis_above_base])
            rotate([-90, 0, 0])
                cylinder(d=gauge_stub_dia, h=gauge_stub_len + 1, $fn=32);
        // vacuum nipple (right side, above the right ORB port)
        translate([block_w/2, 0, bz + vac_above_base])
            rotate([0, 90, 0])
                cylinder(d=vac_nipple_dia, h=vac_nipple_len, $fn=24);
    }
    // steel bracket ear plate against the mating face
    ear_w = ear_spacing + 2 * 9;  // [approx] overall ear span
    translate([-ear_w/2, -bracket_steel_t, fpr_base_z + ear_center_above_base - 8])
        cube([ear_w, bracket_steel_t, (ear_top_above_base - ear_center_above_base) + 8]);
}
