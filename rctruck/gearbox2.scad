use <MCAD/involute_gears.scad>
fn=32;
fs=0.9;
pitch = 150;
pin_d = 3.5;
module motor() {
    union() {
        cylinder(r=35.5/2, h=50, $fs= fs);
        cylinder(r=3.175/2, h=68, $fs= fs);
    }
}
module pinion() {
    $fs=1;
    difference() {
        union() {

            translate([0,0,9.5]) gear (number_of_teeth=15, circular_pitch=pitch,gear_thickness = 9,rim_thickness = 9,hub_thickness = 9,bore_diameter=pin_d,circles=0, $fs= fs);
            hollow_cyl(d=3.2, w=4, h=9.5);
        }
        translate([-10,0,9/2]) rotate([0,90,0]) cylinder(d=2.9, h=20);
    }
}
module gears_1() {
    union() {
    gear (number_of_teeth=49, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=pin_d,
        circles=2, $fs= fs);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 9,
        rim_thickness = 9,
        hub_thickness = 9,
        bore_diameter=pin_d,
        circles=2, $fs= fs);
    }    
}
module gears_2() {
    union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=pin_d,
        circles=6, $fs= fs);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 9+6,
        rim_thickness = 9+6,
        hub_thickness = 9+6,
        bore_diameter=pin_d,
        circles=2, $fs= fs);
    }    
}
module gears_3() {
    union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=pin_d,
        circles=2, $fs= fs);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 17,
        rim_thickness = 17,
        hub_thickness = 17,
        bore_diameter=pin_d,
        circles=2, $fs= fs);
    }    
}
module diffgear() {
    difference() {
        gear (number_of_teeth=40, circular_pitch=pitch,        gear_thickness = 10,        rim_thickness = 10,        hub_thickness = 10,        bore_diameter=6.2,        circles=0, $fn=fn);
        diff_arms_cut();
    }
}
module pinholder() {
    difference() {
        cylinder(d=pin_d+5, h=4, $fn=fn);
        cylinder(d=pin_d, h=4, $fn=fn);
    }
    
}
module pinholder_cut() {
    
