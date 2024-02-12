//
$fs = 0.5;
$fa = 5.1;


mountdist = 13;

plate_h = 4;
hole = 3;

for (a =[dist:dist:l]) {
    translate([-100, 0, a]) rotate([0,90,]) cylinder(d=hole, h=400);
}

difference() {
    union() {
        for (a =[0:20:180]) {
            hull() {
                rotate([0,0,a]) translate([mountdist, 0, 0])cylinder(d=hole+4, h=plate_h);
                cylinder(d=hole+4, h=plate_h);
            }
        }
        hull() {
            translate([-mountdist*2, 0, 0])cylinder(d=hole+4, h=plate_h);
            translate([-mountdist, 6, 0])cylinder(d=hole+4, h=plate_h);
            cylinder(d=hole+4, h=plate_h);
        }
        
    }
    for (a =[0:20:90]) {
             rotate([0,0,a]) translate([mountdist, 0, -1])cylinder(d=hole, h=plate_h+2);
    }
    translate([0, 0,-1]) cylinder(d=hole, h=plate_h+2);
    
    translate([-mountdist*2, 0, -1])cylinder(d=hole, h=plate_h+2);
    translate([-mountdist, 6, -1])cylinder(d=hole, h=plate_h+2);
    
    translate([-mountdist*2+6, 0, -1])cylinder(d=hole, h=plate_h+2);
    translate([-mountdist*2+6+6, 0, -1])cylinder(d=hole, h=plate_h+2);
}