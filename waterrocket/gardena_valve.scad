difference() {
    
    union() {
        rotate([-90,0,0]) import("WaterRocketNozzle.stl", convexity=10);
        translate([0,0,1]) cylinder(d=10, h=25);
        translate([0,0,1]) cylinder(d=17, h=7);
    }
    translate([0,0,1]) cylinder(d=8, h=25);
    translate([0,0,-49]) cylinder(d=50, h=50);
}