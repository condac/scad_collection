// rc del för truckpeter

$fs = 0.1;

h1_l = 4; // längd från kanten till första hålen
h2_l = 4+18.5; // längd från kanten till andra hålen
h3_l = 4+20; // längd från kanten till tredje hålen

h1_w = 8.5; // avstånd mellan hålen
h2_w = 6;
h3_w = 13; // kanske typ 12.8

h1_d = 2;
h2_d = 2;
h3_d = 1.8;

h1_h = 100;

h11_d = 5; //hål 1 va ju lite mer hål i...
h11_h = 3;

h12_d = 2;
h12_h = 1.5;

h13_d = 4;
h13_h = 1.5;

c1_d = 6.5;
c1_h = h11_h + h12_h + h13_h;

x = 17;
y = 26;
z = 2;

union() {
    difference() {
        union() {
            translate([h1_w/2, h1_l, 0]) cylinder(d=c1_d, h=c1_h);
            translate([-h1_w/2, h1_l, 0]) cylinder(d=c1_d, h=c1_h);
            translate([-x/2, 0, 0]) cube([x, y, z]);
        }
        // Första hålen
        translate([h1_w/2, h1_l, 0]) cylinder(d=h1_d, h=h1_h);
        translate([-h1_w/2, h1_l, 0]) cylinder(d=h1_d, h=h1_h);
        
        translate([h1_w/2, h1_l, 0]) cylinder(d=h11_d, h=h11_h);
        translate([-h1_w/2, h1_l, 0]) cylinder(d=h11_d, h=h11_h);
        
        translate([h1_w/2, h1_l, h11_h]) cylinder(d=h12_d, h=h12_h);
        translate([-h1_w/2, h1_l, h11_h]) cylinder(d=h12_d, h=h12_h);
        
        translate([h1_w/2, h1_l, h11_h+h12_h]) cylinder(d=h13_d, h=h13_h);
        translate([-h1_w/2, h1_l, h11_h+h12_h]) cylinder(d=h13_d, h=h13_h);
        
        
        // Andra hålen
        translate([h2_w/2, h2_l, 0]) cylinder(d=h2_d, h=h1_h);
        translate([-h2_w/2, h2_l, 0]) cylinder(d=h2_d, h=h1_h);
        
        // tredje hålen
        translate([h3_w/2, h3_l, 0]) cylinder(d=h3_d, h=h1_h);
        translate([-h3_w/2, h3_l, 0]) cylinder(d=h3_d, h=h1_h);
        
    }

}

