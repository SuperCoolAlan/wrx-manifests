// =============================================================================
// Cable layout study — battery tray + Blue Sea 5001 holders + cable runs
// =============================================================================
// VISUALISATION ONLY. Never export this for printing — it contains the battery,
// the fuse holders and the cables as solids. Print battery-tray-mtx35.scad.
//
//   Open in OpenSCAD and press F5 (preview). Colours only show in PREVIEW —
//   F6 / CGAL render discards them.
//
//   CLI:  openscad -o cables.png --camera=60,140,110,62,0,205,1050 \
//                  --imgsize=1500,1150 cable-layout.scad
//         (omit --render so it stays in preview and keeps colour)
//
// `include` pulls in the tray geometry AND every parameter, so holder and stud
// positions below are derived from the real design — change the tray and this
// follows automatically.
// =============================================================================

include <battery-tray-mtx35.scad>

// ---- what to show ----
show_tray    = true;   // the tray itself comes from the include above; false is not possible,
                       // so to hide it comment out the include and import an STL instead
show_battery = true;
show_holders = true;
show_cables  = true;

// ---- Blue Sea 5001, straight off the dimensioned drawing ----
// 4.070" x 1.500" x 1.649", studs 5/16"-18 [M8] at 2.000" centres,
// mount holes for #10 [M5] at 3.488" centres.
holder_len    = fuse_holder_length;   // 103.38  (already in the design)
holder_wid    = fuse_holder_width;    //  38.10
holder_height = 41.87;                // projection out from the mount face, incl. cover
stud_spacing  = 50.80;                // 2.000"
lug_standoff  = 30;                   // how far out along the stud the cable lug sits
// ---- ORIENTATION STUDY ----
// false = holders long-axis along X (as designed), stacked in Z
// true  = holders long-axis along Z (VERTICAL), side by side in X.
//         Studs then sit top and bottom, so lugs exit UP (to the battery terminal)
//         and DOWN (past the tie slots) instead of sideways.
holders_vertical = fuse_holders_vertical;   // tracks the design
holder_gap_x     = 2;

// ---- derived mounting geometry (do not edit) ----
y_mount   = outer_w - wall_thickness + fuse_wall_thickness;   // rear mount face
hx0       = platform_x_origin + (platform_x_width - holder_len) / 2;
hxc       = hx0 + holder_len / 2;
stud_x    = [hxc - stud_spacing/2, hxc + stud_spacing/2];     // 28.6 and 79.4
row_z_hi  = fuse_wall_top_z - fuse_top_inset - holder_wid/2;  // upper holder centreline
row_z_lo  = row_z_hi - holder_wid - fuse_gap;                 // lower holder centreline
lug_y     = y_mount + lug_standoff;

// vertical-orientation geometry
vx        = [platform_x_width/2 - (holder_wid + holder_gap_x)/2,
             platform_x_width/2 + (holder_wid + holder_gap_x)/2];   // holder X centres
v_top_z   = fuse_wall_top_z - fuse_top_inset;                       // top of holders
v_ctr_z   = v_top_z - holder_len/2;
v_stud_z  = [v_ctr_z - stud_spacing/2, v_ctr_z + stud_spacing/2];   // lower, upper studs
v_bolt_z  = [v_ctr_z - fuse_mount_hole_spacing/2, v_ctr_z + fuse_mount_hole_spacing/2];

// Battery sits on the ridges, centred in the cavity
batt_x0 = wall_thickness + clearance;
batt_y0 = wall_thickness + clearance;
batt_z0 = floor_thickness + ridge_height;

// =============================================================================
// EDIT BELOW — cable runs
// =============================================================================
// Each entry: [ "name", "colour", diameter_mm, [ [x,y,z], [x,y,z], ... ] ]
// Points are absolute tray coordinates. The path is swept as a smooth tube, so
// 4-8 points is usually enough. Handy landmarks:
//   lug positions   [stud_x[0] or [1], lug_y, row_z_lo or row_z_hi]
//   wall top edge   z = fuse_wall_top_z  (198.2) at y 187.2-198.5
//   tie slot pairs  x = tie_slot_x, z = tie_slot_z, outboard face y ~ 197-204
//   battery top     z = batt_z0 + batt_height  (233.4)

batt_pos_post = [35, 150, batt_z0 + batt_height];   // where you'll clamp the + terminal

