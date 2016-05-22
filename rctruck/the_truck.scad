
use <frame.scad>
use <wormtest.scad>
use <bevelaxle.scad>
fh = 55;
h_d = 110;
h_w = 48;
hex2hex = 192;
//%translate([0,-300,0]) f8x(600);
translate([0,-40,fh]) f8x(80);
translate([0,-40+80,fh]) f8x(160);
translate([0,-40+80+160,fh]) %f8x(80);
translate([0,-40-160,fh]) f8x(160);
//translate([0,-40-80-80,fh]) f8x(80);

wheelbase = 270;
translate([0,wheelbase/2,0]) hjul();
translate([0,-wheelbase/2,0]) hjul();
translate([0,wheelbase/2+130,0]) %hjul(); // 6x6



module hjul() {

    translate([hex2hex/2,0,0])  ett_hjul();
    translate([-hex2hex/2,0,0]) rotate([0,0,180]) ett_hjul();
    
    rotate([180,0,0])  rotate([0,90,0]) under_axle();
    rotate([180,0,0])  rotate([0,90,0]) up_axle();
}
module ett_hjul() {
    translate([-37,0,]) rotate([0,90,0]) difference() {
        cylinder(d=h_d, h = h_w);
    }
    
}
//ett_hjul();