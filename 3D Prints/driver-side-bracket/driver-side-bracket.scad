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
// The sensor's fuel passage runs parallel to its two cradle bolt holes.
// ffs_rot: 0 = passage vertical, ±45 = passage at 45°. (The old vapour-trap
// assert is gone — AEM permits any orientation.)
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
chassis_hole_tilt    = 14.0;  // bolt axis rises this far above horizontal, nose
                              // forward. Too shallow and the panel's lower half
                              // kicks off the pillar wall (v5 fit, photo _008).
stud_lift            = 5.0;   // chassis anchors (holes, boss pockets, keep-outs)
                              // raised this far in the BODY frame — i.e. the
                              // whole bracket hangs this much lower on the car.
                              // mount_pad_top MUST track this (9 + stud_lift) or
                              // the holes lose their 9mm margin to the bar's top.
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
tower_boss_clear     = 6.0;   // air around each boss where the body wraps past it
                              // (raised from 1.5 — the tabs are eyeballed [MEASURE])
boss_clear_extra_r   = 3.0;   // RIGHT boss only: extra radial air — the real
                              // brace there runs larger than the placeholder
                              // (v4: was bumping the shroud behind the square)
boss_clear_inner_l   = 4;   // LEFT boss, INNER (-X) face only: air here is
                              // independent of tower_boss_clear, so the web
                              // between the two squares thickens without
                              // touching the pocket's top/bottom clearance.
boss_pocket_fillet_r = 2.0;   // cove where the pocket mouth meets the pad
                              // underside. That lip is a sharp 270-deg corner in
                              // the bolt load path; this rounds it. Costs exactly
                              // this much side clearance AT the seat plane (full
                              // clearance is back one radius down), so it must
                              // stay below the smallest clear value above.
boss_clear_inner_r   = 6.0;   // RIGHT boss, INNER (+X) face only. Split out to
                              // match the left, but left AT the all-round value
                              // (tower_boss_clear + boss_clear_extra_r) — this
                              // pocket's side clearance measured correct.

// ---- MOUNT SHROUD ---------------------------------------------------------
// v3: the FPR no longer rises between the mounts, so the two skinny v1 arms
// became one full-width triangulated SHROUD: a continuous seat bar across both
// bosses, hulled down to the panel's top edge. Shaped to mostly CLEAR the
// sensor (the bar rides above the cradle's snap hook); where the hook still
// pokes the ramp face, ffs_clearance_cut() punches its small window.
mount_pad_t      = 6.0;   // seat bar thickness along the bolt axis
mount_pad_w      = 24.0;  // bar reach beyond the bolt pair along X (12 per side)
                          // — ends INSIDE the boss pocket swath, so nothing
                          // rises outboard of the mounting squares (v3 fitment:
                          // the old rounded tips crowded the wider real bosses)
mount_pad_h      = 28.0;  // bar height across the axis, in the tilted plane
mount_pad_top    = 16.0;  // bar reach ABOVE the bolt axis (9 + stud_lift: the
                          // squares grew so the raised holes keep 9mm margin).
                          // 9 is washer seat only; more hooks back over the boss top.
                          // NB mount-frame local -y is global UP.
shroud_root_h    = 6.0;   // how deep the shroud bites the panel's top edge
arm_bite_extra_l = 16.0;  // LEFT arm: extra bite down the panel face — its
                          // foot spreads into a buttress (v4 bulk-up)
arm_bite_extra_r = 29.0;  // RIGHT arm: buttress landing at the same Z-57 as
                          // the left (its root starts at the full-height edge,
                          // so it needs the deeper bite to reach)
arm_l_overlap    = 9.0;   // LEFT arm widened past the top-edge step, under the
                          // right arm, closing the seam against the sensor
                          // backing — ffs_clearance_cut manages the merge
shroud_fillet_r  = 6.0;   // cove radius where the shroud's underside meets the
                          // panel face — kills the stress riser at that corner

