// =============================================================================
// Driver-Side Bracket — FPR + Flex Fuel Sensor, WRX strut-pillar mount
// =============================================================================
// One ASA panel in the space freed by deleting the 2005 WRX washer bottle. Bolts
// to the two forward-facing holes on the driver strut pillar (80mm c-c, standing
// ~17mm proud of the wall; the LEFT one is shared with the fuse box). Carries:
//   - Aeromotive A1000 Gen II FPR on its stock steel bracket (ears 52.0mm c-c)
//   - Continental flex fuel sensor in the Thingiverse 2965407 cradle (46.0 c-c)
//
// The sensor envelope is NOT redrawn here. It is `use`d straight out of
// flex-fuel-assembly.scad so the two files can never drift apart — every sensor
// dimension lives in that file and only that file.
//
// FRAME: X along the pillar wall, X=0 at the RIGHT chassis hole, +X toward the
//        LEFT (the deep end). Z vertical, Z=0 on the chassis hole centreline.
//        Y=0 is the PILLAR WALL; the panel's rear face lies on it, +Y forward.
//
// The sensor is NOT flow-directional — either port can be the inlet, so the two
// hose runs are free to take whichever routing is geometrically cleaner.
//
// VAPOUR-LOCK RULE (drives the whole layout): the sensor's fuel passage runs
// parallel to its two cradle bolt holes. That line must never sit horizontal or
// the passage becomes a vapour trap, so `ffs_rot` is constrained — see the
// assert below. 0 = passage vertical, ±45 = passage at 45°.
//
// !!! [MEASURE] items are unverified — check at the car before printing. !!!
// =============================================================================

use <../Flex Fuel Sensor Bracket - 2965407/flex-fuel-assembly.scad>

ffs_stl = "../Flex Fuel Sensor Bracket - 2965407/files/Continental_Flex_Fuel_Bracket.stl";

// ---- VIEW -----------------------------------------------------------------
show_ghost = true;   // FPR + cradle + sensor keep-out (%-modifier, never exported)
// Clash checks. Render with check=N and read the console: "top level object is
// empty" means that pair is clear. Anything else is an interference volume.
//   1 bracket^FPR   2 bracket^sensor   3 FPR^sensor   4 mount^FPR   5 mount^sensor
//   6 return fitting ^ sensor — this one SHOULD intersect: it is the hose joint.
//   7 FPR^fusebox   8 sensor^fusebox — the v1 fitment failure, now guarded.
check = 0;

// ---- CHASSIS INTERFACE (MEASURED) -----------------------------------------
chassis_hole_spacing = 80.0;  // c-c of the two pillar holes
chassis_hole_d       = 8.5;   // [MEASURE] bolt not yet sized — 8.5 = M8 clearance
chassis_hole_slot    = 3.0;   // slop per hole across the axis, absorbs c-c error
chassis_standoff     = 17.0;  // bolt seat this far forward of the pillar wall
chassis_hole_tilt    = 20.0;  // bolt axis rises this far above horizontal, nose
                              // forward. v1 test fit: 30 was ~10 deg too steep.
// Fuse box: shares the RIGHT chassis mount, cannot move. The panel may slip
// BEHIND it, but nothing mounted on the panel front may enter this volume.
// All four faces are eyeballed from the v1 fitment photos — [MEASURE] them.
fusebox_x_left  = -20.0;  // [MEASURE] left face of the box, bracket X
fusebox_x_right = -150.0; // far side, past the panel — exact value irrelevant
fusebox_y0      = 30.0;   // [MEASURE] box rear face stands well off the pillar wall
                          // (v1 photo 004): the panel + parts can tuck in behind it
fusebox_y1      = 120.0;  // forward extent
fusebox_z_top   = -25.0;  // [MEASURE] top of the box body
fusebox_z_bot   = -165.0; // bottom
// L-shaped relief at the box's near top corner (v1 photo 004) — the closest
// corner to the bracket is stepped, so the keep-out gives that bite back.
fusebox_notch_dx  = 25.0; // [MEASURE] bite into the box from its left face
fusebox_notch_dz  = 30.0; // [MEASURE] bite down from the box top
fusebox_notch_len = 50.0; // ~2" per Alan, rearmost part of the box

