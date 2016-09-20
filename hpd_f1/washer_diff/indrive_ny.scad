$fn=64;

difference() {
    union() { 
        translate([-85.8,-100,0]) import("indrive.stl", convexity=10);
        extramaterial();
    }
    translate([0,0,3.5]) bricka();
    translate([0,0,3.5-1]) oring();
    translate([0,0,3.5+1.5]) kant();
}

module bricka() {
    difference() {
        
        cylinder(d=28, h=2.5);
        cylinder(d=15, h=2.6);
        translate([28/2-1.2,-10,0]) cube(20);
    }
}
module oring() {
    difference() {
        
        cylinder(d=19.5, h=2.5);
        cylinder(d=14.5, h=2.6);
        
    }
}

%translate([0,0,3.5]) bricka();
module extramaterial() {
    difference() {
        union() { 
            cylinder(d1=22, d2=30, h = 3.5);
            translate([0,0,3.5])cylinder(d=30, h = 1.5);
        }
        translate([0,0,-1])cylinder(d=20, h=10);
    }
}
module kant() {
    difference() {
        
        cylinder(d=30, h=2.5);
        cylinder(d=15, h=2.6);
        //translate([28/2-1.5,-10,0]) cube(20);
    }
}
//extramaterial();