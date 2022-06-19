batterytray1(d=34-4-0.5);

$fs = 0.5;
$fa = 5.1;

module batterytray1(d = 35) {
    cap_h = 10;
    tube_h = 10;
    plate_h = 45;
    translate([0,-5,cap_h+10]) ghostholder();
    ghostswitch();
    translate([0,7,cap_h+plate_h])arduinoNano();
    difference() {
        union() {
            cylindercutwall(n=6, d=d+15, h=10, r=10, rw=4);
            translate([0,0,cap_h]) tube(id=d-4, od= d, h=tube_h);
            translate([-15/2, 7, cap_h]) cube([15,4,plate_h]);
            
        }
        translate([0,0,-0.1])switchcut();
        //translate([0,0,cap_h+tube_h/2]) batterytray1_screw_cut(d = d+4);
    }
}

module batterytray1_screw_cut(d = 35) {
    union() {
        translate([0,-d/2,0]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
        translate([0,d/2,0]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    }
}

module m3screw_cut(l=15, l2=0) {
    head_d = 6;
    
    cylinder(d=head_d, h=30);
    translate([0,0,-l]) cylinder(d=2.8, h=l) ;
    translate([0,0,-l2]) cylinder(d=3.3, h=l2) ;
}
module klor() {
    z=4;
    dd= 50;
    rotate([90,0,0]) difference() {
        translate([-5,0,-z/2]) cylinder(d=dd, h=z);
        
        translate([6,10,-z/2-1]) cylinder(d=dd, h=z+2);
        translate([4,-0,-z/2-1]) cylinder(d=dd, h=z+2);
    }
}

module reflor(antal=10, d1=1, d2=2, space1=3, space2=3) {
    
    
    for ( i = [0 : antal-1] ) {
        color([0.1,0.1,0.1]) translate([0,0,((space1+space2)*i)]) cylinder(d1=d1, d2=d2, h=space1/2);
        color([0.7,0.7,0.7]) translate([0,0,((space1+space2)*i)+space1/2]) cylinder(d=d2, h=space2);
        color([0.1,0.1,0.1]) translate([0,0,((space1+space2)*i)+space1/2+space2]) cylinder(d1=d2, d2=d1, h=space1/2);
    }
}

module cylinder2(d=1, h=1, y=0, x=0) {
    hull() {
        translate([x/2,y/2,0]) cylinder(d=d, h=h);
        translate([-x/2,-y/2,0]) cylinder(d=d, h=h);
        
    }
}




module torus(r=1, d=1, fn=$fn, angle=360) {
    rotate_extrude(convexity = 10, $fn = fn, angle=angle)
    translate([d/2, 0, 0])
    circle(r = r, $fn = fn);
}

module batteri18() {
    union() {
        color("blue") cylinder(d=18, h=70);
        translate([-21/2,0,-2]) cube([21,17,75]);
    }
}

module cylindercutwall(n=4, d=40, h=10, r=10, rw=2) {
    difference() {
        cylinder(d=d, h=h);
        for ( i = [0 : n-1] ) {
            rotate([0,0,(360/n)*i]) translate([d/2-rw+r,0,-1]) cylinder(r=r, h=h+2);
        
        }
    }
}

module tube(id= 10, od= 20, h=10) {
    difference() {
        
        cylinder(d=od, h=h);
        
        translate([0,0,-1])cylinder(d=id, h=h+2);
    }
    
}

module ghostholder() {
    translate([24,-6,35]) rotate([90,0,0]) %import("18650_minimal_holder.stl", convexity = 5);
    color("blue") %cylinder(d=18.5, h=69);
}

module ghostswitch() {
    s_y = 12.66;
    s_x = 19;
    s_z = 12;
    s_y2 = 14.7;
    s_x2 = 21;
    s_z2 = 2;
    legs_z = 8;
    legs_y = 5;
    legs_x = 1;
    
    %union() {
        translate([-s_x/2, -s_y/2, 0]) cube([s_x,s_y,s_z]);
        
        translate([-s_x2/2, -s_y2/2, -s_z2]) cube([s_x2,s_y2,s_z2]);
        
        
        translate([7, -legs_y/2, s_z]) cube([legs_x,legs_y,legs_z]);
        
        translate([0, -legs_y/2, s_z]) cube([legs_x,legs_y,legs_z]);
        
    }
}


module switchcut() {
    s_y = 13;
    s_x = 21.2;
    s_z = 20;
    
    translate([-s_x/2, -s_y/2, 0]) cube([s_x,s_y,s_z]);
}

module arduinoNano() {
    s_y = 4;
    s_x = 17.6;
    s_z = 45;
    c_y = 7.2;
    c_x = 8;
    c_z = 9.2;
    
    %color("green") translate([-s_x/2, 0, 0]) cube([s_x,s_y,s_z]);
    %color("grey") translate([-c_x/2, 0, 35]) cube([c_x,c_y,c_z]);
}
