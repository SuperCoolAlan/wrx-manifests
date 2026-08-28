// =============================================================================
// Continental flex fuel sensor + Thingiverse 2965407 cradle — fitment study
// =============================================================================
// Purpose: see where the -6AN fuel ports and the 3-pin electrical connector end
// up once the sensor is clipped into the cradle. The cradle itself is NOT
// redrawn — it is import()ed from the original STL and left alone.
//
// FRAME (native STL coordinates, do not re-origin — the imported mesh sets it):
//   X  along the long axis of the plate, -7 .. 79, and along the long axis of the
//      sensor. INSTALLED THIS AXIS IS VERTICAL: the retaining LOOP (-X) is the
//      BOTTOM — the sensor drops into that slot — and the SNAP HOOK (+X) is the
//      TOP, where it clicks home. So -X = down, +X = up.
//   Y  out of the mounting face. Y=0 is the BACK of the plate (sits against
//      whatever you bolt it to), Y=4 is the plate's front face = the surface
//      the sensor foot lands on. +Y is away from the mounting surface.
//   Z  across the plate, 0 .. 32 on the main body, with the two bolt ears
//      reaching to +45 and -13. Sensor centreline sits at Z=16. The fuel passage
//      runs along Z — perpendicular to the sensor's long axis, low down near the
//      slot end — so BOTH -6AN ports exit sideways out of the plate's 32mm width.
//
// Everything under CRADLE INTERFACE was measured off the STL mesh and is exact.
// Everything under SENSOR is an ENVELOPE, not the real part — [MEASURE] items
// still need calipers on the actual sensor before you trust any clearance here.
// =============================================================================

$fn = 48;

stl = "files/Continental_Flex_Fuel_Bracket.stl";

// ---- VIEW -----------------------------------------------------------------
show_cradle    = true;
show_sensor    = true;
show_hose      = true;   // stub of hose/fitting past each port, for clearance
show_datums    = false;  // fuel passage + connector axis lines
installed      = true;   // true = rotate into the INSTALLED pose, viewed from the
                         //   FRONT: slot end down, hook end up, plate BEHIND the
                         //   sensor, fuel lines out left and right
section        = 0;      // 0 none, 1 cut at Z=16 (through the sensor axis)

// ---- CRADLE INTERFACE — MEASURED FROM THE STL, EXACT ----------------------
plate_face_y   = 4.0;    // front face of the plate; the sensor foot sits here
plate_x0       = -7.0;   // loop end
plate_x1       = 79.0;   // hook end
seat_z         = 16.0;   // sensor centreline across the plate

loop_win_y0    = 4.0;    // loop window (the "lock" the foot tongue slides into)
loop_win_y1    = 7.5;    //   -> 3.5mm tall
loop_win_z0    = 7.5;
loop_win_z1    = 24.0;   //   -> 16.5mm wide
loop_x0        = -7.0;   // window is a through-slot over this 7mm of X
loop_x1        =  0.0;

hook_face_x    = 73.5;   // inner face of the snap wall
hook_lip_x     = 72.0;   // lip overhangs back to here
hook_catch_y   = 13.5;   // underside of the lip — what the sensor tab clicks under
hook_top_y     = 18.0;
hook_z0        = 10.5;
hook_z1        = 22.0;   //   -> 11.5mm wide

bolt_d         = 6.5;    // both ears, measured
bolt_x         = 34.0;
bolt_z_top     =  39.0;
bolt_z_bot     =  -7.0;  // 46.0mm centre-to-centre

// ---- SENSOR — ENVELOPE ONLY, [MEASURE] EVERYTHING -------------------------
// The sensor sits DIRECTLY ON the plate face: its bottom face is Y = plate_face_y,
// and the body grows upward in +Y from there. The fuel passage is a through-tube
// low in that bottom section — the -6AN ports are NOT on the body centreline, they
// run across the bottom of the sensor, well under the electronics.
body_len       = 68.0;   // [MEASURE] body length along X, fitting shoulders excluded
body_w         = 34.0;   // [MEASURE] across Z
body_h         = 34.0;   // [MEASURE] along Y, bottom face to top of body
body_r         =  3.0;   // cosmetic corner rounding
body_x0        = 2.0;    // [MEASURE] where the body starts, measured from X=0
                         //   (X=0 is the inner face of the retaining loop)

// The fuel passage. It is a tube ACROSS the sensor (along Z), low down near the
// slot end — it does not run the length of the body. These two numbers place it.
port_x         = 16.0;   // [MEASURE] passage axis along X, from X=0 (loop inner face)
port_y         = 17.0;   // [MEASURE] passage axis height above the sensor bottom face
port_d         = 14.0;   // [MEASURE] across the -6AN adapter hex/body
port_len       = 22.0;   // [MEASURE] adapter sticking out past the sensor body
bore_d         =  8.0;   // [MEASURE] fuel passage bore, drawn so the flow path is
                         //   visible in section view
hose_d         = 16.0;   // [MEASURE] hose + fitting OD
hose_len       = 45.0;   // straight run to reserve past each port

// Cradle engagement — driven by the measured cradle, not guessed.
tongue_t       = 3.5;    // = loop window height. Bottom rail, slides in at -X.
tongue_w       = 16.5;   // = loop window width
tongue_len     = 12.0;   // [MEASURE] how far the tongue projects past the body
snap_ledge_y   = 13.5;   // = hook_catch_y. The sensor ledge the lip clicks over.

