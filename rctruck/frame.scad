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
            translate([-x/2,-4,-1]) cube([x, 8,1]);
            translate([-x/2+wall,-8/2,0]) cube([x-wall*2-0.5, 8,h/2+1.5+1]);
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
servo_mount2();
module servo_mount2() {
    m_x=56;
    m_y=32;
    m_z=15;
    
    s_x=41;
    s_y=21;
    s_z=15;
    
    screw_d = 2.9;
    
    difference() {
        translate([-m_x/2,0,0]) cube([m_x,m_y,m_z]);
        translate([-s_x/2,0,0]) cube([s_x,s_y,s_z]);
        
        //servo screws
        translate([50/2,5,0])  cylinder(d=screw_d, h=x*2);
        translate([50/2,5+10,0])  cylinder(d=screw_d, h=x*2);
        translate([-50/2,5,0])  cylinder(d=screw_d, h=x*2);
        translate([-50/2,5+10,0])  cylinder(d=screw_d, h=x*2);
        
        // frame cuts
        translate([(x-wall*2-0.5)/2,     s_y-2,0]) cube([50,50,50]);
        translate([(-x+wall*2+0.5)/2-50, s_y-2,0]) cube([50,50,50]);
        
        // frame screws
        translate([-60/2, 20+18/2, 5/2+10]) rotate([0,90,0]) %cylinder(d=screw_d, h=x*2);
        translate([-60/2, 20+18/2, 5/2]) rotate([0,90,0]) %cylinder(d=screw_d, h=x*2);
        
    }
}
module mount2() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 6;
    $fs= 0.9;
    difference() {
        union() {
            translate([8, 0, 0]) cube([x,y,z]);
            hull() {
                
            }
        }
        translate([0,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z*4);
        translate([0,0,-1]) cylinder(d=22,h=z+2);
    }
}
module hollow_cyl(d, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d=d+w*2, h=h);
        translate([0,0,-1])cylinder(d=d, h=h+2);
    }
}
module link1() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 6;
    difference() {
        union() {
            mount2();
            mirror([0,1,0]) mount2();
            hull() {
                mirror([0,1,0]) mount2();
                translate([45,-100,0])hollow_cyl( d=3, w=4, h=6);
            }
        }
        translate([0,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z*4);
        mirror([0,1,0]) translate([0,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z*4);
        translate([0,0,-1]) cylinder(d=22,h=z+2);
        translate([45,-100,0])  cylinder(d=3,h=z*4);
    }
    
}
//link1();
//f8x16();
//translate([0,10,0])servo_frame();
//translate([90,0,0])f8x(80);
//translate([90,80,0])f8x(80);

//translate([90,-10 -40,0])f8x(40);