tower_boss_w         = 26.0;  // [MEASURE] boss width along X
tower_boss_h         = 18.0;  // [MEASURE] boss height across the bolt axis
tower_boss_r         = 3.0;
tower_boss_clear     = 3.0;   // air around each boss where the body wraps past it
                              // (raised from 1.5 — the tabs are eyeballed [MEASURE])

// ---- MOUNT SHROUD ---------------------------------------------------------
// v3: the FPR no longer rises between the mounts, so the two skinny v1 arms
// became one full-width triangulated SHROUD: a continuous seat bar across both
// bosses, hulled down to the panel's top edge. Shaped to mostly CLEAR the
// sensor (the bar rides above the cradle's snap hook); where the hook still
// pokes the ramp face, ffs_clearance_cut() punches its small window.
mount_pad_t      = 6.0;   // seat bar thickness along the bolt axis
mount_pad_w      = 28.0;  // bar reach beyond the bolt pair along X (14 per side)
mount_pad_h      = 28.0;  // bar height across the axis, in the tilted plane
mount_pad_top    = 9.0;   // bar reach ABOVE the bolt axis. A full 14 hooks back
                          // over the boss top (v1 test fit); 9 is washer seat only.
                          // NB mount-frame local -y is global UP.
shroud_root_h    = 6.0;   // how deep the shroud bites the panel's top edge
shroud_fillet_r  = 6.0;   // cove radius where the shroud's underside meets the
                          // panel face — kills the stress riser at that corner

// ---- PANEL OUTLINE --------------------------------------------------------
panel_right_x   = -28.5;  // RIGHT edge. HARD LIMIT — something else lives there.
panel_left_meas = 108.5;  // LEFT edge as originally measured (137mm total)
panel_left_ext  = -5.5;   // left edge pulled IN to the FPR left ear hole + washer
                          // seat (95 + 8): no material further left than the FPR
                          // mounting holes (2026-08-26).
drop_left       = 170.0;  // panel depth below Z=0 at panel_left_meas
drop_right      = 119.3;  // ... and at panel_right_x. Was 132: v1 fitment had the
                          // bottom-right corner bumping the chassis, pulled up 1/2".
drop_ext        = 170.0;  // [MEASURE] depth out in the extension. Held flat at
                          // drop_left because nothing out there is measured yet.
bottom_bulge    = 10.0;   // bottom edge rises this far above the chord at midspan
bottom_segments = 60;
panel_top_z     = -22.0;  // top edge — stops below the tower bosses
// Bottom-LEFT corner relief: the harness bundle to the DWF110 filter passes
// this corner (v1 fitment photos). Chamfer it and give the bundle two shared
// zip-tie holes just inboard of the new edge.
bl_tuck_up      = 32.0;   // chamfer leg up the left edge
bl_tuck_in      = 20.0;   // chamfer leg in along the bottom edge
// Tie SLOTS, battery-tray convention (tie_slot_*): 3mm bridged span, 10mm long,
// one pair — out one slot, round the bundle riding the chamfer, back in the other.
bl_tie_slots    = [[90.8, -144.3], [79.0, -136.7]];  // pair flanking the bundle
bl_slot_dir     = [-0.543, -0.840];  // slot long axis, parallel to the chamfer
bl_tie_slot_w   = 3.0;
bl_tie_slot_l   = 10.0;
corner_r        = 8.0;
panel_t         = 8.0;    // 8 leaves a 5.1mm floor under an M5 nut pocket

panel_left_x = panel_left_meas + panel_left_ext;

// ---- M5 HARDWARE (battery-tray "BOLT" convention) -------------------------
mount_mode        = "BOLT";  // "BOLT" = M5 screw + hex nut in a rear pocket
                             // "INSERT" = M5x10 heat-set melt-bore from the front
bolt_clear_dia    = 5.5;
nut_af            = 8.0;
nut_pocket_af     = 8.2;     // +0.2 light press so the nut stays put
nut_thickness     = 4.7;
nut_pocket_relief = 1.5;     // spare thread depth past the nut
insert_length         = 10.0;
insert_pilot_dia      = 6.65;  // validated melt-bore (fuse-insert-dia-test-3)
insert_seat_clearance = 0.3;