// ---- PANEL OUTLINE --------------------------------------------------------
panel_right_x   = -16.0;  // RIGHT edge, pulled in from -28.5 (v4): nothing
                          // mounts there and the plate crowded the fuse box.
                          // Still 4mm past the seat bar's right end at -12.
panel_left_meas = 108.5;  // LEFT edge as originally measured (137mm total)
panel_left_ext  = -5.5;   // left edge pulled IN to the FPR left ear hole + washer
                          // seat (95 + 8): no material further left than the FPR
                          // mounting holes (2026-08-26).
drop_left       = 165.0;  // panel depth below Z=0 at panel_left_meas
drop_right      = 119.3;  // ... and at panel_right_x. Was 132: v1 fitment had the
                          // bottom-right corner bumping the chassis, pulled up 1/2".
drop_ext        = 165.0;  // [MEASURE] depth out in the extension. Held flat at
                          // drop_left because nothing out there is measured yet.
bottom_bulge    = 10.0;   // bottom edge rises this far above the chord at midspan
bottom_segments = 60;
panel_top_z     = -22.0;  // top edge — stops below the tower bosses
// Top-LEFT corner dropped: the LEFT chassis brace bumped the panel's flat top
// near that corner (v3 fitment 2026-08-28). Step spans from the left edge in.
panel_tl_drop_z = 13.0;   // how far below panel_top_z the corner sits
panel_tl_drop_x = 65.0;   // step location — corner is lowered left of this X
// Same on the RIGHT: the bare panel tongue outboard of the shroud end rose to
// full height beside the right boss (v3 fitment: crowds the real, wider brace).
panel_tr_drop_z = 13.0;
corner_r        = 8.0;
panel_t         = 8.0;    // 8 leaves a 5.1mm floor under an M5 nut pocket
edge_round      = 1.5;    // round-over on panel and shroud edges (minkowski —
                          // inset then grown back, so dimensions are preserved)
rim_chamfer     = 1.0;    // 45-deg break on the chassis slots + counterbore rims

panel_left_x = panel_left_meas + panel_left_ext;

// Third mount: M5 bolt + washer into a chassis rivnut, bottom-right quadrant.
// Plain clear hole — the rivnut is the thread, so no rear pocket. Position is
// ours to choose; the rivet gets drilled at the car to match the print.
version_tag = "asandov v7";  // engraved in the panel REAR face, below the sensor mount
version_pos = [33, -76];
aux_hole    = [15, -88];
aux_hole_d  = 5.5;
aux_cb_d    = 13.0;  // counterbore: DIN125 M5 washer (10) + socket room
aux_cb_deep = 4.5;   // head 3.5 + washer ~1 nest sub-flush; 3.5mm floor left

// ---- M5 HARDWARE (battery-tray "BOLT" convention) -------------------------
mount_mode        = "BOLT";  // "BOLT" = M5 screw + hex nut in a rear pocket
                             // "INSERT" = M5x10 heat-set melt-bore from the front
bolt_clear_dia    = 5.5;
nut_af            = 8.0;
nut_pocket_af     = 8.2;     // +0.2 light press so the nut stays put
nut_thickness     = 4.7;
nut_pocket_fit    = 0.2;     // axial fit so the nut fully seats, just sub-flush.
                             // (The old 1.5mm "thread relief" is gone: the bolt
                             // comes in from the FRONT, so its tip runs out into
                             // the pocket's open rear mouth — the relief only
                             // thinned the clamped floor, 1.8mm at panel_t 8.)
insert_length         = 10.0;
insert_pilot_dia      = 6.65;  // validated melt-bore (fuse-insert-dia-test-3)
insert_seat_clearance = 0.3;

// ---- FPR INTERFACE (measured 2026-07-25, see fpr-bracket/) ----------------
fpr_ear_spacing = 52.0;
fpr_ear_hole_d  = 5.5;
fpr_x           = 69.0;   // [MEASURE] moved DOWN-LEFT per v1 fitment (2026-08-26):
fpr_ear_z       = -103.0; // at the drawn top-centre spot the RIGHT side fitting hit
                          // the fuse box. v3 fitment (2026-08-28): dropped a further
                          // 5mm — at -98 the adjuster stem crowded the sensor body
                          // and the sensor return hose caught the FPR's nipple.
