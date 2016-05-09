use <MCAD/involute_gears.scad>
fn=32;
pitch = 150;
pin_d = 3.2;
module motor() {
    union() {
        cylinder(r=35.5/2, h=50, $fn=fn);
        cylinder(r=3.175/2, h=68, $fn=fn);
    }
}
translate([0,0,-70]) motor();
module gears() {
    union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=pin_d,
        circles=2, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 9,
        rim_thickness = 9,
        hub_thickness = 9,
        bore_diameter=pin_d,
        circles=2, $fn=fn);
    }    
}
module gears_2() {
    union() {
    gear (number_of_teeth=50, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=pin_d,
        circles=6, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 9,
        rim_thickness = 9,
        hub_thickness = 9,
        bore_diameter=pin_d,
        circles=2, $fn=fn);
    }    
}
module gears_3() {
    union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=pin_d,
        circles=2, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 17,
        rim_thickness = 17,
        hub_thickness = 17,
        bore_diameter=pin_d,
        circles=2, $fn=fn);
    }    
}
module pinholder() {
    difference() {
        cylinder(d=pin_d+5, h=4, $fn=fn);
        cylinder(d=pin_d, h=4, $fn=fn);
    }
    
}
module pinholder_cut() {
    
        cylinder(d=pin_d, h=4, $fn=fn);

    
}
module Bholder() {
    difference() {
        cylinder(d=15+4, h=4, $fn=fn);
        cylinder(d=15, h=4, $fn=fn);
    }
    
}
module Bholder_cut() {
    
        cylinder(d=15, h=4, $fn=fn);

    
}

module all_gears() {
avst = 16.6667+6.25;
avst2 = 22.9167+6.25;

%translate([0,0,-8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.175,
        circles=2, $fn=fn);

translate([avst2,0,0]) rotate([0,180,0]) gears_2(); // /3.333 // gear1
translate([avst2,avst,-9])rotate([0,180,0]) gears(); // 8.66 // gear2
translate([avst2,avst,-9-9]) rotate([0,180,-45]) translate([avst,0,0]) gears_3();   // 22.5
translate([avst2-avst,avst,-9-9-9]) rotate([0,180,-45]) translate([avst,0,0]) gear (number_of_teeth=40, circular_pitch=pitch,        gear_thickness = 16,        rim_thickness = 16,        hub_thickness = 16,        bore_diameter=6.2,        circles=4, $fn=fn);                           // 58.5866666667 

translate([avst2-avst,avst,-9-9-9 +55/2 -16/2]) rotate([0,180,-45]) translate([avst,0,0]) cylinder(d=10, h = 55);
}
module holder() {
    translate([0,60,-50]) cube([30,3,54]);
    difference() {
        hull() {
            translate([avst2,0,0])pinholder();
            translate([avst2,avst,0])pinholder();
            translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            translate([0,60,0]) cube([30,3,4]);
        
        }
        translate([avst2,0,0])pinholder_cut();
        translate([avst2,avst,0])pinholder_cut();
        translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut();
    }
    
    difference() {
        hull() {
            translate([avst2,0,-50])pinholder();
            translate([avst2,avst,-50])pinholder();
            translate([avst2,avst,-50+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            translate([avst2-avst,avst,-50+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder();
            translate([0,60,-50]) cube([30,3,4]);
        }
        translate([avst2,0,-50])pinholder_cut();
        translate([avst2,avst,-50])pinholder_cut();
        translate([avst2,avst,-50+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut();
        translate([avst2-avst,avst,-50+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder_cut();
        translate([0,0,-100]) cylinder(d=45, h=200);
    }
    difference() {
        hull() {
            translate([avst2,avst,-17+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            translate([avst2-avst,avst,-17+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder();

            translate([0,60,-17]) cube([30,3,4]);
            translate([0,0,-17]) cylinder(d=35, h=4);
        }

        translate([avst2,avst,-17+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut();
        translate([avst2-avst,avst,-17+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder_cut();
        translate([0,0,-17]) motor_cut();
        translate([avst2,avst,-17+4])rotate([0,180,0]) cylinder(d=38, h=4);
    }
}
module motor_cut() {
    rotate([0,0,-45]) translate([-5,-25/2 -1.5,0])  union() {
        translate([0,0,0]) cube([10,3,4]);
        translate([0,25,0]) cube([10,3,4]);
    }
}
//motor_cut();
holder();


