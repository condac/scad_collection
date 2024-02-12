$fs = 0.5;
$fa = 5.1;


//lower_link(115);

suspension_mount();

module suspension_mount() {
    dd1 = 7.5*2+0.2;
    dd2 = 10;
    hh1 = 38;
    dist = 13;
    mount_dist = 35;
    wall1 = 2;
    wall2 = 8;
    difference() {
        union(){
            hull() {
                translate([-mount_dist/2,0,0]) cylinder(d=dd1, h=wall1);
                translate([mount_dist/2,0,0]) cylinder(d=dd1, h=wall1);
            }
            hull() {
                translate([-mount_dist/2,7.5,0])cube([mount_dist,1,wall2]);
                translate([-dist/2,hh1,0]) cylinder(d=dd2, h=wall2);
                translate([dist/2,hh1,0]) cylinder(d=dd2, h=wall2);
            }
            
            hull() {
                translate([-dist/2,hh1,0]) cylinder(d=dd2, h=wall2);
                translate([dist/2,hh1,0]) cylinder(d=dd2, h=wall2);
            }
            
        }
        
        translate([-mount_dist/2,0,0]) cylinder(d=3, h=wall1);
                translate([mount_dist/2,0,0]) cylinder(d=3, h=wall1);
        translate([-dist/2,hh1,0]) cylinder(d=3, h=wall2);
                translate([dist/2,hh1,0]) cylinder(d=3, h=wall2);
        translate([0,hh1,0]) cylinder(d=3, h=wall2);
        
        translate([0,-15,0]) cylinder(d=30, h=wall1);
        translate([0,22,0]) cylinder(d=18, h=wall2);   
    }
    
}
