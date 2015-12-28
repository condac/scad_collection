h = 25;
skruv = 2.9;
tjock = 8;
l = 30;
vinkel = 10;

difference() {
    hull() {
        cylinder(d=tjock, h = h*2, $fn=64);
        translate([l,0,0]) cylinder(d=tjock, h = h*2, $fn=64);
        
    }
    cylinder(d=skruv, h = h*2, $fn=64);
    translate([l,0,0]) cylinder(d=skruv, h = h*2, $fn=64);
    translate([-tjock,-l,h]) rotate([0,-vinkel,0]) cube(l*2,l*2,h*3);
    
}