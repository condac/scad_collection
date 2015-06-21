nema_screw_dist = 43.840620434/2;

axle_d = 13;

screw = 3.5;
screw_wall = 10;
screw_res = 30;
space = 20;

plate = 4;
frame = 20;
difference() {
    union() {
        hull() {
            translate([nema_screw_dist, 0, 0])cylinder(d=screw_wall, h = plate, $fn=screw_res);
            translate([-nema_screw_dist, 0, 0])cylinder(d=screw_wall, h = plate, $fn=screw_res);
            translate([0, -nema_screw_dist, 0])cylinder(d=screw_wall, h = plate, $fn=screw_res);
            translate([0, nema_screw_dist, 0])cylinder(d=screw_wall, h = plate, $fn=screw_res);
            //translate([18, axle_d, 0]) cube([1,frame,plate]);
            //translate([-18, axle_d, 0]) cube([1,frame,plate]);
        }
        // rising poles
        translate([nema_screw_dist, 0, 0])cylinder(d=screw_wall, h = plate+space, $fn=screw_res);
        translate([-nema_screw_dist, 0, 0])cylinder(d=screw_wall, h = plate+space, $fn=screw_res);
        translate([0, -nema_screw_dist, 0])cylinder(d=screw_wall, h = plate+space, $fn=screw_res);
        //frame mount plate
        translate([-18, axle_d, 0]) cube([18*2,frame,plate]);
    }
    translate([nema_screw_dist, 0, 0])cylinder(d=screw, h = plate+space, $fn=screw_res);
    translate([-nema_screw_dist, 0, 0])cylinder(d=screw, h = plate+space, $fn=screw_res);
    translate([0, -nema_screw_dist, 0])cylinder(d=screw, h = plate+space, $fn=screw_res);
    translate([0, 0, 0])cylinder(d=22.5, h = plate, $fn=screw_res);
    translate([18, axle_d, -1]) cube([frame,frame,plate+2]);
    translate([-18-frame, axle_d, -1]) cube([frame,frame,plate+2]);
    
    //frame screw holes
    translate([18-6,axle_d+frame/2 , 0])cylinder(d=screw, h = plate, $fn=screw_res);
    translate([-18+6,axle_d+frame/2 , 0])cylinder(d=screw, h = plate, $fn=screw_res);
}

