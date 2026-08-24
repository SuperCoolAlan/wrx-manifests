// =============================================================================
// Heat-Set Insert — DIAMETER LADDER Test
// =============================================================================
// A flat bar with four M5 heat-set insert pockets at 6.1 / 6.2 / 6.3 / 6.4mm,
// each labeled. Melt an insert into each and find the SMALLEST bore that seats
// clean — flush, no mushrooming, and no plastic squeezed into the thread bore.
//
// Each pocket mirrors the real part geometry (fuse-platform-test.scad /
// battery-tray-mtx35.scad): a uniform blind bore 10.3mm deep (full 10mm insert +
// 0.3 seat clearance), a 1mm floor, and a 3mm center drain through the floor.
//
// PRINT IN ASA, flat on the bed, no supports. Same slicer profile you'll use for
// the real tray (line width / flow drive the final hole size as much as the model).
// =============================================================================

// ---- BORES UNDER TEST ----
hole_dias       = [6.1, 6.2, 6.3, 6.4];  // bore diameters to compare (mm)

// ---- INSERT POCKET GEOMETRY (matches the production parts) ----
insert_length         = 10.0;   // M5x10 heat-set insert length (mm)
insert_seat_clearance = 0.3;    // extra bore depth beyond insert length (mm)
insert_pocket_floor   = 1.0;    // solid floor left below the insert tip (mm)
insert_drain_dia      = 3.0;    // center drain through the floor (mm); 0 = none

// ---- COUPON ----
slab_thickness  = 11.3;   // = 10.3 pocket + 1mm floor (full capture, flat print)
hole_spacing    = 14;     // hole center-to-center along X (mm) — ~7.6mm wall between bores
edge_margin     = 8;      // hole center to slab end along X (mm)
front_wall      = 4;      // material between the front face (labels engraved here) and the bore (mm)
back_margin     = 3;      // plastic behind each bore (mm)
edge_round_r    = 2;      // radius rounding the top + vertical edges (mm); bottom stays flat for printing. 0 = sharp.

// ---- LABELS ----
label_size      = 6;      // text height (mm)
label_depth     = 0.8;    // engrave depth / emboss height (mm)
label_emboss    = false;  // false = engraved (recessed), true = raised
label_font      = "Liberation Sans:style=Bold";

// ---- DERIVED ----
n            = len(hole_dias);
slab_l       = 2*edge_margin + (n - 1) * hole_spacing;
max_dia      = max(hole_dias);
hole_y       = front_wall + max_dia/2;             // bore set back from the labeled front face
slab_w       = hole_y + max_dia/2 + back_margin;   // back edge just behind the bores
label_z      = slab_thickness / 2;                 // labels centered on the front face height
pocket_depth = insert_length + insert_seat_clearance;   // 10.3
pocket_bot_z = slab_thickness - pocket_depth;           // 1.0 (floor top)

// =============================================================================
// ASSEMBLY
// =============================================================================
difference() {
    union() {
        coupon_slab();
        if (label_emboss) labels();
    }
    bores();
    if (!label_emboss) labels();
}

// =============================================================================
// MODULES
// =============================================================================
module coupon_slab() {
    // Flat bar with rounded top + vertical edges (bottom stays flat for printing).
    // Built via minkowski on an inset core, clipped to the original bounds so the
    // minkowski overhang on the underside is cut away.
    r = edge_round_r;
    if (r > 0) {
        intersection() {
            cube([slab_l, slab_w, slab_thickness]);
            minkowski() {
                translate([r, r, 0])
                    cube([slab_l - 2*r, slab_w - 2*r, slab_thickness - r]);
                sphere(r = r, $fn = 24);
            }
        }
    } else {
        cube([slab_l, slab_w, slab_thickness]);
    }
}

module bores() {
    for (i = [0 : n - 1]) {
        hx = edge_margin + i * hole_spacing;
        d  = hole_dias[i];
        // Uniform blind melt-bore from the top face
        translate([hx, hole_y, pocket_bot_z])
            cylinder(d = d, h = pocket_depth + 1, $fn = 48);
        // Center drain through the floor to the underside
        if (insert_drain_dia > 0)
            translate([hx, hole_y, -1])
                cylinder(d = insert_drain_dia, h = pocket_bot_z + 1 + 0.5, $fn = 32);
    }
}

module labels() {
    // Labels on the FRONT vertical face (Y=0), one below each bore. Putting them on
    // the wall instead of the top lets the bar be much shallower. +Y is into the bar.
    //   engrave: poke from just outside (-0.5) to label_depth inside, then subtract.
    //   emboss:  stand proud of the face by label_depth (-Y), then union.
    for (i = [0 : n - 1]) {
        hx   = edge_margin + i * hole_spacing;
        lbl  = str(".", round((hole_dias[i] - floor(hole_dias[i])) * 10));  // ".1".."(.4)"
        y0   = label_emboss ? 0 : label_depth;
        extr = label_emboss ? label_depth : (label_depth + 0.5);
        translate([hx, y0, label_z])
            rotate([90, 0, 0])      // text front faces -Y -> reads correctly from the front
                linear_extrude(extr)
                    text(lbl, size = label_size,
                         halign = "center", valign = "center", font = label_font);
    }
}

// =============================================================================
// CONSOLE NOTES
// =============================================================================
echo("============================================");
echo("HEAT-SET INSERT DIAMETER LADDER");
echo(str("Coupon: ", slab_l, " x ", slab_w, " x ", slab_thickness, " mm"));
echo(str("Bores: ", hole_dias, " mm  (", pocket_depth,
         "mm deep, ", insert_pocket_floor, "mm floor, ", insert_drain_dia, "mm drain)"));
echo("PRINT IN ASA, flat, no supports. Use your real tray slicer profile.");
echo("============================================");
