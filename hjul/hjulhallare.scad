d608 = 22.5;
wall = 3;
h = 30;
fn = 64;
screw = 3.5;

mount_x = d608+wall*2 + screw*2+wall*4;


difference() {
    union() {
        cylinder(r=d608/2+wall, h= h, $fn=fn);
        translate([-mount_x/2,d608/2,0]) cube([mount_x,wall,h]);
        
        translate([d608/2,0,0]) cube([wall,d608/2,h]);
        translate([-d608/2-wall,0,0]) cube([wall,d608/2,h]);
    }
    translate([0,0,0]) cylinder(r=d608/2, h= 9, $fn=fn);
    translate([0,0,h-9]) cylinder(r=d608/2, h= 9, $fn=fn);
    
     translate([0,0,-1]) cylinder(r=10, h= h, $fn=fn);
    
    translate([mount_x/2-screw/2-wall,h,h/4]) rotate([90,0,0]) cylinder(d=screw, h= h, $fn=fn);
    translate([mount_x/2-screw/2-wall,h,h*3/4]) rotate([90,0,0]) cylinder(d=screw, h= h, $fn=fn);
    translate([-(mount_x/2-screw/2-wall),h,h/4]) rotate([90,0,0]) cylinder(d=screw, h= h, $fn=fn);
    translate([-(mount_x/2-screw/2-wall),h,h*3/4]) rotate([90,0,0]) cylinder(d=screw, h= h, $fn=fn);
}