fpr_ear_center_above_base = 47.0;

// ---- FLEX FUEL CRADLE PLACEMENT -------------------------------------------
// The cradle is positioned by its own STL origin, then rotated in the panel
// plane. Cradle-local axes: u = long axis, v = out of the mounting face,
//// w = across (the bolt-hole line AND the fuel passage).
ffs_ox  =  80;  // cradle-local origin, bracket X
ffs_oz  = -41.0;  // cradle-local origin, bracket Z
ffs_oy  =   2.0;  // ... and forward of the PANEL FRONT FACE. Lifts the whole
                  // cradle off the plate; ffs_backing() grows to fill the gap,
                  // so this is the knob for the sensor's bottom fouling the
                  // body rather than moving ffs_oz.
ffs_rot = 130.0;  // increasing = clockwise as viewed at the car (+X renders
                  // image-left). Body rides between the two chassis mounts —
                  // ffs_clearance_cut carves its slot through the shroud bar —
                  // and the connector exits clear of the fuse box.
ffs_hole_d = 6.5; // cradle ear holes (M5 rattles 1mm — washer under the head)
// Backing boss: fills panel-face-to-cradle-back (the ffs_tip wedge) so the
// cradle seats on solid plastic. u capped short of the loop end — backing out
// there would ride over the right chassis mount.
ffs_back_u_max = 100.0;
ffs_bolt_floor = 4.0;   // plastic between the nut pocket floor and the ear seat
ffs_tip = 15.0;   // top of sensor tipped FORWARD off the panel, deg (pivot at
                  // the cradle origin — the cradle back lifts off above it)
// Lower-port hose leg aims STRAIGHT DOWN in the bracket frame (at the FPR
// return) for any ffs_rot/ffs_tip: clock spins the leg about the port axis,
// droop tips it past square by the passage's off-vertical angle.
function _dot3(a, b) = a[0]*b[0] + a[1]*b[1] + a[2]*b[2];
ffs_u_g = [cos(ffs_rot), sin(ffs_rot)*sin(ffs_tip), sin(ffs_rot)*cos(ffs_tip)];
ffs_v_g = [0, cos(ffs_tip), -sin(ffs_tip)];
ffs_w_g = [-sin(ffs_rot), cos(ffs_rot)*sin(ffs_tip), cos(ffs_rot)*cos(ffs_tip)];
ffs_dn_c = _dot3([0, 0, -1], ffs_w_g);
ffs_dn_p = [0, 0, -1] - ffs_dn_c * ffs_w_g;
ffs_inlet_clock = atan2(-_dot3(ffs_dn_p, ffs_v_g), -_dot3(ffs_dn_p, ffs_u_g));
ffs_inlet_droop = asin(ffs_dn_c);

// Vapour-lock guard — OUR margin, not a spec. AEM's manual for this same
// Continental sensor (10-220X, p.5) allows ANY orientation; the angled-passage
// preference is forum wisdom about bubbles/debris sitting in the annulus on a
// return line. 30 is free to keep, and soft if a layout ever truly needs less.
ffs_passage_deg = abs(90 - (abs(ffs_rot) % 180));  // valid over the full circle
// Guard removed 2026-08-28 — AEM permits any orientation; angle is layout's call.

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
// Seat bar's X span — the reach of the flat top face. ffs_backing() clips to it.
bar_x0 = cx0 - mount_pad_w/2;
bar_x1 = cx0 + chassis_hole_spacing + mount_pad_w/2;

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
// 9 sensor ^ everything above the top edge. MUST be empty: anything here is the
// sensor itself cresting the flat top face, which no cut logic can hide.
else if (check == 9)   intersection() { ffs_solid(); above_top_edge(); }

