// Quadcopter by Bengt "condac" 2016
include <oshw.scad>;

//resolution
$fs=0.5;
$fa=9;

// Screw holes
screw_d = 2.95;

//Upper plate 
p1_x = 60;
p1_y = 180;
p1_z = 1.5;

//unused plate
p2_x = 58;
p2_y = 160;
p2_z = 2.5;

// Main plate
p3_x = 60;
p3_y = 180;
p3_z = 2;
p3_zw = 25; // must be at least 7.5 // if you don't want wall change p3_wall to 0
p3_wall = 2; // side wall thickness
p3_digg = 0.2; // How much the components are lovered into the plates

// spacer 
large_spacer = 35;
under_spacer = 12;
arm_w = p3_zw-7.5+ p3_z;

prop_d = 127; // 5inch 127mm
prop6_d = 152.4; // 6inch 152.4mm
prop_arm = 11.5+ prop_d/2;

//Motor diameter
motor_d = 36;

front_mount_x = 38;
front_mount_y = 38;
front_mount_angle = 40;
back_mount_x = 38;
back_mount_y = -38;
back_mount_angle = -40;

arm_mount_x = 20;
arm_mount_y = 20;

//top_plate();

//translate([0,0,p1_z+p3_zw+p3_z+2.1]) rotate([0,180,0]) p1(); // also known as top plate

//translate([0,0,0]) p3(); // also known as main plate

//translate([0,0,-p2_z]) p2();
translate([0,0,-p2_z-7.5-p2_z]) p4();

//visual();
//translate([0,0,-p2_z-7.5]) color("red") %arms_hover();

module visual() {
    //visual aids
    //% translate([0,-50,15]) rotate([0,90,0]) rotate([0,0,90]) x8r();
% translate([0,0,0]) rotate([0,0,0]) d4r();
% translate([0,0,0]) rotate([0,0,0]) video_tx();
%naze32();
translate([0,0,-10]) %d250();
translate([0,0,large_spacer+p1_z+p2_z]) rotate([0,0,90]) %battery();

translate([0,-80,p1_z+32/2]) rotate([90,0,0]) %camera();
translate([0,0,0])%power_board();

translate([0,0,-15])props();
translate([0,0,+p3_zw-7.5]) color("red") %arms_hover();



//visual aid
translate([180/2,180/2,-10]) %cylinder(d=2, h=30);
translate([180/2,-180/2,-10]) %cylinder(d=2, h=30);
}



module top_plate() {
    //Upper board
    difference() {
        translate([-p2_x/2, -p2_y/2, 0]) roundedcube(p2_x, p2_y, p2_z, 5);
        naze_cut();
        pole_cut();
        //Battery straps
        translate([p2_x/2-6,44,-1]) slot(3,25,5);
        translate([-p2_x/2+6,44,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-44-25,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-44-25,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-25/2,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-25/2,-1]) slot(3,25,5);
        
        //round holes
        //translate([0,0,-1]) cylinder(d=10, h=10);
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
        p2p_holes();
        
        // logo
        linear_extrude(height=p2_z)
        rotate([0,0,180]) oshw_logo_2d(25);
        
    }

}
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
    rotate([0,0,90]) translate([-19,-94,0]) import("arm-rugged_low-wall-v2.STL", convexity=10);
    
}
module shared_cut() {
        translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle]) arm_mount_cut(p1_z);
        translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle]) mirror([0,1,0]) arm_mount_cut(p1_z);
        
        translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle]) arm_mount_cut(p1_z);
        translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle]) mirror([0,1,0]) arm_mount_cut(p1_z);
    
            // camera mount holes
        translate([16/2, -p1_y/2+42, -1]) cylinder(d=screw_d, h=10);
        translate([-16/2, -p1_y/2+42, -1]) cylinder(d=screw_d, h=10);
    
        translate([16/2, -p1_y/2+10, -1]) cylinder(d=screw_d, h=10);
        translate([-16/2, -p1_y/2+10, -1]) cylinder(d=screw_d, h=10);
    
        translate([38/2, -p1_y/2+10, -1]) cylinder(d=screw_d, h=10);
        translate([-38/2, -p1_y/2+10, -1]) cylinder(d=screw_d, h=10);
    
        translate([16/2, -p1_y/2+p3_wall+26, -1]) cylinder(d=screw_d, h=10);
        translate([-16/2, -p1_y/2+p3_wall+26, -1]) cylinder(d=screw_d, h=10);
    
        //lid screws
        translate([p1_x/2-5, -p1_y/2+5, -1]) cylinder(d=screw_d, h=p3_zw+p3_z+2);
        translate([-p1_x/2+5, -p1_y/2+5, -1]) cylinder(d=screw_d, h=p3_zw+p3_z+2);
}

module p1_cut() {
        power_board();
        translate([0, 0, -p3_zw-p3_z]) camera();
        translate([0,1,p1_z]) video_tx();

        // logo
        linear_extrude(height=2)
        rotate([0,0,180]) oshw_logo_2d(25);

