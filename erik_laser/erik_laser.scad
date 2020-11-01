led_d = 5.1;

main_d = 35;
main_l = 135;
button_d = 12;

cone_l = 20;
wall = 1.5;

aa_h = 60;

screw_d = 2.85;
screw_hole = 3.1;
screw_head = 6;
screw_base = 10;
screw_h1 = screw_base/2;
screw_h2 = screw_base/2 +screw_base + aa_h;
button_h = screw_h2+20;

$fs = 0.5;
$fa = 5.1;



base();
translate([main_d+wall*2, 0,0]) lid();

module base() {
    difference() {
        union() {
            main_half();
            translate([0,0,screw_base/2]) rotate([90]) screwpart1();
            translate([0,0,screw_h2]) rotate([90]) screwpart1();
            translate([0,0,screw_base])batteryholder();
            translate([0,0,main_l-cone_l-5-27]) dc2dc();
            
        }
        translate([0,-main_d/2 +1,button_h]) rotate([-90]) stor_knapp();
    }
    translate([0,-main_d/2 +1,button_h]) rotate([-90]) %stor_knapp();
}


module lid() {
    union() {
        difference() {
            main_half();
            translate([0,0,screw_base/2]) rotate([90]) cylinder(d=screw_head, h= 100);
            translate([0,0,screw_h2]) rotate([90]) cylinder(d=screw_head, h= 100);
        }
        translate([0,0,screw_base/2]) rotate([90]) screwpart2();
        translate([0,0,screw_h2]) rotate([90]) screwpart2();
    }
}

module screwpart1() {
    difference() {
        cylinder(d=screw_base, h=main_d/2-wall);
        cylinder(d=screw_d, h=main_d/2-wall*2);
    }
}
module screwpart2() {
    difference() {
        cylinder(d=screw_base, h=main_d/2-wall);
        cylinder(d=screw_hole, h=main_d/2-wall*2);
        translate([0,0,2]) cylinder(d=screw_head, h=main_d/2-wall*2);
    }
}
module main_half() {
    difference() {
        main();
        translate([-100,0,-1]) cube([200, 200, 200]);
    }
}

module main() {
    difference() {
        union() {
            rotate([0,0,45/2]) cylinder(d=main_d, h= main_l, $fn=8);
            translate([0,-main_d/2 +1.35,button_h]) rotate([-90])roundedBox2([19,19,19],3);
        }
        translate([0,0,main_l-cone_l]) rotate([0,0,45/2])cylinder(d1=led_d, d2=main_d-1, h= cone_l+1, $fn=8);
        
        translate([0,0,wall]) rotate([0,0,45/2])cylinder(d=main_d-wall*2, h= main_l-cone_l-5, $fn=8);
        translate([0,0,main_l-cone_l-6]) cylinder(d=led_d, h= main_l);
    }
}

module batteryholder() {
    
    %cube([13,13,57]);
}

module dc2dc() {
    
    %cube([19,7,27]);
}

module stor_knapp() {
    dd = 16;
    d2 = 19;
    xx = 18;
    translate([-xx/2, -xx/2, -2]) cube([xx, xx, 2]);
    cylinder(d=dd, h = 18);
    cylinder(d=dd-4, h = 18+5);
}

module roundedBox(dimentions, radius) {
    depth = dimentions[0];
    width = dimentions[1];
    height = dimentions[2];

    translate([-depth/2, -width/2, -height/2+radius]) hull() {
        translate([0, width, height]) sphere(r=radius);
        translate([depth, 0, height]) sphere(r=radius);
        translate([0, 0, height]) sphere(r=radius);
        translate([depth, width, height]) sphere(r=radius);

        translate([0, width, 0]) sphere(r=radius);
        translate([depth, 0, 0]) sphere(r=radius);
        translate([0, 0, 0]) sphere(r=radius);
        translate([depth, width, 0]) sphere(r=radius);
    }
}
module roundedBox2(dimentions, radius) {
    depth = dimentions[0];
    width = dimentions[1];
    height = dimentions[2];

    translate([-depth/2, -width/2, 0]) hull() {
        translate([radius, width-radius, 0]) cylinder(r=radius, h=height);
        translate([depth-radius, radius, 0]) cylinder(r=radius, h=height);
        translate([radius, radius, 0]) cylinder(r=radius, h=height);
        translate([depth-radius, width-radius, 0]) cylinder(r=radius, h=height);

    }
}