cables = holders_vertical ? [
  // Battery + to each fuse's UPPER lug — enters the top exit travelling down.
  [ "batt+ to alt fuse", "red", 13,
    [ [35,150,248],[35,168,246],[34,190,238],[31,208,222],
      [27,220,200],[24.5,226,176],[fuse_hx_ctr[0],lug_y,155],[fuse_hx_ctr[0],lug_y,131.91] ] ],
  [ "batt+ to audio fuse", "red", 13,
    [ [52,150,246],[54,170,243],[58,192,235],[62,210,219],
      [63.5,222,196],[fuse_hx_ctr[1],lug_y,170],[fuse_hx_ctr[1],lug_y,131.91] ] ],

  // ALTERNATOR — drops in beside the tray's X_MIN side, then one continuous 60mm U
  // back up to the lower lug. No shield contact and no tie needed on the descent.
  // The loop plane is tilted 37 deg off the -X axis: that is the limit. Its horizontal
  // chord crosses X=0 at Y 210.5, i.e. 12mm behind the tray's rear face — tilt any
  // further forward and the loop cuts through the back-left corner of the tray.
  [ "alternator", "#e60", 13,
    [
      [-71.89,156.29,230.00],
      [-71.89,156.29,68.00],
      [-71.70,156.43,62.77],
      [-71.16,156.84,57.58],
      [-70.25,157.52,52.47],
      [-69.00,158.47,47.48],
      [-67.40,159.68,42.64],
      [-65.47,161.13,38.00],
      [-63.22,162.82,33.59],
      [-60.68,164.74,29.43],
      [-57.85,166.87,25.57],
      [-54.77,169.19,22.04],
      [-51.45,171.69,18.85],
      [-47.93,174.35,16.04],
      [-44.22,177.14,13.62],
      [-40.36,180.05,11.62],
      [-36.37,183.06,10.04],
      [-32.29,186.13,8.91],
      [-28.14,189.25,8.23],
      [-23.97,192.40,8.00],
      [-19.79,195.55,8.23],
      [-15.65,198.67,8.91],
      [-11.57,201.75,10.04],
      [-7.58,204.75,11.62],
      [-3.72,207.66,13.62],
      [-0.01,210.46,16.04],
      [3.52,213.11,18.85],
      [6.83,215.61,22.04],
      [9.92,217.93,25.57],
      [12.74,220.06,29.43],
      [15.28,221.98,33.59],
      [17.53,223.67,38.00],
      [19.46,225.13,42.64],
      [21.06,226.33,47.48],
      [22.32,227.28,52.47],
      [23.22,227.96,57.58],
      [23.77,228.37,62.77],
      [23.95,228.51,68.00],
      [23.95,228.51,81.11] ] ],

  // AUDIO — out of the lower exit, 60mm quarter-turn, then away REARWARD at Z 10.
  [ "audio feed (rearward)", "#111", 13,
    [ [64.05,228.51,81.11],
      [64.05,228.51,70.00],
      [64.05,228.51,70.00],
      [64.05,228.64,66.08],
      [64.05,229.02,62.17],
      [64.05,229.66,58.29],
      [64.05,230.55,54.47],
      [64.05,231.69,50.71],
      [64.05,233.08,47.04],
      [64.05,234.70,43.46],
      [64.05,236.55,40.00],
      [64.05,238.62,36.67],
      [64.05,240.91,33.47],
      [64.05,243.40,30.44],
      [64.05,246.08,27.57],
      [64.05,248.95,24.89],
      [64.05,251.98,22.40],
      [64.05,255.18,20.11],
      [64.05,258.51,18.04],
      [64.05,261.97,16.19],
      [64.05,265.55,14.57],
      [64.05,269.22,13.18],
      [64.05,272.98,12.04],
      [64.05,276.80,11.15],
      [64.05,280.68,10.51],
      [64.05,284.59,10.13],
      [64.05,288.51,10.00],
      [64.05,338.51,10.00],
      [64.05,408.51,10.00] ] ],
] : [

  // battery + -> far stud of each holder, hopping over the wall top
  [ "batt+ to upper fuse", "red", 13,
    [ [38,150,246], [38,175,243], [42,193,234], [52,208,214],
      [66,222,192], [stud_x[1], lug_y, row_z_hi] ] ],

  [ "batt+ to lower fuse", "red", 13,
    [ [46,150,244], [47,177,240], [52,196,229], [62,212,200],
      [73,226,160], [stud_x[1], lug_y, row_z_lo] ] ],

  // ALTERNATOR — TURNED: enters along the holder's LONG axis, out the X_MIN end.
  // Ring terminals on the studs exit along X, so the cable must arrive horizontally
  // rather than dropping onto the stud from above/below. It rises outboard of the
  // heat-shield end (clear of the tray in Y), then turns in level with the lower row.
  [ "alternator", "#e60", 13,
    [ [-45,204,5], [-42,214,48], [-40,222,95], [-34,226,120],
      [-14,228,129], [8,lug_y,row_z_lo], [stud_x[0], lug_y, row_z_lo] ] ],

  // up off the floor, through the CENTRE tie pair (tie_slot_x[1])
  [ "floor feed", "#111", 13,
    [ [62,196,-30], [58,200,-6], [55,203,18], [tie_slot_x[1],204,tie_slot_z+1],
      [53,209,75], [41,220,130], [stud_x[0], lug_y, row_z_hi] ] ],
];

// =============================================================================
// rendering helpers — no need to edit
// =============================================================================
module cable(path, d) {
    for (i = [0 : len(path) - 2])
        hull() {
            translate(path[i])     sphere(d = d, $fn = 16);
            translate(path[i + 1]) sphere(d = d, $fn = 16);
        }
}

if (show_battery)
    color("#3a5", 0.10)
        translate([batt_x0, batt_y0, batt_z0])
            cube([batt_length, batt_width, batt_height]);

if (show_holders) {
    if (holders_vertical)
        for (cx = vx) {
            color("#222", 0.85)
                translate([cx - holder_wid/2, y_mount, v_top_z - holder_len])
                    cube([holder_wid, holder_height, holder_len]);
            for (sz = v_stud_z)
                color("silver") translate([cx, y_mount, sz]) rotate([-90,0,0])
                    cylinder(d=8, h=holder_height + lug_standoff - 20, $fn=16);
            for (bz = v_bolt_z)
                color("#c33") translate([cx, y_mount-1, bz]) rotate([-90,0,0])
                    cylinder(d=5, h=4, $fn=12);       // M5 bolt positions
        }
    else
        for (z = [row_z_lo, row_z_hi]) {
            color("#222", 0.85)
                translate([hx0, y_mount, z - holder_wid/2])
                    cube([holder_len, holder_height, holder_wid]);
            for (sx = stud_x)
                color("silver") translate([sx, y_mount, z]) rotate([-90,0,0])
                    cylinder(d=8, h=holder_height + lug_standoff - 20, $fn=16);
        }
}

if (show_cables)
    for (c = cables) color(c[1]) cable(c[3], c[2]);
