// valve for fan
screw_d = 105;
screw_hole = 4;
d = 90;

wall=2;

h = 8;


//lock
module lock() {
hull() {
    cylinder(d=d,h=wall);
    translate([-d/2, d+10, 0]) cube([d,wall,wall]);
}

}
//lock();

module valve() {
    difference() {
    hull() {
        cylinder(d=d+wall*4,h=h);
        translate([-screw_d/2-wall-screw_hole/2, d, 0]) cube([screw_d+wall*2+screw_hole,wall,h]);
        translate([screw_d/2, screw_d/2,0]) cylinder(d=screw_hole+wall*2, h = h, $fn = 32);
    translate([screw_d/2, -screw_d/2, 0]) cylinder(d=screw_hole+wall*2, h =h, $fn = 32);
    translate([-screw_d/2, screw_d/2,0]) cylinder(d=screw_hole+wall*2, h =h, $fn = 32);
    translate([-screw_d/2, -screw_d/2,0]) cylinder(d=screw_hole+wall*2, h = h, $fn = 32);
    }
    scale(1.02)translate([0,0,h/2-wall/2]) lock();
    
    translate([0,0,-3]) cylinder(d=d-wall*2,h=h*2);
    
    //screw holes
    translate([screw_d/2, screw_d/2,-1]) cylinder(d=screw_hole, h = h*2, $fn = 32);
    translate([screw_d/2, -screw_d/2, -1]) cylinder(d=screw_hole, h = h*2, $fn = 32);
    translate([-screw_d/2, screw_d/2,-1]) cylinder(d=screw_hole, h = h*2, $fn = 32);
    translate([-screw_d/2, -screw_d/2,-1]) cylinder(d=screw_hole, h = h*2, $fn = 32);
    
    translate([0,-100,-1])cube([1000,1000,1000]);
    }
    
}

valve();

