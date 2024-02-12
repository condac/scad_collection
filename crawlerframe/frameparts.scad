//
include <commonparts.scad>;
include <tunable_constants.scad>;
frame_inside = 9;
frame_wall = 3;

frame_ch = 5;

$fs = 0.5;
$fa = 5.1;

mirror([1,0,0]) frame1();

brace_box();

module brace_box() {
    xx = frame_inside-PRINTER_ERROR;
    yy = 78;
    zz = 10;
    boxy = 68;
    boxx = 45;
    boxwall = 2;
    boxz = 35+boxwall;
    
    difference() {
        union() {
            cube([xx,yy,zz]);
            translate([35,0,0])cube([xx,yy,zz]);
            translate([0,(yy-boxy)/2,0])cube([boxx,boxy,boxz]);
        }
        translate([xx/2,0,zz/2]) rotate([-90,0,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=12);
        translate([xx/2,yy-12,zz/2]) rotate([-90,0,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=12);
        
        translate([35+xx/2,0,zz/2]) rotate([-90,0,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=12);
        translate([35+xx/2,yy-12,zz/2]) rotate([-90,0,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=12);
        translate([boxwall,(yy-boxy)/2 + boxwall,boxwall])cube([boxx-boxwall*2,boxy-boxwall*2,boxz]);
        
    }
}

module brace() {
    xx = frame_inside-PRINTER_ERROR;
    yy = 78;
    zz = 10;
    
    difference() {
        cube([xx,yy,zz]);
        translate([xx/2,0,zz/2]) rotate([-90,0,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=12);
        
        translate([xx/2,yy-12,zz/2]) rotate([-90,0,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=12);
    }
}

module cbeam(ll) {
    union() {
        
        translate([-frame_inside/2-frame_wall,0,0]) cube([frame_inside+frame_wall*2,frame_wall,ll]);
        translate([-frame_inside/2-frame_wall,-frame_ch,0])cube([frame_wall,frame_ch+frame_wall,ll]);
        translate([frame_inside/2,-frame_ch,0])cube([frame_wall,frame_ch+frame_wall,ll]);
    }
}

module frame1() {
    // front part from suspensionmount back to center gearbox
    // center gearbox is origin
    difference() {
        union() {
            cbeam(50);
            hull() {
                translate([0,0,50]) cbeam(1);
                translate([20,0,50+50]) cbeam(1);
                
            }
            translate([20,0,50+50]) cbeam(60);
        }
        
        frame1_screws();
    }
    
        %frame1_screws();
}
module frame1_screws() {
    screw = 3;
    
    translate([0,frame_wall,38/2]) rotate([90,0,0]) common_button_screw_tap();
    translate([0,frame_wall,32]) rotate([90,0,0]) common_button_screw_tap();
    
    translate([20,frame_wall,108]) rotate([90,0,0]) common_button_screw_tap();
    translate([20,frame_wall,108+35]) rotate([90,0,0]) common_button_screw_tap();
    
    translate([20,frame_wall,120]) rotate([90,0,0]) common_button_screw_tap();
    translate([20,frame_wall,120+35]) rotate([90,0,0]) common_button_screw_tap();
}
