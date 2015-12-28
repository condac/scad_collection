box_x = 400;
box_y = 400;
box_z = 400;

x_rod_l = 500;
y_rod_l = 400;

rod_space = 18; // default ultimaker space between rods is 18mm
rod_h = -0; // rod offset in height from top of box

gt2_d = 16;
gt2_h = 13;
gt2_bw = 8;
wood_thickness = 13;
wood_t = wood_thickness;
bearing_d = 22;
bearing_h = 7;
bearing_extra = 0.1;

coupler_length = 25;
coupler_d = 19;

nema_shaft = 24;

xy_rod_d = 8;
small_rod_d = 8;

rod_ws = 30;

fn = 32;

// Parts you need to print
//rotate([0,-90,0]) mirror([0,1,0]) mount1(); // 2pcs
//rotate([0,-90,0]) mirror([0,0,0]) mount1(); // 2pcs
// rotate([0,-90,0]) xmotor(); // 1pcs
// rotate([0,90,0]) ymotor(); // 1pcs
 // 4pcs https://www.youmagine.com/designs/open-xy-blocks-with-adjustable-belt-tension-for-original-ultimaker-8mm-gantry-rods


p_x = 350;
p_y = 350;
//translate([-p_x/2, -p_y/2,0]) %cube([p_x,p_y,10]);

//visual();
module visual() {
    
//Parts for visual:

color("green") %woodbox();
color("cyan") %small_rods();
color("cyan") %rods();
color("orange") %belts();
color("cyan") translate([box_x/2-rod_ws, -box_y/2-wood_t-nema_shaft, rod_h-rod_space]) %nema17();
color("blue") translate([box_x/2-rod_ws, -box_y/2-wood_t-coupler_length/2, rod_h-rod_space]) %coupler();

color("cyan") translate([box_x/2+wood_t+nema_shaft, -box_y/2+rod_ws, rod_h]) rotate([0,0,90]) %nema17();
color("blue") translate([box_x/2+wood_t+coupler_length/2, -box_y/2+rod_ws, rod_h]) rotate([0,0,90]) %coupler();


color("red")translate([-box_x/2,box_y/2,0])rotate([0,0,-90]) mirror([0,1,0]) %mount1();
color("red")translate([box_x/2,box_y/2,0]) rotate([0,0,-90]) mirror([0,0,0]) %mount1();
color("red")translate([box_x/2,-box_y/2,0])rotate([0,0,90]) mirror([0,1,0]) %mount1();
color("red")translate([-box_x/2,-box_y/2,0]) rotate([0,0,90]) mirror([0,0,0]) %mount1();

color("red")translate([box_x/2-rod_ws-20-20,-box_y/2-wood_t,0]) %xmotor();
color("red")translate([box_x/2+wood_t,-box_y/2+rod_ws+20+20,0]) rotate([0,0,90]) %ymotor();
}
module xmotor() {
    x = 20;
    h = 55;
    wall = 5;
    b_wall = 5;
    m_wall = 8;
    b_h = 12;
    nema_screw_dist = 31.04;
    nema_xy = 42;
    
    motor_offset = 40;
    
