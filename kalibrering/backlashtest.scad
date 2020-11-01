//
xx = 20;
zz = 10;

pinz = 2.5;
pinx= 1;


difference() {
    union() {
        cube([xx,xx,zz]);
        translate([xx-2,-1,0]) cube([3,3,zz]);
        translate([0,-1,0]) cube([1,2,zz]);
        translate([xx-1,xx-1,0]) cube([2,1,zz]);
        
    }
    translate([xx/2,0,pinz]) cube([pinx,pinx,pinz]);
    translate([xx/2,0,pinz*3]) cube([pinx,pinx,pinz]);
    
    translate([xx-pinx,xx/2,pinz]) cube([pinx,pinx,pinz]);
    translate([xx-pinx,xx/2,pinz*3]) cube([pinx,pinx,pinz]);
}