module bracket() {
    difference() {
        union() {
            difference() {
                union() { panel(); chassis_bosses(); }
                // render() pre-evaluates the 6-copy STL cut through CGAL: without
                // it the preview CSG normalizer gives up ("empty tree", blank F5).
                render(convexity = 6) ffs_clearance_cut();
            }
            ffs_backing();  // after the sensor cut: the seat face stays full
        }
        chassis_holes();
        tower_boss_clearance();
        for (p = fpr_pts) m5_mount(p[0], p[1]);
        translate([aux_hole[0], -1, aux_hole[1]]) rotate([-90, 0, 0])
            cylinder(d = aux_hole_d, h = panel_t + 2, $fn = 32);
        translate([aux_hole[0], panel_t - aux_cb_deep, aux_hole[1]])
            rotate([-90, 0, 0]) cylinder(d = aux_cb_d, h = aux_cb_deep + 1, $fn = 48);
        translate([aux_hole[0], panel_t - rim_chamfer, aux_hole[1]])
            rotate([-90, 0, 0]) cylinder(d1 = aux_cb_d, d2 = aux_cb_d + 2*rim_chamfer + 0.02,
                                         h = rim_chamfer + 0.01, $fn = 48);
        // version engraving, 1mm into the REAR face (prints into the bed side,
        // hidden against the pillar; reads right when the part is flipped over)
        translate([version_pos[0], 1.0, version_pos[1]])
            rotate([90, 0, 0]) linear_extrude(1.01)
                text(version_tag, size = 8, halign = "center", valign = "center");
        ffs_bolt_cut(ffs_stl_hole_u, 39.0);
        ffs_bolt_cut(ffs_stl_hole_u, -7.0);
    }
}

// The flex cradle + sensor, dilated by ffs_cut_clear, CUT from the printed body: struts
// may bind wherever they like and the sensor's space is simply molded out.
// No -Y offset — the panel behind the cradle back must stay solid to bolt to.
ffs_cut_clear = 1.0;
// Closing radius for the pocket projection: the outline is grown by
// ffs_cut_clear + this, then shrunk back by this. MUST exceed the cradle's
// 6.5mm ear-hole radius (3.25) less ffs_cut_clear, or those holes survive the
// projection and leave a pin of body standing in the pocket at each ear.
ffs_cut_close = 4.0;
module ffs_clearance_cut() {
    c = ffs_cut_clear;
    // Cradle: its 2D outline grown by c, re-extruded through its depth — ONE
    // smooth pocket wall. (A minkowski of the whole assembly is exact but costs
    // ~4.5min per render; shifted copies left stair-stepped shelves.) Undercuts
    // in the cradle profile get filled — a roomier pocket, which is fine.
    // dy 0.02 keeps the grown back face off the panel front (coplanar faces).
    // grow ffs_cut_close past clearance then shrink back: closes the cradle's
    // own bolt holes in the projection (grown alone they survive as small voids
    // that leave pins of body standing inside the pocket)
    translate([0, 0.02, 0]) ffs_place() rotate([-90, 0, 0])
        linear_extrude(18 + c)
            offset(r = -ffs_cut_close) offset(r = c + ffs_cut_close) projection()
                rotate([90, 0, 0]) import(ffs_stl, convexity = 8);
    // Sensor + hoses: exact dilation by a sphere. The old 10 shifted copies
    // approximated this and left stair-step shelves down the pocket wall where
    // the copy boundaries crossed at a shallow angle. Only the cradle STL made
    // minkowski slow; these are a handful of primitives, so it is affordable.
    // Clipped at the panel front face: the sphere dilates -Y too, and the
    // sensor never lives behind that plane, so this keeps the cut out of the
    // plate instead of carving divots where the tipped connector grazes it.
    intersection() {
        minkowski() {
            ffs_place() {
                sensor();
                hose_stubs(sides = [-1]);
                hose_stub_90(1, ffs_inlet_clock, ffs_inlet_droop);
            }
            sphere(r = c, $fn = 12);
        }
        translate([-500, panel_t, -500]) cube([1000, 500, 1000]);
    }
}

// =============================================================================
// PANEL
// =============================================================================

