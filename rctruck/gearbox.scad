use <frame.scad>
//fn=32;
$fs=0.9;

output_h = -10;

module display() {
    translate([0,-70,0]) f8x(100);

translate([0,0,output_h]) rotate([90,0,0]) %cylinder(d=50, h=4.5); // main gear
//translate([0,10,output_h]) rotate([90,0,0]) %cylinder(d=20, h=20); // main gear
translate([0,-4.5,output_h]) rotate([90,0,0]) gear_holder();
translate([0,0,output_h]) rotate([-90,0,0]) gear_holder();
translate([0, -60-5, output_h+46/2+14/2]) rotate([-90,0,0]) %motor();
    translate([0,-10,output_h]) rotate([90,0,0]) motormount();
translate([0,10,output_h]) rotate([90,0,0]) cover1();
}
//gear_holder();
//motormount();
display();
//cover1();
module gear_holder() {
    
    screw_dist = 16.5/2;
    screw_d = 2.9;
    xx = 25;
    shaft = 9.9;
    hh=2;
    wall= 3;
    h_round = 13;
    h_square = 10;
    
    difference() {
        union() {
            //translate([-xx/2,-xx/2,0]) cube([xx,xx,2]);
            hull() {
                translate([screw_dist,screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d+wall, h=hh); 
                translate([-screw_dist,screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d+wall, h=hh); 
                translate([screw_dist,-screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d+wall, h=hh); 
                translate([-screw_dist,-screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d+wall, h=hh); 
            }
            translate([0,0,0]) rotate([0,0,0]) cylinder(d=shaft, h=h_round); 
            translate([0,0,h_round]) rotate([0,0,0]) cylinder(d=shaft, h=h_square, $fn=4);
        }
        translate([screw_dist,screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d, h=20); 
        translate([-screw_dist,screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d, h=20); 
        translate([screw_dist,-screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d, h=20); 
        translate([-screw_dist,-screw_dist,0]) rotate([0,0,0]) cylinder(d=screw_d, h=20); 
    }
    
}

module cover1() {
    frame_w = 60-4-4-1;
    bearing_d = 15.5;
    plate = 3;
    difference() {
        union() {
            hull() {
                cylinder(d=20, h=4);
                //translate([0,46/2+14/2,0]) cylinder(d=35, h=4);
                //translate([ frame_w/2-10, 14, 0]) cube([10,10,plate]);
                //translate([ -frame_w/2, 14, 0]) cube([10,10,plate]);
                translate([20,-20,0]) cylinder(d=6, h=4);
                translate([-20,-20,0]) cylinder(d=6, h=4);
                translate([20,20,0]) cylinder(d=6, h=4);
                translate([-20,20,0]) cylinder(d=6, h=4);
            }
            //translate([ frame_w/2-8, 14, 0]) cube([8,10,30]);
            //translate([ -frame_w/2, 14, 0]) cube([8,10,30]);
            cylinder(d=20, h=5);
            translate([20,-20,0]) cylinder(d=6, h=20);
            translate([-20,-20,0]) cylinder(d=6, h=20);
            translate([20,20,0]) cylinder(d=6, h=20);
            translate([-20,20,0]) cylinder(d=6, h=20);
        }
        translate([0,0,1]) cylinder(d=bearing_d, h=4);
        cylinder(d=bearing_d-1, h=10);
        
        
        translate([0,46/2+14/2,0]) rotate([0,0,90]) motor_cut();
        
        translate([20,-20,0]) cylinder(d=3.2, h=200);
        translate([-20,-20,0]) cylinder(d=3.2, h=200);
        translate([20,20,0]) cylinder(d=3.2, h=200);
        translate([-20,20,0]) cylinder(d=3.2, h=200);
    }
}
module motormount() {
    frame_w = 60-4-4-1;
    bearing_d = 15.5;
    plate = 4;
    difference() {
        union() {
            hull() {
                cylinder(d=20, h=4);
                translate([0,46/2+14/2,0]) cylinder(d=35, h=4);
                translate([ frame_w/2-10, 14, 0]) cube([10,10,plate]);
                translate([ -frame_w/2, 14, 0]) cube([10,10,plate]);
                translate([20,-20,0]) cylinder(d=6, h=4);
                translate([-20,-20,0]) cylinder(d=6, h=4);
            }
            translate([ frame_w/2-8, 14, 0]) cube([8,10,30]);
            translate([ -frame_w/2, 14, 0]) cube([8,10,30]);
            cylinder(d=20, h=5);
        }
        cylinder(d=bearing_d, h=4);
        cylinder(d=bearing_d-1, h=10);
        for (a =[5:5:30]) {
            translate([ -frame_w/2, 14+5, a]) rotate([0,90,0]) cylinder(d=2.9, h=9);
            translate([ frame_w/2-9, 14+5, a]) rotate([0,90,0]) cylinder(d=2.9, h=9);
        }
        
        translate([0,46/2+14/2,0]) rotate([0,0,90]) motor_cut();
        
        translate([20,-20,0]) cylinder(d=3, h=4);
        translate([-20,-20,0]) cylinder(d=3, h=4);
        translate([20,20,0]) cylinder(d=3, h=20);
        translate([-20,20,0]) cylinder(d=3, h=20);
    }
}

module motor() {
    union() {
        cylinder(r=35.5/2, h=50);
        cylinder(r=3.175/2, h=68);
    }
}
module motor_cut() {
    $fs= 0.9;
    rotate([0,0,0]) translate([0,0,0])  union() {
        hull() {
            translate([-5,-25/2,0]) cylinder(d=3, h=4, $fn=32);
            translate([5,-25/2,0]) cylinder(d=3, h=4, $fn=32);
        }
        hull() {
            translate([-5,25/2,0]) cylinder(d=3, h=4, $fn=32);
            translate([5,25/2,0]) cylinder(d=3, h=4, $fn=32);
        }
        translate([0,-25/2,0]) cylinder(d=3, h=4, $fn=32);
        translate([0,25/2,0]) cylinder(d=3, h=4, $fn=32);
        hull() {
            translate([-5,0,0]) cylinder(d=13, h=4);
            translate([10,0,0]) cylinder(d=13, h=4);
        }
    }
}