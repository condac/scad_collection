cross_rod_spaceing = 18;
cross_rod_diameter = 6;
//cross_rod_holder_diameter = 12.1;
bearing_diameter = 12.1;
bearing_length = 19*2;
bearing_wall = 2;


cube_x = 19*2 +4;
cube_y = 19*2 +2;
cube_z = 18+12+4 +30;
fn = 30; // resolution of cylinders

// small extruder coolingfan
ex_fan_xy = 31;
ex_fan_h = 8;
ex_fan_space = 50/2;
ex_fan_hole_dist = 24;

// Larger print cooling fan

pr_fan_xy = 40;
pr_fan_h = 10;
pr_fan_space = 25/2;
pr_fan_hole_dist = 24;


ex_height = 6; //Height of extrudermount relative to lower rod
ex_x = bearing_diameter/2+bearing_wall+8;
ex_y = 16;
// not visible helping parts
//Rods
%translate([0,100,0]) rotate([90,0,0]) cylinder(d=cross_rod_diameter, h= 200, $fn=fn);
%translate([-100,0,cross_rod_spaceing]) rotate([0,90,0]) cylinder(d=cross_rod_diameter, h= 200, $fn=fn);
// Bearings
%translate([0,0,cross_rod_spaceing]) rotate([0,90,0]) color("green") cylinder(d=bearing_diameter, h= bearing_length+2, $fn=fn);
%translate([0,bearing_length-bearing_diameter/2-bearing_wall+1,0]) rotate([90,0,0]) color("cyan") cylinder(d=bearing_diameter, h= bearing_length+2, $fn=fn);


//%e3d();
//%ex_fan();
//%e3d_cut();

%translate([ex_x,-10,-52]) rotate([0,0,-90]) import("RightLongDuct.STL", convexity=10);


//Main block
difference() {
    translate([-bearing_diameter/2-bearing_wall,-bearing_diameter/2-bearing_wall,-cube_z+cross_rod_spaceing+bearing_diameter/2+bearing_wall]) cube([cube_x,cube_y,cube_z]);
    
    
    translate([ex_x,ex_y,ex_height]) %e3d();
    translate([ex_x,ex_y,ex_height])  e3d_cut();
    
    // bearing holes
    translate([-100,0,cross_rod_spaceing]) rotate([0,90,0]) color("green") cylinder(d=bearing_diameter, h= 200, $fn=fn);
    translate([0,50,0]) rotate([90,0,0]) color("cyan") cylinder(d=bearing_diameter, h= 200, $fn=fn);
    
    //fan mount
    translate([10,50,-13]) rotate([90,0,0]) color("cyan") cylinder(d=3, h= 200, $fn=fn);
    //Material saving
    translate([-50,8,ex_height+2]) cube([100,50,50]);
    translate([-50,-50,-58]) cube([100,50,50]);
    translate([ex_x,-20,-50+ex_height+2]) cube([100,100,50]);
}






module ex_fan() {
    //extruder fan
    
    cube([ex_fan_xy,ex_fan_h,ex_fan_xy]);
}

translate([-bearing_diameter/2-bearing_wall,ex_y,0]) rotate([0,0,90])%pr_fan();
module pr_fan() {
    //printer fan
    
    translate([-pr_fan_xy/2,0,-pr_fan_xy/2]) cube([pr_fan_xy,pr_fan_h,pr_fan_xy]);
}

module fan_slot() {
    // surface area of motor core 380mm^2
    // surface area of fanblades ~700mm^2
    
}

module e3d() {
    c1_d = 16.2;
    c1_h = 4; // 3.7
    c2_d = 12.2;
    c2_h = 6;
    c3_d = 16.2;
    c3_h = 3;
    c4_d = 12;
    c4_h = 1.5;
    c5_d = 16.2;
    c5_h = 1;
    c6_d = 12;
    c6_h = 1.5;
    c7_d = 24;
    c7_h = 26;
    
    c_total_h = c1_h+c2_h+c3_h+c4_h+c5_h+c6_h+c7_h;
    total_h = 63; // Total length of the e3d
    
    block_x = 20;
    block_y = 16;
    block_z = 12;
    
    nozle_d = 10;
    nozle_h = 5;
    
    rotate([180,0,0])union() {
        translate([0,0,0]) cylinder(d=c1_d, h = c1_h, $fn=fn);
        translate([0,0,c1_h]) cylinder(d=c2_d, h = c2_h, $fn=fn);
        translate([0,0,c1_h+c2_h]) cylinder(d=c3_d, h = c3_h, $fn=fn);
        translate([0,0,c1_h+c2_h+c3_h]) cylinder(d=c4_d, h = c4_h, $fn=fn);
        translate([0,0,c1_h+c2_h+c3_h+c4_h]) cylinder(d=c5_d, h = c5_h, $fn=fn);
        translate([0,0,c1_h+c2_h+c3_h+c4_h+c5_h]) cylinder(d=c6_d, h = c6_h, $fn=fn);
        translate([0,0,c1_h+c2_h+c3_h+c4_h+c5_h+c6_h]) cylinder(d=c7_d, h = c7_h, $fn=fn);
        translate([-4.5,-block_y/2,total_h-nozle_h-block_z]) cube([block_x,block_y,block_z]);
        translate([0,0,total_h-nozle_h]) cylinder(d=nozle_d, h = nozle_h, $fn=fn);
    }
}