// ---- FPR INTERFACE (measured 2026-07-25, see fpr-bracket/) ----------------
fpr_ear_spacing = 52.0;
fpr_ear_hole_d  = 5.5;
fpr_x           = 69.0;   // [MEASURE] moved DOWN-LEFT per v1 fitment (2026-08-26):
fpr_ear_z       = -98.0;  // at the drawn top-centre spot the RIGHT side fitting hit
                          // the fuse box. Staged position: left ear hole just above
                          // and slightly right of the old leftmost cradle hole
                          // (~100, -108). Refine both at the car.
fpr_ear_center_above_base = 47.0;

// ---- FLEX FUEL CRADLE PLACEMENT -------------------------------------------
// The cradle is positioned by its own STL origin, then rotated in the panel
// plane. Cradle-local axes: u = long axis, v = out of the mounting face,
// w = across (the bolt-hole line AND the fuel passage).
ffs_ox  =  30.7;  // cradle-local origin, bracket X
ffs_oz  = -88.0;  // cradle-local origin, bracket Z
ffs_rot = 116.0;  // 2026-08-26 relayout: sensor RIGHT of the low-mounted FPR,
                  // flipped 180 from v1 so the connector exits bottom-right,
                  // FPR return drops into the lower port, fuel exits the top
                  // port up toward the firewall return line.
ffs_hole_d = 6.5; // cradle ear holes (M5 rattles 1mm — washer under the head)

// Vapour-lock guard — OUR margin, not a spec. AEM's manual for this same
// Continental sensor (10-220X, p.5) allows ANY orientation; the angled-passage
// preference is forum wisdom about bubbles/debris sitting in the annulus on a
// return line. 30 is free to keep, and soft if a layout ever truly needs less.
ffs_passage_deg = abs(90 - (abs(ffs_rot) % 180));  // valid over the full circle
// Floor relaxed 30 -> 25 (Alan, 2026-08-26) after confirming AEM permits any
// orientation; keeping a guard at all is still our bubble-sweep preference.
assert(ffs_passage_deg >= 25,
       "ffs_rot puts the fuel passage too close to horizontal — vapour trap");

// ---- FPR GHOST ENVELOPE (measured; [approx] = keep-out only) --------------
axis_from_plane      = 27.0;  // body centreline forward of the ear mating plane
can_dia_main         = 41.25;
can_dia_top          = 36.86;
can_top_h            = 18.8;
can_top_above_base   = 72.25;
adjuster_extra_h     = 15.0;
block_w              = 51.0;
block_d              = 51.0;  // [approx]
block_h              = 34.0;
port_axis_above_base = 13.0;
// Hose ends as actually chosen — angled fittings, not straight stubs. Each is
// modelled as a cylinder leaving the port face along its own axis, so the angle
// is what pulls the hose out of the sensor's way. [MEASURE] every reach.
side_fitting_dia     = 27;    // [approx] across the hose-end socket
// LEFT (+X): 30 deg fitting, hose angles UP and outboard, away from the sensor.
side_fitting_len_l   = 45;    // [MEASURE] reach from port face along the fitting
side_fitting_ang_l   = 30;    // degrees above horizontal
// RIGHT (-X): 180 deg hose end — the line from the engine doubles straight back.
// Reach is the crown of the U, and the returning leg is offset by roughly one
// hose diameter, so the envelope is a flattened U not a single stub.
side_fitting_len_r   = 55;    // [MEASURE] how far the crown of the 180 reaches out
side_fitting_off_r   = 30;    // [MEASURE] centre-to-centre of the two legs
                              // The U loops 45 deg DOWN-AND-FORWARD: straight
                              // forward is blocked by the pressure sender on the
                              // FPR's front NPT port, and the lane against the
                              // panel stays free for the sensor return line.
