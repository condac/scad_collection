m3 = 2.95;

r1_extradist = 1.5;
r1 = (10+r1_extradist)/2; // kullager

h1 = 5.15+0.3; 

r2 = 4;

zz = 3;


$fs = 0.5;
$fa = 5.1;

allt();

//krok();

module krok() {
    x1 = 34;
    x2 = 12;
    difference() {
        union() {
            translate([-x1/2 -x2/2,0,0]) cube([32+14, 6, 6]);
             translate([-x1/2 -x2/2,3,-9-6-4]) rotate([45,0,0]) cube([32+14, 6, 6]);
            translate([-x1/2 -x2/2,0,-9-6]) cube([x2/2, 6, 6*3]);
            translate([x1/2 +x2/2-6,0,-9-6]) cube([x2/2, 6, 6*3]);
        }
    }
    
}

module allt() {
    dist = 11+10;
    rotate([0,0,90]) translate([0,-3,0]) krok();
    translate([0,dist/2,23.5]) kul();
    translate([0,-dist/2,23.5]) kul();
    
    // pil
    %translate([0,0,18]) rotate([-90,0,0]) cylinder(d=5.5, h=20);
    %translate([0,-20,16]) rotate([-90,0,0]) cylinder(d=9.3, h=20);
}

module kul() {

    

    
    translate([0,-h1/2]) difference() {
        union() {
            %translate([r1,0,0]) rotate([-90,0,0]) cylinder(r=r1-r1_extradist/2, h=4);
            %translate([-r1,0,0]) rotate([-90,0,0]) cylinder(r=r1-r1_extradist/2, h=4);
            // höger
            hull() {
                translate([0,-zz,4]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
                translate([-r1,-zz,0]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
            }
            hull() {
                translate([r1,-zz,0]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
                translate([0,-zz,4]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
            }
            hull() {
                translate([r1,-zz,0]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
                translate([r1+8,-zz,-8]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
            }
            // vänster
            hull() {
                translate([0,h1,4]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
                translate([-r1,h1,0]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
            }
            hull() {
                translate([r1,h1,0]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
                translate([0,h1,4]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
            }
            hull() {
                translate([r1,h1,0]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
                translate([r1+8,h1,-8]) rotate([-90,0,0]) cylinder(r=r2, h=zz);
            }
            // tjockare
            hull() {
                translate([r1+8,-3,-8]) rotate([-90,0,0]) cylinder(r=r2, h=3+h1+3);
                translate([r1+8,-3,-r1-r2-11]) rotate([-90,0,0]) cylinder(r=r2, h=3+h1+3);
            }
            hull() {
                translate([r1+8,-3,-r1-r2-11]) rotate([-90,0,0]) cylinder(r=r2, h=3+h1+3);
                translate([0,-3,-r1-3-11]) rotate([-90,0,0]) cylinder(r=3, h=3+h1+3);
            }
            
        }
        translate([r1,-20,0]) rotate([-90,0,0]) cylinder(d=m3, h=40);
        translate([-r1,-20,0]) rotate([-90,0,0]) cylinder(d=m3, h=40);
    }
    
}


