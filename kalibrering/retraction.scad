//

dist = 20; // Distance between poles

dd = 4; //diameter of poles

wall = 10; 

hh = 15;

$fn= 32;
union() {
hull() {
    cylinder(d=wall, h=0.5);
    translate([dist,0,0])cylinder(d=wall, h=0.5);
}
    cylinder(d=dd, h=hh);
    translate([dist,0,0])cylinder(d=dd, h=hh);
}