// BOTTOM: acute bend a bit past 90, pointing the return line up and REARWARD
// toward the firewall. Measured from straight-down, so 110 swings it up and -Y.
return_fitting_dia   = 22;
return_fitting_drop  = 30;    // [MEASURE] straight out the bottom before the sweep
return_fitting_mid   = 14;    // [MEASURE] mid-sweep segment — the long lazy curve
return_fitting_len   = 35;    // [MEASURE] exit leg past the bend
return_fitting_ang   = 120;   // swept 120 hose end (like the right port's 180):
                              // straight down, then the tube curves to exit
                              // up-and-RIGHT toward the sensor's inlet, 30 above
                              // level — the short side of the U.
return_fitting_clock = 30;   // sweep-plane clock about the port axis: 0 = exit
                              // in the panel plane toward the sensor; positive
                              // swings the run toward the WALL, ducking behind
                              // the 180's forward-looped legs on its way over.
gauge_stub_dia       = 22;    // [MEASURE] electronic fuel pressure sender body
gauge_stub_len       = 65;    // [MEASURE] LowDoller sender + connector off the
                              // front NPT port — this is why the 180 U clocks 45.
vac_nipple_dia       = 8;
vac_nipple_len       = 25;
vac_above_base       = 43.0;
bracket_steel_t      = 2.0;   // [approx]

// ---- DERIVED --------------------------------------------------------------
cx0 = 0;
cx1 = chassis_hole_spacing;
boss_axis_len = chassis_standoff / cos(chassis_hole_tilt);

fpr_hx     = fpr_ear_spacing / 2;
fpr_base_z = fpr_ear_z - fpr_ear_center_above_base;
fpr_pts    = [[fpr_x - fpr_hx, fpr_ear_z], [fpr_x + fpr_hx, fpr_ear_z]];

// Cradle hole centres, mapped out of the STL frame into the panel.
// (STL-local: both holes at u=34.05, w=+39.0 / -7.0 — read off the mesh.)
function ffs_map(u, w) = [ffs_ox + u*cos(ffs_rot) - w*sin(ffs_rot),
                          ffs_oz + u*sin(ffs_rot) + w*cos(ffs_rot)];
ffs_stl_hole_u = 34.05;
ffs_pts = [ffs_map(ffs_stl_hole_u, 39.0), ffs_map(ffs_stl_hole_u, -7.0)];

// =============================================================================
// MAIN
// =============================================================================

if (check == 0) {
    bracket();
    if (show_ghost) %ghosts();
} else if (check == 1) intersection() { bracket(); fpr_solid(); }
else if (check == 2)   intersection() { bracket(); ffs_solid(); }
else if (check == 3)   intersection() { fpr_solid(show_return = false); ffs_solid(); }
else if (check == 4)   intersection() { mount_solid(); fpr_solid(); }
else if (check == 5)   intersection() { mount_solid(); ffs_solid(); }
else if (check == 6)   intersection() { fpr_return_fitting(); ffs_solid(); }
else if (check == 7)   intersection() { fpr_solid(); fusebox_ghost(); }
else if (check == 8)   intersection() { ffs_solid(); fusebox_ghost(); }

module bracket() {
    difference() {
        union() { panel(); chassis_bosses(); }
        chassis_holes();
        tower_boss_clearance();
        // render() pre-evaluates the 6-copy STL cut through CGAL: without it
        // the preview CSG normalizer gives up ("empty tree" warning, blank F5).
        // First preview after edit pays a few seconds, then it is cached.
        render(convexity = 6) ffs_clearance_cut();
        for (p = fpr_pts) m5_mount(p[0], p[1]);
        for (p = ffs_pts) m5_mount(p[0], p[1], clear_d = ffs_hole_d);
        for (c = bl_tie_slots)
            hull() for (e = [-1, 1] * (bl_tie_slot_l - bl_tie_slot_w)/2)
                translate([c[0] + e*bl_slot_dir[0], -1, c[1] + e*bl_slot_dir[1]])
                    rotate([-90, 0, 0])
                        cylinder(d = bl_tie_slot_w, h = panel_t + 2, $fn = 24);
    }
}