module panel() {
    minkowski() {
        translate([0, panel_t - edge_round, 0]) rotate([90, 0, 0])
            linear_extrude(panel_t - 2 * edge_round)
                offset(r = -edge_round)
                    offset(r = corner_r) offset(r = -corner_r) panel_2d();
        sphere(edge_round, $fn = 24);
    }
}

module panel_2d() {
    polygon(concat([[panel_right_x, panel_top_z - panel_tr_drop_z],
                    [cx0 - mount_pad_w/2, panel_top_z - panel_tr_drop_z],
                    [cx0 - mount_pad_w/2, panel_top_z],
                    [panel_tl_drop_x, panel_top_z],
                    [panel_tl_drop_x, panel_top_z - panel_tl_drop_z],
                    [panel_left_x, panel_top_z - panel_tl_drop_z]],
                   bottom_edge_pts()));
}

// Bottom edge, walking left (+X) -> right (-X) to keep the winding consistent.
// Past panel_left_meas the profile is held flat at drop_ext — nothing out in the
// extension has been measured, so it does not get to pretend it is deeper.
function bottom_z_curve(x) =
    x > panel_left_meas ? -drop_ext
  : let (t     = (panel_left_meas - x) / (panel_left_meas - panel_right_x),
         chord = -drop_left + t * (drop_left - drop_right),
         arch  = bottom_bulge * 4 * t * (1 - t))
    chord + arch;

// Left of the FPR's RIGHT ear the edge runs flat at that station's height — the
// triangle under the regulator was backing nothing. Tracks fpr_x/fpr_ear_spacing.
bottom_flat_x = fpr_x - fpr_hx;
bottom_flat_z = bottom_z_curve(bottom_flat_x);

function bottom_z(x) = x > bottom_flat_x ? bottom_flat_z : bottom_z_curve(x);

function bottom_edge_pts() = concat(
    [[panel_left_x, bottom_flat_z], [bottom_flat_x, bottom_flat_z]],
    [for (i = [1 : bottom_segments])
        let (x = bottom_flat_x + (i / bottom_segments) * (panel_right_x - bottom_flat_x))
        [x, bottom_z_curve(x)]]
);

// =============================================================================
// CHASSIS INTERFACE
// =============================================================================

// Local frame on the bolt axis: origin on the hole centreline at the seat plane,
// local +Z along the bolt axis (forward and up), local +X still along the wall.
module mount_frame() {
    translate([0, chassis_standoff, 0])
        rotate([chassis_hole_tilt - 90, 0, 0]) children();
}

module chassis_bosses() {
    shroud();
    // cove fillet per rooting height: right of the top-left step at panel_top_z,
    // left of it 8 lower on the dropped edge
    // + edge_round: keeps each fillet's bottom corner inside the rounded arm's
    // full-contact zone (at the exact foot line it detaches into a sliver)
    shroud_fillet(panel_top_z - arm_bite_extra_r + edge_round,
                  cx0 - mount_pad_w/2, panel_tl_drop_x - (cx0 - mount_pad_w/2));
    shroud_fillet(panel_top_z - panel_tl_drop_z - arm_bite_extra_l + edge_round,
                  panel_tl_drop_x, (cx0 - mount_pad_w/2 + chassis_hole_spacing + mount_pad_w) - panel_tl_drop_x);
}

// Concave cove along the shroud/panel joint. Cross-section built in the Y-Z
// plane: quad corner->T1->C->T2 minus the circle at C leaves the fillet, with
// C placed on the corner bisector so the arc lands tangent on both faces.
module shroud_fillet(edge_z, fx0, fw) {
    r  = shroud_fillet_r;
    cy = panel_t;                // the corner: panel front face...
    cz = edge_z - shroud_root_h; // ...at this segment's root-strip bottom edge
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
    translate([fx0, 0, 0]) rotate([90, 0, 90])
        linear_extrude(fw)
            difference() {
                polygon([[cy, cz], [cy, C[1]], C, T2]);
                translate(C) circle(r = r, $fn = 64);
            }
}