// Connector: 3-pin, at the TOP of the sensor (hook end) on its RIGHT side face,
// plug axis across the bracket so the loom leaves sideways. "Right" here means the
// low-Z side, which is screen-right in the installed front view.
// [MEASURE] every number below.
// RIGHT is defined from the FRONT view: standing in front of the sensor with the
// bracket plate BEHIND it. That is bracket +Z. Do not re-derive it from a view that
// looks through the plate — that is the back, and it mirrors left/right.
conn_dir       = +1;     // +1 = leaves toward +Z (right from the front), -1 = left
conn_x         = 58.0;   // [MEASURE] centre along the sensor's long axis, from X=0
conn_y         = 20.0;   // [MEASURE] centre height above the sensor's bottom face
conn_w         = 22.0;   // [MEASURE] across the sensor's long axis (X)
conn_h         = 20.0;   // [MEASURE] along Y
conn_len       = 26.0;   // [MEASURE] plug incl. the mating half, along its own axis
conn_boot      = 40.0;   // straight run the loom needs before it can bend

// ---- BUILD ----------------------------------------------------------------
module rbox(l, w, h, r) {
    hull() for (x = [r, l-r], y = [r, w-r], z = [r, h-r])
        translate([x, y, z]) sphere(r);
}

bx  = body_x0;                 // body start in X
by  = plate_face_y;            // sensor bottom face — sits ON the plate
pax = bx + port_x;             // fuel passage axis along X
pay = by + port_y;             // fuel passage axis height off the plate face

module sensor() {
    color("#2b2b2b") difference() {
        union() {
            translate([bx, by, seat_z - body_w/2]) rbox(body_len, body_h, body_w, body_r);
            // bottom rail into the loop — the feature the loop window captures
            translate([bx - tongue_len, loop_win_y0, seat_z - tongue_w/2])
                cube([tongue_len + 1, tongue_t, tongue_w]);
        }
        // fuel passage: bored ACROSS the body along Z, near the slot end
        translate([pax, pay, seat_z - body_w/2 - port_len - 1])
            cylinder(d = bore_d, h = body_w + 2*port_len + 2);
    }

    // -6AN adapters, one out each side along Z
    color("#3a3a3a") for (s = [-1, 1])
        translate([pax, pay, seat_z + s*body_w/2]) rotate([0, s < 0 ? 180 : 0, 0])
            difference() { cylinder(d = port_d, h = port_len);
                           translate([0,0,-1]) cylinder(d = bore_d, h = port_len + 2); }

    // electrical connector — plug + backshell hanging off the side of the body
    ccz = seat_z + conn_dir * body_w/2;
    color("#7a4a2a")
        translate([bx + conn_x - conn_w/2, by + conn_y - conn_h/2,
                   (conn_dir < 0) ? ccz - conn_len : ccz])
            cube([conn_w, conn_h, conn_len]);
    color("#1a1a1a")
        translate([bx + conn_x, by + conn_y, ccz + conn_dir * conn_len])
            rotate([0, (conn_dir < 0) ? 180 : 0, 0]) cylinder(d = 14, h = conn_boot);
}

module hose_stubs(sides = [-1, 1]) {
    color("#8b1a1a", 0.35) for (s = sides)
        translate([pax, pay, seat_z + s*(body_w/2 + port_len)])
            rotate([0, s < 0 ? 180 : 0, 0]) cylinder(d = hose_d, h = hose_len);
}

// 90-degree hose end on one port: short socket out along the port axis, then
// the hose leg turns square off it. dir_deg clocks the leg about the port axis:
// 0 points toward -X (the loop/bottom end of the sensor), +90 swings it to -Y
// (off the plate face). Socket/leg are [approx] envelope numbers.
// droop tips the leg past square, toward the port's outward axis — models a
// hose that keeps curving after the elbow instead of a rigid 90.
module hose_stub_90(s = 1, dir_deg = 0, droop = 0, socket = 20, leg = 40) {
    color("#8b1a1a", 0.35)
        translate([pax, pay, seat_z + s*(body_w/2 + port_len)])
            rotate([0, s < 0 ? 180 : 0, 0]) {
                cylinder(d = hose_d, h = socket);
                translate([0, 0, socket - hose_d/2])
                    rotate([0, 0, dir_deg]) rotate([0, droop, 0]) rotate([0, -90, 0])
                        cylinder(d = hose_d, h = leg);
            }
}

module assembly() {
    if (show_cradle) color("#3465a4") import(stl, convexity = 8);
    if (show_sensor) sensor();
    if (show_hose)   hose_stubs();
    if (show_datums) {
        color("red")    translate([pax, pay, seat_z]) rotate([0, 0, 0])
                        translate([0,0,-90]) cylinder(d = 0.8, h = 180);
        color("yellow") translate([0, by + conn_y, seat_z])
                        rotate([0, 90, 0]) cylinder(d = 0.8, h = 90, center = true);
    }
}

module posed() {
    // +X up, then spun 180 so the camera sees the SENSOR with the plate behind it.
    // Drop that second turn and you are looking through the plate — left/right swap.
    if (installed) rotate([0, 0, 180]) rotate([0, -90, 0]) assembly();
    else assembly();
}

if (section == 1) difference() { posed(); translate([-200, -50, seat_z]) cube([400, 200, 200]); }
else posed();