// The flex cradle + sensor, dilated ~1.5mm, CUT from the printed body: struts
// may bind wherever they like and the sensor's space is simply molded out.
// No -Y offset — the panel behind the cradle back must stay solid to bolt to.
ffs_cut_clear = 3.0;
module ffs_clearance_cut() {
    // dy 0.02 on the in-plane copies: keeps their back faces off the panel
    // front so the difference has no coplanar-face artifacts.
    c = ffs_cut_clear; d = c * 0.707;
    for (o = [[0,0.02,0], [-c,0.02,0], [c,0.02,0], [0,0.02,-c], [0,0.02,c],
              [-d,0.02,-d], [d,0.02,-d], [-d,0.02,d], [d,0.02,d], [0,c,0]])
        translate(o) ffs_solid();
}

// =============================================================================
// PANEL
// =============================================================================

module panel() {
    translate([0, panel_t, 0]) rotate([90, 0, 0])
        linear_extrude(panel_t)
            offset(r = corner_r) offset(r = -corner_r) panel_2d();
}

module panel_2d() {
    difference() {
        polygon(concat([[panel_right_x, panel_top_z], [panel_left_x, panel_top_z]],
                       bottom_edge_pts()));
        // bottom-left corner chamfer for the filter-side cable bundle
        blz = bottom_z(panel_left_x);
        polygon([[panel_left_x + 2, blz + bl_tuck_up],
                 [panel_left_x + 2, blz - 2],
                 [panel_left_x - bl_tuck_in, blz - 2]]);
    }
}

// Bottom edge, walking left (+X) -> right (-X) to keep the winding consistent.
// Past panel_left_meas the profile is held flat at drop_ext — nothing out in the
// extension has been measured, so it does not get to pretend it is deeper.
function bottom_z(x) =
    x > panel_left_meas ? -drop_ext
  : let (t     = (panel_left_meas - x) / (panel_left_meas - panel_right_x),
         chord = -drop_left + t * (drop_left - drop_right),
         arch  = bottom_bulge * 4 * t * (1 - t))
    chord + arch;

function bottom_edge_pts() = [
    for (i = [0 : bottom_segments])
        let (x = panel_left_x + (i / bottom_segments) * (panel_right_x - panel_left_x))
        [x, bottom_z(x)]
];

// =============================================================================
// CHASSIS INTERFACE
// =============================================================================

// Local frame on the bolt axis: origin on the hole centreline at the seat plane,
// local +Z along the bolt axis (forward and up), local +X still along the wall.
module mount_frame() {
    translate([0, chassis_standoff, 0])
        rotate([chassis_hole_tilt - 90, 0, 0]) children();
}

module chassis_bosses() { shroud(); shroud_fillet(); }

// Concave cove along the shroud/panel joint. Cross-section built in the Y-Z
// plane: quad corner->T1->C->T2 minus the circle at C leaves the fillet, with
// C placed on the corner bisector so the arc lands tangent on both faces.
module shroud_fillet() {
    r  = shroud_fillet_r;
    cy = panel_t;                      // the corner: panel front face...
    cz = panel_top_z - shroud_root_h;  // ...at the root strip's bottom edge
    by = chassis_standoff + (mount_pad_h/2)*sin(chassis_hole_tilt)
         + mount_pad_t*cos(chassis_hole_tilt);
    bz = -(mount_pad_h/2)*cos(chassis_hole_tilt) + mount_pad_t*sin(chassis_hole_tilt);
    rd  = [by - cy, bz - cz];
    rn  = rd / norm(rd);               // up the ramp underside
    bis = [rn[0], rn[1] - 1];          // + straight down the panel face
    bn  = bis / norm(bis);
    d   = r / bn[0];                   // bn[0] = sin(half corner angle)
    C   = [cy + d*bn[0], cz + d*bn[1]];
    T2  = [cy, cz] + rn * ((C[0]-cy)*rn[0] + (C[1]-cz)*rn[1]);
    x0  = cx0 - mount_pad_w/2 - 4;
    w   = chassis_hole_spacing + mount_pad_w + 8;
    translate([x0, 0, 0]) rotate([90, 0, 90])
        linear_extrude(w)
            difference() {
                polygon([[cy, cz], [cy, C[1]], C, T2]);
                translate(C) circle(r = r, $fn = 64);
            }
}

