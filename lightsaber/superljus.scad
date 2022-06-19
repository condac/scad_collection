$fs = 0.5;
$fa = 5.1;


%translate([0,0,290]) cube([10,10,10]);
body_d = 38;
body_h = 280;
hilt();

//import_stl("test.stl", convexity = 5);

translate([0,0,body_h-80]) color("green") cylinder(d=23, h=570);

translate([50,0,10])batteri18();
translate([50,0,10+76])batteri18();


module hilt() {
    difference() {
        union() {
            //color([0.8,0.8,0.8]) cap();
            //color([0.8,0.8,0.8]) translate([0,0,0]) cylinder(d=body_d, h=body_h-50-8*6+1-20-20);
            translate([0,0,body_h-9*8-9-6]) reflor(antal=8, d1=body_d-6, d2=body_d, space1=6);
            color([0.8,0.8,0.8]) translate([0,0,body_h-30]) cylinder(d=body_d-6, h=30);
            //translate([0,0,body_h-4]) torus(d=body_d-6-4, r=4);
            translate([0,0,body_h-9]) reflor(antal=1, d1=body_d-6, d2=body_d, space1=6);
            translate([0,0,0]) cylindercutwall(d=body_d, h=120, r=20);
            
            translate([0,0,body_h-9*8-9-6-45]) knappbox(d=body_d, h=45);
        }
        antal = 10;
        translate([0,0,body_h-9-3]) for ( i = [0 : antal-1] ) {
            rotate([0,0,i*(360/antal)]) rotate([90,0,0]) cylinder(d=6, h=body_d);
            
        }
        translate([0,0,body_h-100]) cylinder(d=25, h=400);
        
        
    }
}



module klor() {
    z=4;
    rotate([90,0,0]) difference() {
        translate([-5,0,-z/2]) cylinder(d=body_d, h=z);
        
        translate([4,0,-z/2-1]) cylinder(d=body_d, h=z+2);
        translate([4,-4,-z/2-1]) cylinder(d=body_d, h=z+2);
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


module cap() { 
    difference() {
        cylinder(d=body_d+10, h=20);
        for ( i = [0 : 6-1] ) {
            rotate([0,0,(360/6)*i]) translate([body_d/2+10,0,-1]) cylinder(d=20, h=22);
        }
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

module knappbox(d=40, h=20, d2=15) {
    marginal = 3;
    difference(){
        union() {
    difference(){
        union() {
            cylinder(d=d, h=h);
        }
        translate([0,0,h/2]) rotate([0,0,180]) rotate([0,90,0]) cylinder2(d=d2, h=body_d, x=h-marginal-d2);
        translate([0,0,h/2]) rotate([0,0,180-60]) rotate([0,90,0]) cylinder2(d=d2, h=body_d, x=h-marginal-d2);
        translate([0,0,h/2]) rotate([0,0,180+60]) rotate([0,90,0]) cylinder2(d=d2, h=body_d, x=h-marginal-d2);
        translate([0,0,h/2]) rotate([0,0,180-60-60]) rotate([0,90,0]) cylinder2(d=d2, h=body_d, x=h-marginal-d2);
        translate([0,0,h/2]) rotate([0,0,180+60+60]) rotate([0,90,0]) cylinder2(d=d2, h=body_d, x=h-marginal-d2);
        
    }
    color([0.5,0.5,0.5]) cylinder(d=d-2, h=h);
}
translate([0,0,-1])cylinder(d=d-2-4, h=h+2);
}
}