        //xt60 hole
        translate([8,60,-1]) rotate([0,0,90]) slot(9,16,5);
        translate([0,60,-1]) rotate([0,0,0]) slot(9,8,5);

    
        //Battery straps
        translate([p2_x/2-6,40,-1]) slot(3,25,5);
        translate([-p2_x/2+6,40,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-40-25,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-40-25,-1]) slot(3,25,5);
        
        translate([p2_x/2-6,-25/2,-1]) slot(3,25,5);
        translate([-p2_x/2+6,-25/2,-1]) slot(3,25,5);
        
        //round holes
        //translate([0,0,-1]) cylinder(d=10, h=10);
        //translate([0,70,-1]) cylinder(d=10, h=10);
        //translate([0,-70,-1]) cylinder(d=10, h=10);
        //translate([0,50,-1]) cylinder(d=10, h=10);
        translate([0,-30,-1]) cylinder(d=10, h=10);
        
        translate([36/2,70,-1]) cylinder(d=screw_d, h=10);
        translate([-36/2,70,-1]) cylinder(d=screw_d, h=10);
        // vertical slots
        l = 25;
        //translate([l/2,60,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-60,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,40,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-40,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,20,-1]) rotate([0,0,90]) slot(3,l,5);
        translate([l/2,-20,-1]) rotate([0,0,90]) slot(3,l,5);
}

module p3_cut() {
    translate([0,0,p3_z-p3_digg]) video_tx();
    translate([0,0,p3_z]) power_board();
    translate([0,0,p3_z-p3_digg]) d4r();
    camera();
    translate([0,-6-6,p3_z]) cube([100, 18, 8]); // usb access
    
    translate([0,p3_y,30.5/2+10+5]) rotate([90,0,0]) mount_holes(30.5);
    translate([0,p3_y/2,10+5+2]) rotate([90,0,0]) cylinder(d=5, h=10);
    
    translate([-50,front_mount_y-9.5,p3_z]) cube([100, 21, 30]);
    translate([-50,back_mount_y-14,p3_z]) cube([100, 28, 30]);
    
   
}
module p1() {
    difference() {
        union() {
            translate([-p1_x/2, -p1_y/2, 0]) roundedcube(p1_x, p1_y, p1_z, 5);
            
            
            
            hull() {
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount(p1_z+p3_zw);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount(p1_z+p3_zw);
            }
            hull() {    
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount(p1_z+p3_zw);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount(p1_z+p3_zw);
            }
            // extra stability
            /*hull() {
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle]) cylinder(d=2, h=p1_z+1);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])cylinder(d=2, h=p1_z+1);
            }
            hull() {    
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])cylinder(d=2, h=p1_z+1);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])cylinder(d=2, h=p1_z+1);
            }*/
        }
         
        translate([-100,-100,p1_z+p3_zw-7.5]) cube(200);
        
        translate([-p3_x/2+p3_wall,-100,p1_z]) cube([p3_x-p3_wall*2, p1_y-13, p3_zw]);
        
        
        naze_cut();
        //pole_cut();
        //rounded_cut();
        shared_cut();
        p1_cut();
        
        
        
        
    }
}

module p2() {
    difference() {
        union() {
            //arms
            
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount(p2_z);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount(p2_z);
            
                
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount(p2_z);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount(p2_z);
            
            
            //cross
            hull() {
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])cylinder(d=10, h= p2_z);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])cylinder(d=10, h= p2_z);
            }
            hull() {    
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])cylinder(d=10, h= p2_z);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])cylinder(d=10, h= p2_z);
            }
            // lines
            hull() {
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])cylinder(d=10, h= p2_z);
                
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])cylinder(d=10, h= p2_z);
            }
            hull() {    
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])cylinder(d=10, h= p2_z);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])cylinder(d=10, h= p2_z);
            }
            hull() {
                
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])cylinder(d=10, h= p2_z);
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])cylinder(d=10, h= p2_z);
            }
            hull() {    
                translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])cylinder(d=10, h= p2_z);
                translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])cylinder(d=10, h= p2_z);
            }
        }
        shared_cut();
        mount_holes(x=30.5);
        mount_holes(x=45);
        p2p_holes();
    }
}
module p4() {
    difference() {
        p2();
        p2p_holes(_d=6);
    }
}
module p2p_holes(_d=3) {
    x_d = 46;
    y_d = 76;
    
    translate([x_d/2, y_d/2, 0]) cylinder(d=_d, h= 50);
    translate([x_d/2, -y_d/2, 0]) cylinder(d=_d, h= 50);
    translate([-x_d/2, y_d/2, 0]) cylinder(d=_d, h= 50);
    translate([-x_d/2, -y_d/2, 0]) cylinder(d=_d, h= 50);
}

