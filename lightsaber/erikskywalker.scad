


%translate([0,0,290]) cube([10,10,10]);
body_d = 34;
body_h = 220;
hilt();

//import_stl("test.stl", convexity = 5);

translate([0,0,body_h-100]) color("red") cylinder(d=23, h=800);

translate([50,0,20]) color("blue") cylinder(d=18, h=70);

module hilt() {
    difference() {
        union() {
            color([0.8,0.8,0.8]) cap();
            translate([0,0,20]) reflor(antal=8, d1=body_d, d2=body_d+6, space1=6);
            color([0.8,0.8,0.8]) translate([0,0,10+9*8]) cylinder(d=body_d, h=body_h-(10+9*8));
            
            color([0.2,0.2,0.2])translate([0,0,10+9*8+20]) cylinder(d=body_d+1, h=20);
            color([0.2,0.2,0.2])translate([0,0,10+9*8+20+20+20]) cylinder(d=body_d+1, h=20);
            color([0.2,0.2,0.2]) translate([0,0,10+9*8+20*5]) cylinder(d=body_d+1, h=20);
            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,0]) klor();

            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,90]) klor();

            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,90*2]) klor();

            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,90*3]) klor();
        }
        translate([0,0,body_h-100]) cylinder(d=25, h=400);
        
        rotate([0,0,90*0]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        rotate([0,0,90*1]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        rotate([0,0,90*2]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        rotate([0,0,90*3]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
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
        color([0.9,0.1,0.1]) translate([0,0,((space1+space2)*i)+space1/2]) cylinder(d=d2, h=space2);
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