// one continuous seat bar across both bosses, in the tilted seat plane.
// inset shrinks it all round for the minkowski round-over in shroud_half.
module seat_bar(inset = 0) {
    mount_frame() translate([(cx0 + cx1)/2, 0, inset])
        linear_extrude(mount_pad_t - 2 * inset)
            offset(r = -inset)
                offset(r = 5) offset(r = -5)
                    translate([-(chassis_hole_spacing + mount_pad_w)/2, -mount_pad_top])
                        square([chassis_hole_spacing + mount_pad_w,
                                mount_pad_top + mount_pad_h/2]);
}

// Bar hulled to a root strip biting the top edge at edge_z. Root ends FLUSH
// with the seat bar: any overhang past the bar survives the boss pocket cut as
// a wall that wraps the boss's outer corner (v3 fitment: fouled the chassis).
// hull is convex, so rounding the whole arm via minkowski stays cheap
module shroud_half(edge_z, bite = shroud_root_h) {
    r = edge_round;
    minkowski() {
        hull() {
            seat_bar(inset = r);
            // top runs to edge_z (not edge_z - r): the root's flat rear then
            // covers the panel's rounded top edge — otherwise both surfaces
            // curl away from the bend and leave a V-groove ridge across the back
            translate([cx0 - mount_pad_w/2 + r, r, edge_z - bite + r])
                cube([chassis_hole_spacing + mount_pad_w - 2*r,
                      panel_t - 2*r, bite - r]);
        }
        sphere(r, $fn = 24);
    }
}

// Two hulls off the same bar, clipped at the top-left step, so the ramp roots
// on the panel edge at BOTH heights instead of floating over the dropped zone.
module shroud() {
    intersection() {
        shroud_half(panel_top_z, shroud_root_h + arm_bite_extra_r);
        translate([-300, -100, -300]) cube([300 + panel_tl_drop_x, 400, 600]);
    }
    intersection() {
        shroud_half(panel_top_z - panel_tl_drop_z,
                    shroud_root_h + arm_bite_extra_l);
        translate([panel_tl_drop_x - arm_l_overlap, -100, -300])
            cube([300, 400, 600]);
    }
}

// Just the hook, for the clash checks — the panel is not in the way of the FPR.
module mount_solid() { chassis_bosses(); }

module chassis_holes() {
    for (cx = [cx0, cx1]) translate([0, 0, stud_lift]) mount_frame() translate([cx, 0, 0]) {
        translate([0, 0, -1]) hull()
            for (dx = [-chassis_hole_slot/2, chassis_hole_slot/2])
                translate([dx, 0, 0])
                    cylinder(d = chassis_hole_d, h = mount_pad_t + 2, $fn = 48);
        // rim break on the washer face
        translate([0, 0, mount_pad_t - rim_chamfer]) hull()
            for (dx = [-chassis_hole_slot/2, chassis_hole_slot/2])
                translate([dx, 0, 0])
                    cylinder(d1 = chassis_hole_d, d2 = chassis_hole_d + 2*rim_chamfer + 0.02,
                             h = rim_chamfer + 0.01, $fn = 48);
    }
}

// grow = air on every side; grow_xneg overrides the -X side alone. Corner radius
// follows grow, so a uniform grow reproduces the plain offset pair exactly.
module boss_section_2d(grow = 0, grow_xneg = undef, grow_xpos = undef) {
    gn = is_undef(grow_xneg) ? grow : grow_xneg;
    gp = is_undef(grow_xpos) ? grow : grow_xpos;
    r  = tower_boss_r + grow;
    hull() for (cxy = [[ tower_boss_w/2 + gp - r,  tower_boss_h/2 + grow - r],
                       [ tower_boss_w/2 + gp - r, -tower_boss_h/2 - grow + r],
                       [-tower_boss_w/2 - gn + r,  tower_boss_h/2 + grow - r],
                       [-tower_boss_w/2 - gn + r, -tower_boss_h/2 - grow + r]])
        translate(cxy) circle(r = r, $fn = 48);
}

