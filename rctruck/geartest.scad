use <MCAD/involute_gears.scad>
fn=32;
pitch = 150;

module motor() {
    union() {
        cylinder(r=35.5/2, h=50, $fn=fn);
        cylinder(r=3.175/2, h=68, $fn=fn);
    }
}
translate([0,0,-60]) motor();
module gears() {
    union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.175,
        circles=2, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 9,
        rim_thickness = 9,
        hub_thickness = 9,
        bore_diameter=3.2,
        circles=2, $fn=fn);
    }    
}
module gears_2() {
    union() {
    gear (number_of_teeth=50, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.2,
        circles=6, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 9,
        rim_thickness = 9,
        hub_thickness = 9,
        bore_diameter=3.2,
        circles=2, $fn=fn);
    }    
}
module gears_3() {
    union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.2,
        circles=2, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 17,
        rim_thickness = 17,
        hub_thickness = 17,
        bore_diameter=3.2,
        circles=2, $fn=fn);
    }    
}
avst = 16.6667+6.25;
avst2 = 22.9167+6.25;

translate([0,0,-8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.175,
        circles=2, $fn=fn);

translate([avst2,0,0]) rotate([0,180,0]) gears_2(); // /3.333
translate([avst2,avst,-9])rotate([0,180,0])gears(); // 8.66
translate([avst2,avst,-9-9]) rotate([0,180,-45]) translate([avst,0,0]) gears_3();   // 22.5
translate([avst2-avst,avst,-9-9-9]) rotate([0,180,-45]) translate([avst,0,0]) gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 16,
        rim_thickness = 16,
        hub_thickness = 16,
        bore_diameter=6.2,
        circles=4, $fn=fn);                           // 58.5866666667 

translate([avst2-avst,avst,-9-9-9 +55/2 -16/2]) rotate([0,180,-45]) translate([avst,0,0]) cylinder(d=10, h = 55);