module e3d_cut() {
    
        e3d_cut_extruder_hull();
        
    
    //translate([0,-0,0]) ex_fan();
    translate([0,0,-4-6-8-13 +2]) rotate([0,0,90]) fan_cut();
}

module fan_cut() {
    
    hull() {
        translate([-ex_fan_xy/2,ex_fan_space,-ex_fan_xy/2]) ex_fan();
        translate([-ex_fan_xy/2,50+ex_fan_space,-ex_fan_xy/2]) ex_fan();
    }
    hull() {
        translate([-ex_fan_xy/2,-ex_fan_space-ex_fan_h,-ex_fan_xy/2]) ex_fan();
        translate([-ex_fan_xy/2,-50-ex_fan_space-ex_fan_h,-ex_fan_xy/2]) ex_fan();
    }
    translate([0,50,0]) rotate([90,0,0])cylinder(d=ex_fan_xy-2, h = 100, $fn=fn);
    //ex_fan_hole_dist
    // screw mount for fan
    translate([ex_fan_hole_dist/2,50,ex_fan_hole_dist/2]) rotate([90,0,0])cylinder(d=3, h = 100, $fn=fn);
    translate([ex_fan_hole_dist/2,50,-ex_fan_hole_dist/2]) rotate([90,0,0])cylinder(d=3, h = 100, $fn=fn);
    translate([-ex_fan_hole_dist/2,50,ex_fan_hole_dist/2]) rotate([90,0,0])cylinder(d=3, h = 100, $fn=fn);
    translate([-ex_fan_hole_dist/2,50,-ex_fan_hole_dist/2]) rotate([90,0,0])cylinder(d=3, h = 100, $fn=fn);
}
module e3d_cut_extruder() {
    c1_d = 16.2;
    c1_h = 4; // 3.7
    c2_d = 12.2;
    c2_h = 6;
    c3_d = 16.2;
    c3_h = 6;
    c4_d = 24;
    c4_h = 26;
    
    c_total_h = c1_h+c2_h+c3_h+c4_h;
    total_h = 63; // Total length of the e3d
    
    block_x = 20;
    block_y = 16;
    block_z = 12;
    
    nozle_d = 10;
    nozle_h = 5;
    
    rotate([180,0,0])union() {
        translate([0,0,-200]) cylinder(d=c1_d, h = 200, $fn=fn);
        
        translate([0,0,0]) cylinder(d=c1_d, h = c1_h, $fn=fn);
        translate([0,0,c1_h]) cylinder(d=c2_d, h = c2_h, $fn=fn);
        translate([0,0,c1_h+c2_h]) cylinder(d=c3_d, h = c3_h, $fn=fn);
        translate([0,0,c1_h+c2_h+c3_h]) cylinder(d=c4_d, h = c4_h, $fn=fn);
        
        
    }
}
module e3d_cut_extruder_hull() {
    c1_d = 16.2;
    c1_h = 4; // 3.7
    c2_d = 12.2;
    c2_h = 6;
    c3_d = 16.2;
    c3_h = 6;
    c4_d = 24;
    c4_h = 26;
    
    c_total_h = c1_h+c2_h+c3_h+c4_h;
    total_h = 63; // Total length of the e3d
    
    block_x = 20;
    block_y = 16;
    block_z = 12;
    
    nozle_d = 10;
    nozle_h = 5;
    
    rotate([180,0,0])union() {
        hull() {
            translate([0,0,-200]) cylinder(d=c1_d, h = 200, $fn=fn);
            translate([50,0,0]) translate([0,0,-200]) cylinder(d=c1_d, h = 200, $fn=fn);
        }
        hull() {
            translate([0,0,0]) cylinder(d=c1_d, h = c1_h, $fn=fn);
            translate([50,0,0]) translate([0,0,0]) cylinder(d=c1_d, h = c1_h, $fn=fn);
        }
        hull() {
            translate([0,0,c1_h]) cylinder(d=c2_d, h = c2_h, $fn=fn);
            translate([50,0,0]) translate([0,0,c1_h]) cylinder(d=c2_d, h = c2_h, $fn=fn);
        }
        hull() {
            translate([0,0,c1_h+c2_h]) cylinder(d=c3_d, h = c3_h, $fn=fn);
            translate([50,0,0]) translate([0,0,c1_h+c2_h]) cylinder(d=c3_d, h = c3_h, $fn=fn);
        }
        hull() {
            translate([0,0,c1_h+c2_h+c3_h]) cylinder(d=c4_d, h = c4_h, $fn=fn);
            translate([50,0,0]) translate([0,0,c1_h+c2_h+c3_h]) cylinder(d=c4_d, h = c4_h, $fn=fn);
        }
        
        
        
    }
}