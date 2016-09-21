s_d = 4; // stångens diameter
f_d = 4;
tjock = 8.9;
$fn=64;

difference() {
    union(){
        hull() {
            cylinder(d=tjock, h=5);
            translate([tjock/2,0,tjock/2]) rotate([0,90,0]) cylinder(d=tjock, h=15);
        }
    }
    translate([tjock/2,0,tjock/2]) rotate([0,90,0]) cylinder(d=s_d, h=15);
    cylinder(d=f_d, h=15);
    translate([-tjock/2,-tjock/2,tjock/2]) cube(tjock);
    translate([-tjock/2+1,-tjock/2,11]) rotate([0,45,0])  cube(tjock);
    
}