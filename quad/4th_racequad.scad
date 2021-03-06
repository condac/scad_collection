// Quadcopter by Bengt "condac" 2016
include <oshw.scad>;

//resolution
$fs=0.5;
$fa=9;

// Screw holes
screw_d = 2.95;

//Main plate 
p1_x = 58;
p1_y = 160;
p1_z = 2.5;

//Upper plate
p2_x = 58;
p2_y = 160;
p2_z = 2.5;

// lower plate
p3_x = 60;
p3_y = 110;
p3_z = 2.5;

// spacer 
large_spacer = 35;
under_spacer = 8;

prop_d = 127; // 5inch 127mm
prop6_d = 152.4; // 6inch 152.4mm
prop_arm = 11.5+ prop_d/2;

//Motor diameter
motor_d = 36;

front_mount_x = 38;
front_mount_y = 30;
front_mount_angle = 40;
back_mount_x = 38;
back_mount_y = -30;
back_mount_angle = -40;

arm_mount_x = 20;
arm_mount_y = 20;

 p1();
 translate([0,0,p1_z+large_spacer]) p2();
 translate([0,0,-p3_z-under_spacer]) p3();

% translate([0,-50,15]) rotate([0,90,0]) rotate([0,0,90]) x8r();
% translate([0,50,0]) rotate([0,0,90]) x8r();
%naze32();
translate([0,0,-10]) %d250();
translate([0,0,large_spacer+p1_z+p2_z]) rotate([0,0,90]) %battery();

translate([0,80,p1_z+32/2]) rotate([90,0,0]) %camera();

translate([0,0,-15])props();
translate([0,0,-under_spacer]) color("red") %arms_hover();

module props() {
    translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle]) translate([prop_arm,0,0])%prop();
translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle]) translate([prop_arm,0,0]) %prop();
        
translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle]) translate([prop_arm,0,0]) %prop();
translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle]) translate([prop_arm,0,0]) %prop();
}

module arms() {
    translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle]) arm();
translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle]) arm();
        
translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])  arm();
translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle]) arm();
    
}
module arms_hover() {
    translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle]) arm_hover();
translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle]) arm_hover();
        
translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])  arm_hover();
translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle]) arm_hover();
    
}
module arm_hover() {
    rotate([0,0,90]) translate([-16,-92,0]) import("arm-v3.STL", convexity=10);
    
}
module p1() {
    difference() {
        union() {
            translate([-p1_x/2, -p1_y/2, 0]) roundedcube(p1_x, p1_y, p1_z, 5);
            
            hull() {
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount(p1_z);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount(p1_z);
                
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount(p1_z);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount(p1_z);
            }
        }
         translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount_cut(p1_z);
        translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount_cut(p1_z);
        
        translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount_cut(p1_z);
        translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount_cut(p1_z);
        
        naze_cut();
        pole_cut();
        rounded_cut();
        
        //Battery straps
        translate([p2_x/2-6,40,-1]) slot(3,25,5);
        translate([-p2_x/2+6,40,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-40-25,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-40-25,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-25/2,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-25/2,-1]) slot(3,25,5);
        
        //round holes
        translate([0,0,-1]) cylinder(d=10, h=10);
        translate([0,70,-1]) cylinder(d=10, h=10);
        translate([0,-70,-1]) cylinder(d=10, h=10);
        translate([0,50,-1]) cylinder(d=10, h=10);
        translate([0,-50,-1]) cylinder(d=10, h=10);
        
        translate([36/2,70,-1]) cylinder(d=3, h=10);
        translate([-36/2,70,-1]) cylinder(d=3, h=10);
        // vertical slots
        l = 25;
        translate([l/2,60,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-60,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,40,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-40,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,20,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-20,-1]) rotate([0,0,90]) slot(3,l,5);
        
        
    }
}

module p2() {
    //Upper board
    difference() {
        translate([-p2_x/2, -p2_y/2, 0]) roundedcube(p2_x, p2_y, p2_z, 5);
        naze_cut();
        pole_cut();
        //Battery straps
        translate([p2_x/2-6,40,-1]) slot(3,25,5);
        translate([-p2_x/2+6,40,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-40-25,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-40-25,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-25/2,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-25/2,-1]) slot(3,25,5);
        
        //round holes
        translate([0,0,-1]) cylinder(d=10, h=10);
        translate([0,70,-1]) cylinder(d=10, h=10);
        translate([0,-70,-1]) cylinder(d=10, h=10);
        translate([0,50,-1]) cylinder(d=10, h=10);
        translate([0,-50,-1]) cylinder(d=10, h=10);
        
        translate([36/2,70,-1]) cylinder(d=3, h=10);
        translate([-36/2,70,-1]) cylinder(d=3, h=10);
        
        // vertical slots
        l = 25;
        translate([l/2,60,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-60,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,40,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-40,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,20,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-20,-1]) rotate([0,0,90]) slot(3,l,5);
        
    }

}

module p3() {
    //Power board
    difference() {
        union() {
            translate([-p3_x/2, -p3_y/2, 0]) roundedcube(p3_x, p3_y, p3_z, 5);
            
            hull() {
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount(p3_z);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount(p3_z);
                
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount(p3_z);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount(p3_z);
            }
        }
         translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount_cut(p3_z);
        translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount_cut(p3_z);
        
        translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount_cut(p3_z);
        translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount_cut(p3_z);
        
        naze_cut();
        pole_cut(9); 
        rounded_cut();
        
        //ESC mounts
        temp_l = 25;
        translate([0,20,-1]) slot(3,temp_l,5);
        translate([20,20,-1]) slot(3,temp_l,5);
        translate([-20,20,-1]) slot(3,temp_l,5);
        translate([0,-20-temp_l,-1]) slot(3,temp_l,5);
        translate([20,-20-temp_l,-1]) slot(3,temp_l,5);
        translate([-20,-20-temp_l,-1]) slot(3,temp_l,5);
        
    }

}
module slot(d,l,h) {
    rotate([0,0,90]) hull() {
        translate([0,0,0]) cylinder(d=d, h=h, $fn=16);
        translate([l,0,0])cylinder(d=d, h=h, $fn=16);
    }
    
}
module pole_cut(in=3) {
    
