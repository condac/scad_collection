w = 11;
l = 15;
h = 3;
nut = 7-0.4;
nut_h =1.5;
dist = 1;
skruv = 3;

difference () {
    cube([l,w,h]);
    translate([0,0,dist]) rotate([45,0,0]) cube([20,20,20]);
    translate([0,w,dist]) rotate([45,0,0]) cube([20,20,20]);
    translate([l/2,w/2,nut_h]) cylinder(d=nut,h=h*5, $fn=6);
    translate([l/2,w/2,-1]) cylinder(d=skruv,h=h*5, $fn=100);
}