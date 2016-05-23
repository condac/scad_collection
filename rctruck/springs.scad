
use <frame.scad>
use <wormtest.scad>
use <bevelaxle.scad>
fh = 55;
h_d = 110;
h_w = 48;
hex2hex = 192;

module spring_display() {
    //%translate([0,-300,0]) f8x(600);
    translate([0,-40,fh]) f8x(80);
    translate([0,-40+80,fh]) f8x(160);
    translate([0,-40+80+160,fh]) %f8x(80);
    translate([0,-40-160,fh]) f8x(160);
    //translate([0,-40-80-80,fh]) f8x(80);

    wheelbase = 270;
    translate([0,-130/2,0]) hjul();

    translate([0,130/2,0]) %hjul(); // 6x6
    translate([40,0,20]) rotate([0,90,0]) spring();
    translate([-40,0,20]) rotate([0,90,0]) spring();
    translate([40,0,70]) rotate([-90,0,0]) rotate([0,90,0])  spring_mount();
    translate([44,0,20]) rotate([-90,0,0]) rotate([0,90,0]) rotate([0,0,25])  link(60,2);

}
//spring_display();
// Printer friendly:
translate([15,10,0]) spring_mount();
spring();
translate([15,0,0])rotate([0,0,-90]) link(60,2);
translate([25,0,0])rotate([0,0,-90]) link(60,2);


module hjul() {

    //translate([hex2hex/2,0,0])  ett_hjul();
    //translate([-hex2hex/2,0,0]) rotate([0,0,180]) ett_hjul();
    
    rotate([180,0,0])  rotate([0,90,0]) dual_axle();
    rotate([180,0,0])  rotate([0,90,0]) up_axle();
}
module ett_hjul() {
    translate([-37,0,]) rotate([0,90,0]) difference() {
        cylinder(d=h_d, h = h_w);
    }
    
}
//ett_hjul();

module spring() {
    cut_x = 242;
    hh = 5;
    translate([cut_x, 0,0]) difference() {
        hollow_cyl(d=500, w=2, h=hh, $fa=2);
        translate([-cut_x, -500, -1]) cube(1000);
    }
    translate([cut_x-3, 0,0]) difference() {
        hollow_cyl(d=500, w=2, h=hh, $fa=2);
        translate([-cut_x-2, -500, -1]) cube(1000);
    }
    translate([2,130/2,0]) hollow_cyl(d=3,w=3, h=hh);
    translate([2,-130/2,0]) hollow_cyl(d=3,w=3, h=hh);
    translate([-15,0,0]) hollow_cyl(d=3.1,w=5, h=hh);
}
module spring_mount() {

     $fs= 0.9;
    hole = 3;
    wall = 2;
    thick = 3;
    difference() {
        hull() {    
            translate([10,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([-10,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,50,0]) hollow_cyl(d=hole, w=wall, h=thick);
        }
        //translate([0,0,-1]) cylinder(d=19, h=thick*2);
        translate([10,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([-10,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([0,50,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5-5,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5-5-5,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5-5-5-5,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5-5-5-5-5,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5-5-5-5-5-5,0]) cylinder(d=hole, h=thick*2);
        translate([0,50-5-5-5-5-5-5-5,0]) cylinder(d=hole, h=thick*2);
    }
    //translate([0,50,0]) hollow_cyl(d=hole, w=wall, h=13+thick);

}

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