        d=in;
   
    fn = 16;
    c1 = 30;
    c2 = 75;
    
    translate([p2_x/2-6,c1,-1]) cylinder(d=d, h=10, $fn=fn);
    translate([-p2_x/2+6,c1,-1]) cylinder(d=d, h=10, $fn=fn);
    translate([p2_x/2-6,-c1,-1]) cylinder(d=d, h=10, $fn=fn);
    translate([-p2_x/2+6,-c1,-1]) cylinder(d=d, h=10, $fn=fn);
    
    translate([p2_x/2-6,c2,-1]) cylinder(d=d, h=10, $fn=fn);
    translate([-p2_x/2+6,c2,-1]) cylinder(d=d, h=10, $fn=fn);
    translate([p2_x/2-6,-c2,-1]) cylinder(d=d, h=10, $fn=fn);
    translate([-p2_x/2+6,-c2,-1]) cylinder(d=d, h=10, $fn=fn);
}

module rounded_cut() {
    d = 50;
    translate([p1_x/2+d/2,0,-1]) cylinder(d=d, h= 10);
    translate([-p1_x/2-d/2,0,-1]) cylinder(d=d, h= 10);
}
module arm() {
    a_x = prop_arm;
    a_y = 20;
    a_z = 3;
    
    difference() {
        union() {
            arm_mount(under_spacer);
            translate([0,-a_y/2,0]) cube([a_x,a_y,a_z]);
            translate([prop_arm,0,0]) cylinder(d=motor_d, h=a_z);
        }
        arm_mount_cut(under_spacer);
    }
}
module arm_mount(in_z) {
    
    translate([-arm_mount_x/2, -arm_mount_y/2, 0]) roundedcube(arm_mount_x, arm_mount_y, in_z, 3);
}
module arm_mount_cut(in_z) {
    screw_d = 8;
    off = 4;
    translate([off,0,-1]) cylinder(d=3, h=10, $fn=16);
    translate([off-screw_d,0,-1]) cylinder(d=3, h=10, $fn=16);
}

module naze_cut() {
    mount_holes();
    /*
    cut_l = 10;
    cut_off = 13;
    translate(0,0,-1) union() {
        rotate([0,0,45]) hull() {
            translate([cut_off,0,0]) cylinder(d=3, h=10);
            translate([cut_off+cut_l,0,0])cylinder(d=3, h=10);
        }
        rotate([0,0,45+90]) hull() {
            translate([cut_off,0,0]) cylinder(d=3, h=10);
            translate([cut_off+cut_l,0,0])cylinder(d=3, h=10);
        }
        rotate([0,0,45+90*2]) hull() {
            translate([cut_off,0,0]) cylinder(d=3, h=10);
            translate([cut_off+cut_l,0,0])cylinder(d=3, h=10);
        }
        rotate([0,0,45+90*3]) hull() {
            translate([cut_off,0,0]) cylinder(d=3, h=10);
            translate([cut_off+cut_l,0,0])cylinder(d=3, h=10);
        }
    }*/
}
module x8r() {
    //46.5mm x 27mm x 14.4mm
    x8r_x = 46.5;
    x8r_y = 27;
    x8r_z = 14.4;
    
    translate([-x8r_x/2, -x8r_y/2, 0]) cube([x8r_x, x8r_y, x8r_z]);
}

module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim, $fn=fn);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
    }
}

module naze32() {
    n_x = 36;
    n_z = 4;
    translate([- n_x/2, - n_x/2, 0]) roundedcube( n_x, n_x, n_z, 2);
}

module d250() {
    difference() {
        cylinder(d=252,h=3);
        translate([0,0, -1])cylinder(d=250,h=5);
    }
}

module prop() {
    difference() {
        cylinder(d=prop_d,h=3);
        translate([0,0, -1])cylinder(d=prop_d-1,h=5);
    }
    difference() {
        cylinder(d=prop6_d,h=3);
        translate([0,0, -1])cylinder(d=prop6_d-1,h=5);
    }
    cylinder(d=3,h=30);
}
module battery() {
    //Längd 88 mm Bredd 35 mm Höjd 25 mm  
    b_x = 88;
    b_y = 35;
    b_z = 25;
    
    translate([-b_x/2, -b_y/2, 0]) cube([b_x, b_y, b_z]);
}
module camera() {
    // 32 X 32 X 23.5mm
    b_x = 32;
    b_y = 32;
    b_z = 24;
    
    translate([-b_x/2, -b_y/2, 0]) cube([b_x, b_y, b_z]);
}
module mount_holes(x=30.5, dd=0, _h=100) {
    
    translate([x/2, x/2, 0]) cylinder(d=screw_d+dd, h=_h);
    translate([-x/2, x/2, 0]) cylinder(d=screw_d+dd, h=_h);
    translate([-x/2, -x/2, 0]) cylinder(d=screw_d+dd, h=_h);
    translate([x/2, -x/2, 0]) cylinder(d=screw_d+dd, h=_h);
}

module video_tx() {
    antenna_hole =6.5;
}