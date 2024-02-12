$fs = 0.5;
$fa = 5.1;


//lower_link(115);

upper_link(94);
//steeringlink(60);

module steeringlink(ll=60) {
    wall1 = 4;
    dd1 = 8;
    difference() {
        union(){
            hull() {
                translate([0,0,0]) cylinder(d=dd1, h=wall1);
                translate([10,0,0]) cylinder(d=dd1, h=wall1);
            }
            hull() {
                translate([10,0,0]) cylinder(d=dd1, h=wall1);
                translate([ll-10,0,dd1/2])rotate([90,0,0]) cylinder(d=dd1, h=wall1);
            }
            hull() {
                translate([ll,0,dd1/2])rotate([90,0,0]) cylinder(d=dd1, h=wall1);
                translate([ll-10,0,dd1/2])rotate([90,0,0]) cylinder(d=dd1, h=wall1);
            }
        }
        conehole(wall1);
        translate([ll,0,dd1/2])rotate([90,0,0]) conehole(wall1);
    }
    
    
}
module conehole(hh=10) {
    cylinder(d1=5, d2=3, h=hh/2);
    translate([0,0,hh/2]) cylinder(d1=3, d2=5, h=hh/2);
}
module upper_link(ll=94) {
    dd1 = 9;
    dd2 = 10;
    hh1 = 4;
    hh2 = 7.5+hh1*2;
    dist = 70;
    difference() {
        union(){
            hull() {
                translate([ll-7,0,-dist/2]) cylinder(d=dd1, h=hh1);
                translate([10,0,-hh2/2]) cylinder(d=dd1, h=hh1);
            }
            hull() {
                translate([0,0,-hh2/2]) cylinder(d=dd1, h=hh1);
                translate([10,0,-hh2/2]) cylinder(d=dd1, h=hh1);
            }
            hull() {
                translate([ll-7,0,-dist/2]) cylinder(d=dd1, h=hh1);
                translate([ll,0,-dist/2]) cylinder(d=dd1, h=hh1);
            }
        }
        
        translate([ll,0,-dist/2]) conehole(hh1);//cylinder(d=3, h=hh2+dist);
        translate([0,0,-hh2/2])  conehole(hh1);
            
    }
    
}

module lower_link(ll=115) {
    s_d = 4; // stångens diameter
    f_d = 4;
    tjock = 8.9;


    difference() {
        union(){
            hull() {
                cylinder(d=tjock, h=5);
                translate([ll,0,0]) cylinder(d=tjock, h=5);
                
            }
            hull() {
                translate([10,0,0]) cylinder(d=tjock, h=5);
                translate([ll/4,0,0]) cylinder(d=12, h=5);
                
            }
            hull() {
                translate([ll/4,0,0]) cylinder(d=12, h=5);
                translate([ll-ll/4,0,0]) cylinder(d=12, h=5);
                
            }
            hull() {
                translate([ll-ll/4,0,0]) cylinder(d=12, h=5);
                translate([ll-10,0,0]) cylinder(d=tjock, h=5);
                
                
            }
        }
        translate([0,0,0]) cylinder(d=f_d, h=15);
        translate([ll,0,0]) cylinder(d=f_d, h=15);
    }
        
}