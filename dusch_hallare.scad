wall = 2.5;
difference() {
    union() {
        cylinder(d1=23+wall*2, d2 = 19+wall*2, h=40);
        translate([0,-45/2-20/2-wall,45/2]) rotate([0,90,0])cylinder(d=45, h=4);
        translate([0,-10-20/2-wall-4,0]) cube([4,15,35]);
    }
    cylinder(d1=23, d2 = 20, h=40);
    xx=17;
    translate([-xx/2,0,0]) cube([xx,15,45]);
    
    translate([0,-45/2-20/2-wall,45/2]) rotate([0,90,0])cylinder(d=32, h=4);
    
}