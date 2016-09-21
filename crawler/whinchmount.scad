screw_dist = 26;
frame_w = 70;

screw_d = 2.1;

$fn=32;


difference() {
    union() {
        translate([-frame_w/2,0,0]) cube([frame_w, 10, 8]);
        
    }
    
    translate([-screw_dist/2,5,0]) cylinder(d=screw_d, h=10);
    translate([screw_dist/2,5,0]) cylinder(d=screw_d, h=10);
    
    translate([-screw_dist/2,5,2]) cylinder(d=5, h=10);
    translate([screw_dist/2,5,2]) cylinder(d=5, h=10);
    
    translate([-frame_w/2+15,5,4]) rotate([0,-90,0]) cylinder(d=2.9, h=100);
    translate([frame_w/2-15,5,4]) rotate([0,90,0]) cylinder(d=2.9, h=100);
}