        translate([0,0,-0.5]) cylinder(d=pin_d, h=5, $fn=fn);

    
}
module pinholder_cut_6() {
        translate([0,0,-0.5]) cylinder(d=11, h=5, $fn=fn);
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
avst = 16.6667+6.25;
avst2 = 20.4167+6.25;
module all_gears() {
avst = 16.6667+6.25;
avst2 = 20.4167+6.25;

%translate([0,0,-8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.175,
        circles=2, $fn=fn);

translate([avst2,0,0]) rotate([0,180,0]) gears_1(); // /3.333 // gear1
translate([avst2,avst,-9])rotate([0,180,0]) gears_2(); // 8.66 // gear2
translate([avst2,avst,-9-9-5]) rotate([0,180,-45]) translate([avst,0,0]) diffgear();   // 22.5
//translate([avst2-avst,avst,-9-9-9-5]) rotate([0,180,-45]) translate([avst,0,0]) diffgear();                           // 58.5866666667 

//translate([avst2-avst,avst,-9-9-9-5 +55/2 -16/2]) rotate([0,180,-45]) translate([avst,0,0]) %cylinder(d=10, h = 55);
    
    translate([avst2,avst,-9-9-9-5 +6.1 ]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,180,0]) diff_arms();
    translate([avst2,avst,-9-9-9-5 -6.1-2 ]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,0]) diff_arms();
}
module holder() {
    $fs= 0.9;
    //baseplate
    difference() {
        translate([5,55,-60]) cube([25,3,65]);
        //material saving
        //translate([15,200,-(17-4)/2]) rotate([90,0,0]) cylinder(d=17-4, h=400); 
        //translate([15,200,-(50-4)/2-(17-4)/2-2]) rotate([90,0,0]) cylinder(d=50-4-17-4, h=400);
        translate([avst2,avst,-9-9-4]) rotate([0,180,-45]) translate([avst,0,0]) cylinder(r= 16.6667+1.5, h= 10);
    }
    //hull() {
    //    translate([1.5,55-25,-60-2.5+1]) cube([1.5,25+3,1.5]);
    //    translate([7,55-25,-53]) cube([1.5,25+3,1.5]);
    //}
    //translate([-4.5,53,-66]) cube([8,5,6]);
    //translate([-4.5,53,-20]) cube([8,5,6]);
    p1off = 0;
    difference() {
        hull() {
            translate([avst2,0,0])pinholder();
            translate([avst2,avst,0])pinholder();
            //translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            translate([0,55,0]) cube([30,3,4]);
        
        }
        translate([avst2,0,0])pinholder_cut();
        translate([avst2,avst,0])pinholder_cut();
        translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut_6();
    }
    p2off = 22;
    difference() {
        hull() {
            translate([avst2,0,-22])pinholder();
            translate([avst2,avst,-22+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            //translate([avst2-avst,avst,-22+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder();

            translate([0,55,-22]) cube([30,3,4]);
            translate([0,0,-22]) cylinder(d=35, h=4);
        }
        translate([avst2,0,-22])pinholder_cut();
        translate([avst2,avst,-22+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut();
        translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut_6();
        //translate([avst2-avst,avst,-22+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder_cut();
        translate([0,0,-22]) motor_cut();
        hull() {
            translate([avst2,avst,-22+4])rotate([0,180,0]) cylinder(d=18, h=4);
            translate([avst2+25,avst,-22+4])rotate([0,180,0]) cylinder(d=18, h=4);
        }
        //translate([avst2-avst,avst,-p2off+2]) rotate([0,180,-45]) translate([avst,0,0]) cylinder(d=30, h=3);
        //translate([avst2-avst,avst,-p2off+5]) rotate([0,180,-45]) translate([avst,0,0]) cylinder(d=15.5+3*2, h=3);
        // screw mount cuts
        //translate([avst2-avst,avst,-60+46]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,-45-180]) mount2_gb_cut();
        //translate([avst2-avst,avst,-60+46]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,-45-180]) mirror([0,1,0]) mount2_gb_cut();
        
    }
    p3off = 37;
    difference() {
        hull() {
            //translate([avst2,0,0])pinholder();
            translate([avst2,avst,-37])pinholder();
            //translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            translate([17,55,-37]) cube([13,3,4]);
        
        }
        translate([avst2,0,-37])pinholder_cut();
        translate([avst2,avst,-37])pinholder_cut();
        translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut_6();
        //translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut();
    }
    p4off = 53;
    difference() {
        hull() {
            //translate([avst2,0,-p4off])pinholder();
            //translate([avst2,avst,-p4off])pinholder();
            translate([avst2,avst,-p4off+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder();
            //translate([avst2-avst,avst,-p4off+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder();
            translate([10,55,-p4off]) cube([20,3,4]);
        }
        translate([avst2,0,-p4off])pinholder_cut();
        translate([avst2,avst,-p4off])pinholder_cut();
        translate([avst2,avst,-p4off+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut();
        translate([avst2,avst,0+4]) rotate([0,180,-45]) translate([avst,0,0]) pinholder_cut_6();
        //translate([avst2-avst,avst,-p4off+4]) rotate([0,180,-45]) translate([avst,0,0]) Bholder_cut();
        //translate([0,0,-100]) cylinder(d=40, h=200);
    }
    
    // screw mounts
    //translate([avst2-avst,avst,-60+46]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,-45-180]) mount2_gb();
    //translate([avst2-avst,avst,-60+46]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,-45-180]) mirror([0,1,0]) mount2_gb();
    
    //translate([avst2-avst,avst,-60]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,-45-180]) mount2_gb();
    //translate([avst2-avst,avst,-60]) rotate([0,180,-45]) translate([avst,0,0]) rotate([0,0,-45-180]) mirror([0,1,0]) mount2_gb();
    
}
module motor_cut() {
    $fs= 0.9;
    rotate([0,0,0]) translate([0,0,0])  union() {
        translate([0,-25/2,0]) cylinder(d=3, h=4, $fn=32);
        translate([0,25/2,0]) cylinder(d=3, h=4, $fn=32);
        hull() {
            translate([0,0,0]) cylinder(d=13, h=4);
            //translate([10,1.5+25/2,0]) cylinder(d=13, h=4);
        }
    }
}


module sakura_axle() {
    $fs= 0.9;
    sphere(d=6);
    translate([0,5,0]) rotate([90,0,0]) cylinder(d=2, h=10);
    cylinder(d=3.15, h=44);
    translate([0,5,44]) rotate([90,0,0]) cylinder(d=2, h=10);
    translate([0,0,44]) cylinder(d=10, h=3);
    translate([0,0,44+3]) cylinder(d1=10, d2=7, h=1.5);
    translate([0,5,44+15.5]) rotate([90,0,0]) cylinder(d=2, h=10);
    translate([0,0,44]) cylinder(d=5, h=17.5);
    translate([0,0,44]) cylinder(d=3,85, h=30);
}
module hollow_cyl(d, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d=d+w*2, h=h);
        translate([0,0,-1])cylinder(d=d, h=h+2);
    }
}
module hollow_cyl2(d1, d2, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d1=d1+w*2, d2=d2+w*2, h=h);
        translate([0,0,0])cylinder(d1=d1,d2=d2, h=h);
        //translate([0,0,-1])cylinder(d=d2, h=h+2);
    }
}
module hollow_cyl3(d1, d2, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d1=d1+w*2, d2=d2+w*2, h=h);
        
        translate([0,0,-1]) cylinder(d=d2, h=h+2);
    }
}
module mount() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 4;
    $fs= 0.9;
    difference() {
        cube([x,y,z]);
        translate([x/2,y-3,-1]) cylinder(d=3,h=z+2);
        translate([0,0,-1]) cylinder(d=12,h=z+2);
    }
}
module mount2() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 6;
    $fs= 0.9;
    difference() {
        cube([x,y,z]);
        translate([0,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z+2);
        translate([0,0,-1]) cylinder(d=16,h=z+2);
    }
}
module mount2_gb() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 6;
    $fs= 0.9;
    difference() {
        translate([x,0,0]) cube([x,y,z]);
        translate([x,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z+3);
        translate([0,0,-1]) cylinder(d=15.5+3*2+0,h=z+2);
    }
}
module mount2_gb_cut() {
    x = 8;
    y= 15;
    z = 6;
    $fs= 0.9;

