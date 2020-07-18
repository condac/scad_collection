//


xx = 60;
yy = 80;
zz = 2;


angle = 5;
rad = 10;
thick = 2;

dist = 5;

cut_l = 15;

pedal();
module pedal() {
    
    difference() {
        union() {
            
            
            
            translate([rad,0,0]) cylinder(d=rad*2, h=xx);
        }
        
        translate([zz,0,0]) cube([dist-zz,yy,xx]);
        translate([rad,0,0]) cylinder(d=rad*2-thick*2, h=xx);
    }
    plate();
    difference() {
        translate([dist,0,0]) rotate([0,0,-angle]) mirror([1,0,0]) plate();
        translate([rad,0,0]) cylinder(d=rad*2-thick*2, h=xx);
    }
}

module plate() {
    difference() {
        union() {
            cube([zz,yy,xx]);
            translate([0,yy-2,xx/2-cut_l/2]) cube([zz+1,2,cut_l]);
            
        }
        translate([0,yy-2-3,xx/2-cut_l/2]) cube([zz+1,2,cut_l]);
    }
    
}