// The bosses are the car, not the print. Nothing printed may occupy this volume
// or the pads will never touch their seats.
module tower_boss_clearance() {
    translate([0, 0, stud_lift]) mount_frame() {
        translate([cx0, 0, 0]) boss_pocket(tower_boss_clear + boss_clear_extra_r,
                                           grow_xpos = boss_clear_inner_r);
        translate([cx1, 0, 0]) boss_pocket(tower_boss_clear,
                                           grow_xneg = boss_clear_inner_l);
    }
}

// One boss pocket, its mouth (local z = 0, the seat plane) coved back by
// boss_pocket_fillet_r so the pad's underside meets the pocket wall on a radius
// instead of a knife lip. Every face pulls in by the same amount at the mouth,
// so a per-face clearance override keeps its shape all the way down the cove.
function _bpf_shrink(t) = -boss_pocket_fillet_r
                          + boss_pocket_fillet_r * cos(asin(t));
function _bpf_g(base, t) = is_undef(base) ? undef : base + _bpf_shrink(t);

module boss_pocket(grow, grow_xneg = undef, grow_xpos = undef) {
    r = boss_pocket_fillet_r;
    n = 16;
    translate([0, 0, -boss_axis_len - 10])
        linear_extrude(boss_axis_len + 10 - r)
            boss_section_2d(grow, grow_xneg, grow_xpos);
    for (i = [0 : n - 1])
        hull() for (t = [i / n, (i + 1) / n])
            translate([0, 0, -r + r * t]) linear_extrude(0.001)
                boss_section_2d(_bpf_g(grow, t), _bpf_g(grow_xneg, t),
                                _bpf_g(grow_xpos, t));
}

module tower_boss_ghost() {
    for (cx = [cx0, cx1])
        translate([0, 0, stud_lift]) mount_frame() translate([cx, 0, -boss_axis_len])
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
        // Bolt tension pulls the nut onto the pocket floor. Pocket is only
        // nut-deep now: the clamped floor is panel_t - 4.9 = 3.1mm of meat.
        translate([x, nut_thickness + nut_pocket_fit, z]) rotate([90, 0, 0])
            cylinder(d = nut_pocket_af / cos(30),
                     h = nut_thickness + nut_pocket_fit + 1, $fn = 6);
    }
}

// =============================================================================
// GHOSTS / KEEP-OUTS
// =============================================================================

module ghosts() { tower_boss_ghost(); fpr_solid(); ffs_solid(); fusebox_ghost(); }

