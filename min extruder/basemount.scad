
nema_screw_d = 31;
center_offset =  6.85;
base_x = 60;
base_y = 22;
base_z = 10;

j_r_small = 12/2;
j_r_large = 16.5/2;
j_h_small = 4;
j_h_large = 5;

//filament
color("red") %translate([-center_offset,0,-30]) cylinder(r=3/2, h= 60, $fn=10);

//m3 screv nema mount
% translate([nema_screw_d/2,30,base_z/2]) rotate([90,0,0]) cylinder(r=3/2, h= 60, $fn=24);
% translate([-nema_screw_d/2,30,base_z/2]) rotate([90,0,0]) cylinder(r=3/2, h= 60, $fn=24);

% translate([0,30,base_z/2+nema_screw_d/2]) rotate([90,0,0]) cylinder(r=24/2, h= 60, $fn=24);

difference() {
    union() {
        translate([-nema_screw_d/2-12,-base_y/2,0])  cube([base_x,base_y, base_z]);
        translate([0,-base_y/4,0]) cube([25,base_y/2,back_z]);
        //backplate
        back_x = 8;
        back_y = 40;
        back_z = 22;
        translate([25,-back_y/2,0]) cube([8,back_y,22]);
    }
    //jhead cut
    //translate([-center_offset,0,-0.1]) cylinder(r=j_r_small, h=j_h_small, $fn=40);
    translate([-center_offset,0,-0.2]) cylinder(r=j_r_large, h=j_h_large*3, $fn=40);
    
    // clamp cut
    clamp_y = 4;
    translate([-base_x+10-4.5,-clamp_y/2,0]) cube([base_x,clamp_y,base_z]);
    
    //nema cut
    color("cyan") translate([0,30,base_z/2+nema_screw_d/2]) rotate([90,0,0]) cylinder(r=24/2, h= 60, $fn=24);
    //m3 screv nema mount
    color("cyan") translate([nema_screw_d/2,30,base_z/2]) rotate([90,0,0]) cylinder(r=3.2/2, h= 60, $fn=24);
    color("cyan") translate([-nema_screw_d/2,30,base_z/2]) rotate([90,0,0]) cylinder(r=3.2/2, h= 60, $fn=24);
    
    // mount screws
    dist1=24;
    dist2=30;
    //dist1
    color("blue") translate([0,dist1/2,22*2/4]) rotate([0,90,0]) cylinder(r=3/2, h= 60, $fn=24);
    color("blue") translate([0,-dist1/2,22*2/4]) rotate([0,90,0]) cylinder(r=3/2, h= 60, $fn=24);
    //nuts
    color("cyan") translate([25,dist1/2,22*2/4]) rotate([0,90,0]) cylinder(r=6.2/2, h=2, $fn=6);
    color("cyan") translate([25,-dist1/2,22*2/4]) rotate([0,90,0]) cylinder(r=6.2/2, h=2, $fn=6);
    //dist2
    color("blue") translate([0,dist2/2,22*3/4]) rotate([0,90,0]) cylinder(r=4/2, h= 60, $fn=24);
    color("blue") translate([0,-dist2/2,22*3/4]) rotate([0,90,0]) cylinder(r=4/2, h= 60, $fn=24);
    //nuts
    color("cyan") translate([25,dist2/2,22*3/4]) rotate([0,90,0]) cylinder(r=8/2, h=3, $fn=6);
    color("cyan") translate([25,-dist2/2,22*3/4]) rotate([0,90,0]) cylinder(r=8/2, h=3, $fn=6);
}


//translate([0,-base_y/4,0]) cube([25,base_y/2,back_z]);