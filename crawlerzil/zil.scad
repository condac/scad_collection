include <tunable_constants.scad>;

skala = 11;

translate([0,25,879/skala-20]) import("files/zil131_resized.stl", convexity=3);


translate([0,0,0]) tires();
translate([0,3350/skala,0]) tires();

translate([0,3350/skala+1250/skala,0]) tires();

%translate([0,280,0]) tires();
%translate([0,3350/10,0]) tires();
%translate([0,3350/12,0]) tires();

cube([10,137.5,10]);
cube([10,150,10]);

bredd = 1820/skala;
translate([-bredd/2,0,100]) cube([bredd,10,10]);

ko = 1067/skala;
translate([0,-ko,0]) cube([10,ko,10]);

rambak = (6900-1067)/skala;
translate([72/2,0,879/skala]) cube([10,rambak,10]);
translate([-72/2-10,0,879/skala]) cube([10,rambak,10]);

flaky = 3600/skala;
flakx = 2500/skala;

translate([-flakx/2,2190/skala,(1430/skala)]) cube([flakx, flaky, 3]);

servo();

motor();


module tires() {
    xx = 1820/skala;
    dia = 100;
    width = 40;
    translate([xx/2+width/2, 0,dia/2]) rotate([0,-90,0]) cylinder(d=dia, h=width);
    translate([-xx/2-width/2, 0,dia/2]) rotate([0,90,0]) cylinder(d=dia, h=width);
}

module servo() {
    
    union() {
        // Box and ears
        translate([0,0,0]) {
            cube([20.1, 39.9, 36.1], false);
            translate([1.1, -7.6, 26.6])
            {
                difference() {
                    cube([18, 7.6, 2.5]);
                    translate([4, 3.5, 0]) cylinder(100, 2);
                    translate([14, 3.5, 0]) cylinder(100, 2);
                }
            }

            translate([1.1, 39.9, 26.6])
            {
                difference() {
                    cube([18, 7.6, 2.5]);
                    translate([4, 4.5, 0]) cylinder(100, 2);
                    translate([14, 4.5, 0]) cylinder(100, 2);
                }
            }
        }

        // Main axle
        translate([10, 30, 36.1])
        {
            cylinder(r=6, h=0.4, $fn=30);
            cylinder(r=2.5, h=4.9, $fn=20);
        }
    }
    
}

module motor() {
    // skurvfäste 25mm
    zz = 50;
    cylinder(d=3.17, h=17);
    cylinder(d=13, h=4.5);
    translate([0,0,-zz]) cylinder(d=35.8, h=zz);
    
    translate([0,0,-zz-3]) cylinder(d=10.2, h=3);
}