module fusebox_ghost() {
    translate([0, 0, stud_lift]) difference() {
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

// One transform for everything that lives in the cradle frame.
module ffs_place() {
    translate([ffs_ox, panel_t + ffs_oy, ffs_oz])
        rotate([-ffs_tip, 0, 0]) rotate([0, -ffs_rot, 0]) children();
}

// Wedge between the panel front face and the tilted cradle back. NOT touched by
// ffs_clearance_cut — the cradle is meant to seat on this, zero gap.
module ffs_backing() {
    intersection() {
        ffs_place() intersection() {
            // same grown outline as the pocket cut, extruded BACKWARD, so the
            // backing rim lands exactly on the pocket wall — no moat between
            rotate([-90, 0, 0]) translate([0, 0, -45]) linear_extrude(45)
                offset(r = -ffs_cut_close) offset(r = ffs_cut_clear + ffs_cut_close)
                    projection() rotate([90, 0, 0]) import(ffs_stl, convexity = 8);
            translate([-7 - ffs_cut_clear, -46, -13 - ffs_cut_clear])
                cube([7 + ffs_cut_clear + ffs_back_u_max, 47,
                      58 + 2 * ffs_cut_clear]);
        }
        ffs_back_allowed();
        ffs_top_limit();
    }
}

// The assembly's top boundary, derived not tuned: across the seat bar the pad
// stops at the bar's own top face; outboard of the bar, at the panel's top edge
// (which steps down on both sides). Clipping the backing to this is what keeps
// the top edge flush at ANY ffs_oz — do not reintroduce a hand-tuned inset.
module above_top_edge() {
    difference() {
        translate([panel_right_x, -200, -300]) cube([panel_left_x - panel_right_x, 400, 600]);
        ffs_top_limit();
    }
}

module ffs_top_limit() {
    tlz = panel_top_z - panel_tl_drop_z;
    trz = panel_top_z - panel_tr_drop_z;
    translate([0, 0, stud_lift]) mount_frame()
        translate([bar_x0, -mount_pad_top, -200]) cube([bar_x1 - bar_x0, 400, 400]);
    translate([panel_right_x, -100, trz - 400])
        cube([bar_x0 - panel_right_x, 200, 400]);
    translate([bar_x1, -100, tlz - 400])
        cube([panel_left_x - bar_x1, 200, 400]);
}

// Where backing may exist: only FORWARD of the body's front surfaces, so the
// pad emerges from the front to meet the cradle and never shows from the rear.
module ffs_back_allowed() {
    // the top edge steps at panel_tl_drop_x — each side's clips use ITS edge
    // height and ITS arm's rear slant, or the pad stands in air on the left
    tlz = panel_top_z - panel_tl_drop_z;
    // below the shroud roots: forward of the panel face
    translate([panel_right_x, panel_t - 0.01, -260])
        cube([panel_tl_drop_x - panel_right_x, 60, 260 + panel_top_z]);
    translate([panel_tl_drop_x, panel_t - 0.01, -260])
        cube([panel_left_x - panel_tl_drop_x, 60, 260 + tlz]);
    // through the ramp zone: forward of each arm's rear slant
    // (root rear corner up to the seat bar's rear bottom corner)
    bb_y = chassis_standoff + (mount_pad_h/2) * sin(chassis_hole_tilt);
    bb_z = stud_lift - (mount_pad_h/2) * cos(chassis_hole_tilt);
    translate([panel_right_x, 0, panel_top_z])
        rotate([atan2(bb_z - panel_top_z, bb_y), 0, 0])
            translate([0, 0, -100])
                cube([panel_tl_drop_x - panel_right_x,
                      norm([bb_y, bb_z - panel_top_z]), 100]);
    translate([panel_tl_drop_x, 0, tlz])
        rotate([atan2(bb_z - tlz, bb_y), 0, 0])
            translate([0, 0, -100])
                cube([panel_left_x - panel_tl_drop_x,
                      norm([bb_y, bb_z - tlz]), 100]);
    // bar zone: forward of the seat plane, full reach to the cradle. Bounded to
    // the bar's own span — past it there is no bar to be flush with.
    translate([0, 0, stud_lift]) mount_frame()
        translate([bar_x0, -60, 0]) cube([bar_x1 - bar_x0, 120, 60]);
}

// M5 bore + hex nut pocket along the cradle NORMAL (square to the tilted seat).
// The pocket channel opens out the panel's rear face at ffs_tip degrees.
module ffs_bolt_cut(u, w) {
    ffs_place() translate([u, 0, w]) rotate([-90, 0, 0]) {
        translate([0, 0, -40]) cylinder(d = ffs_hole_d, h = 42, $fn = 32);
        translate([0, 0, -40])
            cylinder(d = nut_pocket_af / cos(30), h = 40 - ffs_bolt_floor, $fn = 6);
    }
}

// Cradle + sensor + hose stubs, placed as a unit. The cradle's own back face is
// at its local y=0, so it lands flush on the panel's front face. rotate([0,-r,0])
// spins it in the panel plane: X = u*cos r - w*sin r, Z = u*sin r + w*cos r.
module ffs_solid() {
    ffs_place() {
        import(ffs_stl, convexity = 8);
        sensor();       // from flex-fuel-assembly.scad — single source of truth
        hose_stubs(sides = [-1]);  // upper port: straight run up to the firewall
        // lower port = INLET: 90 hose end, leg aimed at the FPR return.
        hose_stub_90(1, ffs_inlet_clock, ffs_inlet_droop);
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