    translate([x,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z+2+20);
    translate([x,y-3,z/2]) rotate([0,90,0]) cylinder(d=6,h=z+2+10);

}


module diff_arms() {
    $fs= 0.9;
    x = 20;
    ah = 45/2;
    slice = 2;
    difference() {
        union() {
            translate([-x/2, -x/2, 0]) cube([x,x,2]);
            cylinder(d=9.7, h= ah);
        }
        translate([0, 0, 10])cylinder(d=6.3, h= ah);
        translate([-slice/2, -10/2, 10]) cube([slice,10,20]);
        translate([0, 0, -5]) diff_arms_cut();
    }
}
module diff_arms_cut() {
    $fs= 0.9;
    x = 21;
    l = 5+3/2+3;
    rotate([0,0,45]) union() {
        translate([l, 0, -20])cylinder(d=3, h= 50);
        translate([-l, 0, -20])cylinder(d=3, h= 50);
        translate([0, l, -20])cylinder(d=3, h= 50);
        translate([0, -l, -20])cylinder(d=3, h= 50);
    }
    translate([-x/2, -x/2, 0]) cube([x,x,3.5]);

}



module display() {
    //motor_cut();
    rotate([0,-90,0]) holder();
    
    rotate([0,-90,0]) all_gears();
    rotate([0,-90,0]) translate([0,0,-75]) motor();

    
}
//display();
//turn_arm();
// ############################
// # Printer friendly
//rotate([180,0,0]) diffgear();
//rotate([180,0,0]) gears_2();
//diff_arms();
//rotate([0,90,0]) under_axle();
//rotate([0,-90,0]) up_axle();
//rotate([-90,0,0]) holder();
//turn_arm();
//rotate([0,180,0]) turn_hub();
//solid_adapter();
pinion();