    difference() {
        union() {
            translate([0,-wall,-h])cube([x,wood_t+wall*2, h+wall ]);
            translate([motor_offset-nema_xy/2,-nema_shaft,rod_h-rod_space-nema_xy/2]) cube([nema_xy,m_wall,nema_xy]);
            
            
            
            
            translate([0,-nema_shaft,rod_h-rod_space-nema_xy/2]) cube([x,nema_shaft,nema_xy]);
        }
        translate([0,0,-h]) cube([x,wood_t, h]);
        
        // Round cut for motor circle
        hull() {
                translate([motor_offset,-nema_shaft-1,rod_h-rod_space]) rotate([-90,0,0]) cylinder(d=23, h=m_wall+2, $fn=fn);
                translate([motor_offset+nema_xy,-nema_shaft-1,rod_h-rod_space]) rotate([-90,0,0])cylinder(d=23, h=m_wall+2, $fn=fn);
        }
        
        //M3 mounting screws
        translate([x/2,-wall-nema_shaft,-h/4])rotate([-90,0,0])cylinder(d=3.1, h= x*2+nema_shaft, $fn=fn);
        translate([x/2,-wall-nema_shaft,-h+8])rotate([-90,0,0])cylinder(d=3.1, h= x*2+nema_shaft, $fn=fn);
        
        translate([x/2,-nema_shaft,-h/4])rotate([-90,0,0]) cylinder(d=9, h= nema_shaft-wall, $fn=fn);
        
        //Motor mount screw
        translate([motor_offset+nema_screw_dist/2, -nema_shaft,rod_h-rod_space+nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        translate([motor_offset-nema_screw_dist/2, -nema_shaft,rod_h-rod_space+nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        translate([motor_offset+nema_screw_dist/2, -nema_shaft,rod_h-rod_space-nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        translate([motor_offset-nema_screw_dist/2, -nema_shaft,rod_h-rod_space-nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        
        //material saving
        hull() {
            save_d = nema_shaft-m_wall-wall;
            translate([0,0-wall-(save_d)/2,rod_h-rod_space+nema_xy/2-save_d/2-wall])rotate([0,90,0])cylinder(d=save_d, h=x);
            translate([0,0-wall-(save_d)/2,rod_h-rod_space-nema_xy/2+save_d/2+wall])rotate([0,90,0])cylinder(d=save_d, h=x);
        }
    }
    
}

module ymotor() {
    x = 20;
    h = 55;
    wall = 5;
    b_wall = 5;
    m_wall = 8;
    b_h = 12;
    nema_screw_dist = 31.04;
    nema_xy = 42;
    
    motor_offset = 40;
    
    mirror([1,0,0]) difference() {
        union() {
            translate([0,-wall,-h])cube([x,wood_t+wall*2, h+wall ]);
            translate([motor_offset-nema_xy/2,-nema_shaft,rod_h-nema_xy/2]) cube([nema_xy,m_wall,nema_xy]);
            
            
            
            
            translate([0,-nema_shaft,rod_h-nema_xy/2]) cube([x,nema_shaft,nema_xy]);
        }
        translate([0,0,-h]) cube([x,wood_t, h]);
        
        // Round cut for motor circle
        hull() {
                translate([motor_offset,-nema_shaft-1,rod_h]) rotate([-90,0,0]) cylinder(d=23, h=m_wall+2, $fn=fn);
                translate([motor_offset+nema_xy,-nema_shaft-1,rod_h]) rotate([-90,0,0])cylinder(d=23, h=m_wall+2, $fn=fn);
        }
        
        //M3 mounting screws
        translate([x/2,-wall-nema_shaft,-h/4])rotate([-90,0,0])cylinder(d=3.1, h= x*2+nema_shaft, $fn=fn);
        translate([x/2,-wall-nema_shaft,-h+8])rotate([-90,0,0])cylinder(d=3.1, h= x*2+nema_shaft, $fn=fn);
        
        translate([x/2,-nema_shaft,-h/4])rotate([-90,0,0])cylinder(d=9, h= nema_shaft-wall, $fn=fn);
        
        //Motor mount screw
        translate([motor_offset+nema_screw_dist/2, -nema_shaft,rod_h+nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        translate([motor_offset-nema_screw_dist/2, -nema_shaft,rod_h+nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        translate([motor_offset+nema_screw_dist/2, -nema_shaft,rod_h-nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        translate([motor_offset-nema_screw_dist/2, -nema_shaft,rod_h-nema_screw_dist/2]) rotate([-90,0,0]) cylinder(d=3.1, h=m_wall+1, $fn=fn);
        
        //material saving
        hull() {
            save_d = nema_shaft-m_wall-wall;
            translate([0,0-wall-(save_d)/2,rod_h+nema_xy/2-save_d/2-wall])rotate([0,90,0])cylinder(d=save_d, h=x);
            translate([0,0-wall-(save_d)/2,rod_h-nema_xy/2+save_d/2+wall])rotate([0,90,0])cylinder(d=save_d, h=x);
        }
    }
    
}

module woodbox() {
    
    //Back
    difference() {
        translate([-box_x/2,-box_y/2-wood_t,-box_z]) cube([box_x,wood_thickness, box_z]);
        translate([box_x/2-rod_ws, -box_y/2-wood_t-1, rod_h-rod_space]) rotate([-90,0,0])cylinder(d=22, h=wood_t*2, $fn=fn); 
    }
    //front
    translate([-box_x/2,box_y/2,-100]) cube([box_x,wood_thickness, 100]);
    //Left
    translate([box_x/2,-box_y/2,-box_z]) cube([wood_thickness,box_y, box_z]);
    //Right
    translate([-box_x/2-wood_t,-box_y/2,-box_z]) cube([wood_thickness,box_y, box_z]);
    
}

module small_rods() {
    
    //Rods
translate([0,x_rod_l/2,rod_h]) rotate([90,0,0]) cylinder(d=small_rod_d, h= x_rod_l, $fn=fn);
translate([-y_rod_l/2,0,rod_h-rod_space]) rotate([0,90,0]) cylinder(d=small_rod_d, h= y_rod_l, $fn=fn);
    
}

module rods() {
    
    //Rods
    translate([-box_x/2+rod_ws,y_rod_l/2,rod_h-rod_space]) rotate([90,0,0]) cylinder(d=small_rod_d, h= y_rod_l, $fn=fn);
    translate([box_x/2-rod_ws,y_rod_l/2,rod_h-rod_space]) rotate([90,0,0]) cylinder(d=small_rod_d, h= y_rod_l, $fn=fn);
    
    translate([-x_rod_l/2,-box_y/2+rod_ws,rod_h]) rotate([0,90,0]) cylinder(d=small_rod_d, h= x_rod_l, $fn=fn);
    translate([-x_rod_l/2,box_y/2-rod_ws,rod_h]) rotate([0,90,0]) cylinder(d=small_rod_d, h= x_rod_l, $fn=fn);
    
}
//bearing();
module bearing() {
    cylinder(d=bearing_d, h= bearing_h, $fn=fn);
}

module belts() {
    translate([0,-box_y/2+rod_ws,rod_h-rod_space]) belt(box_x-rod_ws*2);
    translate([0,box_y/2-rod_ws,rod_h-rod_space]) belt(box_x-rod_ws*2);
    
    rotate([0,0,90]) translate([0, -box_x/2+rod_ws, rod_h]) belt(box_y-rod_ws*2);
    rotate([0,0,90]) translate([0, box_x/2-rod_ws, rod_h]) belt(box_y-rod_ws*2);
}
module belt(in) {
    
    hull() {
        
        translate([in/2, gt2_bw/2, 0]) rotate([90,0,0]) cylinder(d=gt2_d, h=gt2_bw);
        translate([-in/2, gt2_bw/2, 0]) rotate([90,0,0]) cylinder(d=gt2_d, h=gt2_bw);
    }    
    translate([in/2, gt2_h, 0]) rotate([90,0,0]) cylinder(d=gt2_d, h=gt2_h*2);
    translate([-in/2, gt2_h, 0]) rotate([90,0,0]) cylinder(d=gt2_d, h=gt2_h*2);
}


module mount1() {
    
    x = 20;
    h = 50;
    wall = 8;
    b_wall = 5;
    b_h = 12;
    
    difference() {
        union() {
            translate([0,-wall,-h])cube([x,wood_t+wall*2, h+wall ]);
            hull() {
                translate([0,-rod_ws,rod_h-rod_space]) rotate([0,90,0]) cylinder(d=bearing_d+b_wall*2, h=b_h, $fn=fn);
                translate([0,0,rod_h-rod_space-(bearing_d+b_wall*2)/2])cube([b_h,1,bearing_d+b_wall*2]);
            }
            hull() {
                translate([rod_ws,0,rod_h])  rotate([0,0,-90]) rotate([0,90,0]) cylinder(d=bearing_d+b_wall*2, h=b_h, $fn=fn);
                translate([0,-b_h,rod_h-bearing_d/2])cube([1,b_h,bearing_d]);
            }
        }
        translate([0,0,-h]) cube([x,wood_t, h]);
        translate([0,-rod_ws,rod_h-rod_space]) rotate([0,90,0])  cylinder(h= b_h+1, d=bearing_d+bearing_extra);
        translate([rod_ws,+wood_t+wall+1,rod_h])  rotate([0,0,-90]) rotate([0,90,0]) cylinder(h= b_h+1+wood_t+wall+1, d=bearing_d+bearing_extra);
        
        //M3 mounting screws
        translate([x/2,0,-h/4])rotate([-90,0,0])cylinder(d=3.1, h= x*2, $fn=fn);
        translate([x/2,-wall,-h+8])rotate([-90,0,0])cylinder(d=3.1, h= x*2, $fn=fn);
    }
    
}

module torus(d1,h,d2) {
    difference() {
        cylinder(d=d1, h = h, $fn=fn);
        cylinder(d=d2, h = h, $fn=fn);
    }
}

%translate([0,0,rod_h-rod_space]) lm8luu();
%translate([0,0,rod_h]) rotate([0,0,90])lm8luu();
module lm8luu() {
    rotate([0,90,0]) cylinder(d=15, h=45, $fn=fn);
    
}
module lm8uu() {
    cylinder(d=15, h=24, $fn=fn);
    
}

module coupler() {
    //Dimensions 25mm x 19mm
    
    d=19;
    h=25;
    
    rotate([-90,0,0])cylinder(d=d, h=h, $fn=fn);
    
}
// nema 17 from internet
module nema17()
{
	nema_side = 42.2;
	nema_bolts = 31.04/2.0;
	nema_depth = 3.8;
	M3 = 3.0/2.0;

	//bevel corners
	r1 = nema_side/2- nema_bolts;
	r2 = sqrt(2)* r1 ;
	r=(r2-r1)*2;
	
	
	rotate([0,0,180]) translate([-nema_side/2, 0,-nema_side/2])  difference()
	{
	
		union()
		{
			cube([nema_side,33.8,nema_side]);
	
			translate( [nema_side/2,0,nema_side/2]) 
				rotate(90,[1,0,0]) 
					{
						cylinder(r = 11, h = 2, $fn = 40);
						cylinder(r = 5.0/2.0, h = nema_shaft, $fn = 20);
					}
		}
	
	
		translate( [nema_side/2,0,nema_side/2])
		{
	
			for(j=[1:4])
			{
				rotate(90*j,[0,1,0]) 
					translate( [nema_side/2,33.8/2,nema_side/2]) 
				rotate(45,[0,1,0]) 
				cube([30,50,r], center = true);
			}
	
			//bolt holes
			for(j=[1:4])
			{		
				rotate(90*j,[0,1,0]) 
				translate( [nema_bolts,0,nema_bolts]) 
					rotate(-90,[1,0,0]) 
					{
						cylinder(r = M3, h = nema_depth*2, $fn = 20,center=true);
					}
	
			}
		}
	}
}
