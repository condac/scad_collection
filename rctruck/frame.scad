h=18;
x= 60;
wall = 4;
$fs=1;
module f8x16() {
    y = 160;
    difference() {
        translate([-x/2,0,0]) cube([x,y,18]);
        translate([-x/2+wall,+wall,-1]) cube([x-wall*2,y-wall*2,18+2]);
        screw_cut_y(y);
        screw_cut_x(x);
    }
}
module f8x(y) {
    
    difference() {
        translate([-x/2,0,0]) cube([x,y,18]);
        translate([-x/2+wall,+wall,-1]) cube([x-wall*2,y-wall*2,18+2]);
        screw_cut_y(y);
        screw_cut_x(x);
    }
}
module screw_cut_x(width) {
    
    dist = 10;
    width = width - dist;
    hole_d = 3.5;
    
    for (a =[dist:dist:width]) {
        translate([-x/2+a,-100,h/2]) rotate([0,90,90]) cylinder(d=hole_d, h=400);
    }
}
module screw_cut_y(length) {
    
    dist = 10;
    length = length - dist;
    hole_d = 3.5;
    
    for (a =[dist:dist:length]) {
        translate([-x,a,h/2]) rotate([0,90,0]) cylinder(d=hole_d, h=x*2);
    }
}
module servo_frame() {
    screw_d = 2.9;
    difference() {
        union() {
            translate([-x/2,-5,-1]) cube([x, 10,1]);
            translate([-x/2+wall,-8/2,0]) cube([x-wall*2-0.5, 8,h]);
        }
        for (a =[0:5:x-wall*2-10]) {
        translate([a-x/2+wall+5,0,-2]) cylinder(d=screw_d, h=20+2);
        }
        translate([20,0,h/2]) rotate([0,90,0]) cylinder(d=screw_d, h=x*2);
        translate([-20,0,h/2]) rotate([0,90,180]) cylinder(d=screw_d, h=x*2);
    }
    
    
    //translate([0,0,0]) cylinder(d=3, h=20);
    //translate([0,48.5,0]) cylinder(d=3, h=20);
}
//f8x16();
translate([0,10,0])servo_frame();
//translate([90,0,0])f8x(80);
//translate([90,80,0])f8x(80);

//translate([90,-10 -40,0])f8x(40);