module p3() {
    //Power board
    difference() {
        union() {
            difference() {
                union() {
                    translate([-p3_x/2, -p3_y/2, 0]) roundedcube(p3_x, p3_y, p3_z+p3_zw, 5);
                    hull() {  
                        translate([back_mount_x, back_mount_y, 0]) rotate([0,0,back_mount_angle])arm_mount(p3_z);
                        translate([-back_mount_x, back_mount_y, 0]) rotate([0,0,180-back_mount_angle])arm_mount(p3_z);
                    }
                }
                // cut to make sidewalls
                translate([-p3_x/2+p3_wall, -p3_y/2+p3_wall, p3_z]) roundedcube(p3_x-p3_wall*2, p3_y-p3_wall*2, p3_zw+1, 5);
            }
            hull() {
                translate([front_mount_x, front_mount_y, 0]) rotate([0,0,front_mount_angle])arm_mount(p3_z);
                translate([-front_mount_x, front_mount_y, 0]) rotate([0,0,180-front_mount_angle])arm_mount(p3_z);
            }
            
            //lid screws
            translate([p1_x/2-5, -p1_y/2+5, 0]) cylinder(d=10, h=p3_zw+p3_z);
            translate([-p1_x/2+5, -p1_y/2+5, 0]) cylinder(d=10, h=p3_zw+p3_z);
            mount_holes(x=30.5, dd=2, _h=p3_z+2);
        }
        // cut to make sidewalls
        //translate([-p3_x/2+p3_wall, -p3_y/2+p3_wall, p3_z]) roundedcube(p3_x-p3_wall*2, p3_y-p3_wall*2, p3_z+p3_zw, 5);
        
        naze_cut();
        //pole_cut(9); 
        //rounded_cut();
        shared_cut();
        p3_cut();
        
        
        
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
    
    off = 4;
    translate([off,0,-1]) cylinder(d=screw_d, h=p3_z+p3_zw, $fn=16);
    translate([off-8,0,-1]) cylinder(d=screw_d, h=p3_z+p3_zw, $fn=16);
    
    xx = 18.5;
    translate([-xx/2,-xx/2,arm_w]) roundedcube(xx+20, xx, 7.5, 2); 
    translate([-xx/2-2.5,-xx/2 ,arm_w-3]) roundedcube(xx+20, 6.5, 7.5, 2); 
}

module naze_cut() {
    translate([0,0,-1]) mount_holes(30.5);
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
module d4r() {
    //46.5mm x 27mm x 14.4mm
    d4r_x = 24;
    d4r_y = 50;
    d4r_z = 8.4;
    
    translate([-d4r_x/2+p3_x/2-p3_wall,-45,0]) union() {
        translate([-d4r_x/2, -d4r_y/2, 0]) cube([d4r_x, d4r_y, d4r_z]);
        translate([d4r_x/2 -56.5, 0, 0]) cube([57, d4r_x, d4r_z]);
    }
}
module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim);
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
    b_x = 110;
    b_y = 35;
    b_z = 35;
    
    translate([-b_x/2, -b_y/2, 0]) cube([b_x, b_y, b_z]);
}

module camera() {
    // 32 X 32 X 23.5mm
    b_x = 33;
    b_y = 48;
    b_z = 2;
    l1 = 17.5;
    l2 = 25;
    translate([0, -p1_y/2, 0]) union() {
        translate([-b_x/2, -b_y/2, p3_zw+p3_z]) cube([b_x, b_y, 10]);
        //translate([-b_x/2, -b_y/2, 0]) cube([b_x, b_y, b_z]);
        
        translate([-l1/2, -l1/2, p3_z+7]) cube([l1, l1,30]);
        translate([-l2/2, -l2/2, p3_z+13]) cube([l2, l2,30]);
        translate([0, p3_wall, p3_z+12/2 +6]) rotate([90,0,0]) cylinder(d=12, h=50);
    }
        
}
module power_board() {
    // hålen är på 45x45mm
    b_x = 50;
    b_y = 50;
    b_z = 7;
    
     translate([0, 43, 10]) union() {
        translate([-b_x/2, -b_y/2, 0]) cube([b_x, b_y, b_z]);
        translate([0, 0, -50]) mount_holes(x=45);
        translate([0, 0, -50]) mount_holes(x=30.5);
    }
    
}

module video_tx() {
    //46.5mm x 27mm x 14.4mm
    v_x = 24;
    v_y = 62;
    v_z = 12+10; // den är 12 men jag vill klippa bort mer plast
    v_kontakt = 9;
    translate([0,p3_y/2-v_y/2-p3_wall,0]) union() {
        translate([-v_x/2, -v_y/2, 0]) cube([v_x, v_y, v_z]);
        translate([-v_kontakt/2-1, v_y/2, 0]) cube([v_kontakt, 11, v_kontakt]);
        translate([-v_kontakt/2-7, v_y/2, 0]) cube([v_kontakt, 11, v_kontakt]);
    }
}

module mount_holes(x=30.5, dd=0, _h=100) {
    
    translate([x/2, x/2, 0]) cylinder(d=screw_d+dd, h=_h);
    translate([-x/2, x/2, 0]) cylinder(d=screw_d+dd, h=_h);
    translate([-x/2, -x/2, 0]) cylinder(d=screw_d+dd, h=_h);
    translate([x/2, -x/2, 0]) cylinder(d=screw_d+dd, h=_h);
}