module shroud() {
    hull() {
        // one continuous seat bar across both bosses, in the tilted seat plane
        mount_frame() translate([(cx0 + cx1)/2, 0, 0])
            linear_extrude(mount_pad_t)
                offset(r = 5) offset(r = -5)
                    translate([-(chassis_hole_spacing + mount_pad_w)/2, -mount_pad_top])
                        square([chassis_hole_spacing + mount_pad_w,
                                mount_pad_top + mount_pad_h/2]);
        // full-width root strip biting the panel's top edge
        translate([cx0 - mount_pad_w/2 - 4, 0, panel_top_z - shroud_root_h])
            cube([chassis_hole_spacing + mount_pad_w + 8, panel_t, shroud_root_h]);
    }
}

// Just the hook, for the clash checks — the panel is not in the way of the FPR.
module mount_solid() { chassis_bosses(); }

module chassis_holes() {
    for (cx = [cx0, cx1])
        mount_frame() translate([cx, 0, -1])
            hull() for (dx = [-chassis_hole_slot/2, chassis_hole_slot/2])
                translate([dx, 0, 0])
                    cylinder(d = chassis_hole_d, h = mount_pad_t + 2, $fn = 48);
}

module boss_section_2d(grow = 0) {
    offset(r = tower_boss_r + grow) offset(r = -tower_boss_r)
        square([tower_boss_w, tower_boss_h], center = true);
}

// The bosses are the car, not the print. Nothing printed may occupy this volume
// or the pads will never touch their seats.
module tower_boss_clearance() {
    for (cx = [cx0, cx1])
        mount_frame() translate([cx, 0, -boss_axis_len - 10])
            linear_extrude(boss_axis_len + 10) boss_section_2d(tower_boss_clear);
}

module tower_boss_ghost() {
    for (cx = [cx0, cx1])
        mount_frame() translate([cx, 0, -boss_axis_len])
            linear_extrude(boss_axis_len) boss_section_2d();
}

// =============================================================================
// M5 MOUNT — through-hole + rear nut pocket, or front melt-bore
// =============================================================================

module m5_mount(x, z, clear_d = bolt_clear_dia) {
    if (mount_mode == "INSERT") {
        translate([x, panel_t + 1, z]) rotate([90, 0, 0])
            cylinder(d = insert_pilot_dia,
                     h = insert_length + insert_seat_clearance + 1, $fn = 48);
    } else {
        translate([x, -1, z]) rotate([-90, 0, 0])
            cylinder(d = clear_d, h = panel_t + 2, $fn = 32);
        // Bolt tension pulls the nut onto the pocket floor, so the extra depth
        // past the nut is thread relief — do not remove it.
        translate([x, nut_thickness + nut_pocket_relief, z]) rotate([90, 0, 0])
            cylinder(d = nut_pocket_af / cos(30),
                     h = nut_thickness + nut_pocket_relief, $fn = 6);
    }
}

// =============================================================================
// GHOSTS / KEEP-OUTS
// =============================================================================

module ghosts() { tower_boss_ghost(); fpr_solid(); ffs_solid(); fusebox_ghost(); }

module fusebox_ghost() {
    difference() {
        translate([fusebox_x_right, fusebox_y0, fusebox_z_bot])
            cube([fusebox_x_left - fusebox_x_right,
                  fusebox_y1 - fusebox_y0,
                  fusebox_z_top - fusebox_z_bot]);
        translate([fusebox_x_left - fusebox_notch_dx, fusebox_y0 - 1,
                   fusebox_z_top - fusebox_notch_dz])
            cube([fusebox_notch_dx + 1, fusebox_notch_len + 1,
                  fusebox_notch_dz + 1]);
    }
}

// Cradle + sensor + hose stubs, placed as a unit. The cradle's own back face is
// at its local y=0, so it lands flush on the panel's front face. rotate([0,-r,0])
// spins it in the panel plane: X = u*cos r - w*sin r, Z = u*sin r + w*cos r.
module ffs_solid() {
    translate([ffs_ox, panel_t, ffs_oz]) rotate([0, -ffs_rot, 0]) {
        import(ffs_stl, convexity = 8);
        sensor();       // from flex-fuel-assembly.scad — single source of truth
        hose_stubs(sides = [-1]);  // upper port: straight run up to the firewall
        // lower RIGHT port = INLET: 90 hose end, leg toward the sensor's loop
        // end, which in this 135-rotated install aims down-left at the FPR return.
        hose_stub_90(1, 12.5);  // tipped back toward the panel to meet it
    }
}

