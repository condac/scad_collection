// Created by Bengt "condac" for the OpenRC Tractor

$fa=0.1;
$fs=0.5;
C_M3_DIAMETER = 3.5;

link_h = 3;
link_d = 5;

mount_d= 9;
mount_h = 3;
mount_hole = 3.3;

//steering_link_twisted(link_length = 50);
//translate([10,0,0]) steering_link_twisted(link_length = 60);

translate([10,0,0]) custom_link(link_length = 55);
translate([20,0,0]) custom_link(link_length = 55);
translate([30,0,0]) custom_link(link_length = 25);

module steering_link_twisted(link_length = 51) {
    difference() {
        union() {
            hull() {
                translate([0, 0, 0])cylinder(d=link_d, h=link_h);
                translate([0, link_length/2, 0])  cylinder(d=link_d, h=link_h);
            }
            hull() {
                translate([0, link_length, link_d/2]) rotate([0,90,0])  cylinder(d=link_d, h=link_h);
                translate([0, link_length/2, 0])  cylinder(d=link_d, h=link_h);
            }

            
            translate([0, 0, 0]) cylinder(d=mount_d, h=mount_h);
            translate([0, link_length, mount_d/2]) rotate([0,90,0]) cylinder(d=mount_d, h=mount_h);
        }
        allScrews_twisted(link_l = link_length);
    }
}

%allScrews();
module allScrews_twisted(link_l =51) {

            translate([0, 0, 0]) cylinder(d=C_M3_DIAMETER, h=mount_h);
            translate([-mount_h, link_l, mount_d/2]) rotate([0,90,0]) cylinder(d=C_M3_DIAMETER, h=mount_h*5);
}
module allScrews(link_l =51) {

            translate([0, 0, 0]) cylinder(d=C_M3_DIAMETER, h=mount_h);
            translate([0, link_l, 0]) cylinder(d=C_M3_DIAMETER, h=mount_h*5);
}

module custom_link(link_length = 51) {
    difference() {
        union() {
            hull() {
                translate([0, 0, 0])cylinder(d=link_d, h=link_h);
                translate([0, link_length/2, 0])  cylinder(d=link_d, h=link_h);
            }
            hull() {
                translate([0, link_length, 0]) cylinder(d=link_d, h=link_h);
                translate([0, link_length/2, 0])  cylinder(d=link_d, h=link_h);
            }

            
            translate([0, 0, 0]) cylinder(d=mount_d, h=mount_h);
            translate([0, link_length, ]) cylinder(d=mount_d, h=mount_h);
        }
        allScrews(link_l = link_length);
    }
}