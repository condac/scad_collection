
use <frame.scad>
use <wormtest.scad>



module link(length, thick) {
    wall = 2;
    y = wall*2;
    hole = 4;
    
    difference() {
        union() {
            hollow_cyl(d=hole, w=wall, h=thick);
            translate([length,0,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,-y/2,0])cube([length, y,thick]);
        }
        translate([0,0,-1]) cylinder(d=4, h=thick*2);
        translate([length,0,-1]) cylinder(d=4, h=thick*2);
    }
    
}
//link(68*2, 3);

module hollow_cyl(d, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d=d+w*2, h=h);
        translate([0,0,-1])cylinder(d=d, h=h+2);
    }
}

module susp_mount() {
     $fs= 0.9;
    hole = 3;
    wall = 2;
    thick = 3;
    difference() {
        hull() {    
            translate([12,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([-12,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,8+7,0]) hollow_cyl(d=hole, w=wall, h=thick);
        }
        translate([0,0,-1]) cylinder(d=19, h=thick*2);
        translate([12,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([-12,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([0,8+7,0]) cylinder(d=hole, h=thick*2);
    }
}
susp_mount();