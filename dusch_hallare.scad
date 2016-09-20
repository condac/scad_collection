wall = 3;
stor_d = 23;
liten_d = 18;
difference() {
    union() {
        cylinder(d1=stor_d+wall*2, d2 = liten_d+wall*2, h=40);
        translate([0,-45/2-20/2-wall,45/2]) rotate([0,90,0])cylinder(d=45, h=4);
        translate([0,-10-20/2-wall-4,0]) cube([4,15,35]);
    }
    cylinder(d1=stor_d, d2 = liten_d, h=40);
    xx=14;
    translate([-xx/2,0,0]) cube([xx,15,45]);
    
    translate([-1,-45/2-20/2-wall,45/2]) rotate([0,90,0])cylinder(d=32, h=6);
    
}