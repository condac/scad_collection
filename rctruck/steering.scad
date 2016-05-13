
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
link(68*2, 3);

module hollow_cyl(d, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d=d+w*2, h=h);
        translate([0,0,-1])cylinder(d=d, h=h+2);
    }
}