// ORB-06 return, aimed down and outboard at the sensor's inlet. Broken out so the
// clash check can exclude it — it is MEANT to meet the sensor, that is the joint.
module fpr_return_fitting() {
    translate([fpr_x, panel_t + axis_from_plane, fpr_base_z]) {
        // straight out the bottom port
        translate([0, 0, -return_fitting_drop - 1])
            cylinder(d = return_fitting_dia, h = return_fitting_drop + 1, $fn = 32);
        // swept bend + exit leg, clocked about the port axis
        // two-stage sweep (drawn for ang = 120): down -> 30-below-level ->
        // 30-above-level, so the curve reads long and lazy like the real part
        rotate([0, 0, return_fitting_clock]) translate([0, 0, -return_fitting_drop]) {
            sphere(d = return_fitting_dia, $fn = 32);
            rotate([0, -120, 0])
                cylinder(d = return_fitting_dia, h = return_fitting_mid, $fn = 32);
            translate(return_fitting_mid * [-sin(60), 0, -cos(60)]) {
                sphere(d = return_fitting_dia, $fn = 32);
                rotate([0, -(return_fitting_ang - 60), 0])
                    cylinder(d = return_fitting_dia, h = return_fitting_len, $fn = 32);
            }
        }
    }
}

module fpr_solid(show_return = true) {
    if (show_return) fpr_return_fitting();
    bz = fpr_base_z;
    ear_w = fpr_ear_spacing + 2 * 9;  // [approx] overall ear span
    translate([fpr_x - ear_w/2, panel_t, fpr_ear_z - 8])
        cube([ear_w, bracket_steel_t, 16]);
    translate([fpr_x, panel_t + axis_from_plane, 0]) {
        translate([-block_w/2, -block_d/2, bz]) cube([block_w, block_d, block_h]);
        translate([0, 0, bz + block_h])
            cylinder(d = can_dia_main,
                     h = (can_top_above_base - can_top_h) - block_h, $fn = 64);
        translate([0, 0, bz + can_top_above_base - can_top_h])
            cylinder(d = can_dia_top, h = can_top_h, $fn = 64);
        translate([0, 0, bz + can_top_above_base])
            cylinder(d = 14, h = adjuster_extra_h, $fn = 32);
        // LEFT (+X) ORB-08: 30 deg hose end, angling up and outboard.
        translate([block_w/2, 0, bz + port_axis_above_base])
            rotate([0, 90 - side_fitting_ang_l, 0])
                cylinder(d = side_fitting_dia, h = side_fitting_len_l, $fn = 32);
        // RIGHT (-X) ORB-08: 180 deg hose end. Two legs plus the crown joining
        // them — the line from the engine turns straight back on itself here.
        translate([-block_w/2, 0, bz + port_axis_above_base]) {
            u_off = side_fitting_off_r * [0, cos(45), -sin(45)];
            rotate([0, -90, 0])
                cylinder(d = side_fitting_dia, h = side_fitting_len_r, $fn = 32);
            translate(u_off) rotate([0, -90, 0])
                cylinder(d = side_fitting_dia, h = side_fitting_len_r, $fn = 32);
            hull() for (o = [[0,0,0], u_off])
                translate([-side_fitting_len_r, 0, 0] + o)
                    sphere(d = side_fitting_dia, $fn = 24);
        }
        translate([0, block_d/2 + gauge_stub_len, bz + port_axis_above_base])
            rotate([90, 0, 0]) cylinder(d = gauge_stub_dia, h = gauge_stub_len + 1, $fn = 32);
        // MAP reference nipple exits the RIGHT side of the body (fixed 2026-08-26).
        translate([-block_w/2, 0, bz + vac_above_base]) rotate([0, -90, 0])
            cylinder(d = vac_nipple_dia, h = vac_nipple_len, $fn = 24);
    }
}
