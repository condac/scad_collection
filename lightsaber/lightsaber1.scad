//
$fs = 0.5;
$fa = 5.1;

lightsaber();

graflex_d = 38;
module lightsaber() {
    graflex();
    
    antal = 7;
    for ( i = [0 : antal-1] ) {
        rotate( i * 360 / antal, [0, 0, 1]) translate([0, graflex_d/2, 0]) t_track();
    }
    
}

module graflex() {
    graflex_body();
    translate([0,0,92])graflex_clip();
}


module graflex_body() {
    dd = graflex_d;
    hh = 268;
    difference() {
        union() {
            cylinder(d=dd, h=hh);
        }
        hull() {
            translate([dd/2,hh/2,hh-dd/2]) rotate([90]) cylinder(d=dd, h=hh);
            translate([dd/2,hh/2,hh+dd]) rotate([90]) cylinder(d=dd, h=hh);
        }
        translate([-dd/2,hh/2,hh-dd/2]) rotate([90]) invertcylinder(d1=dd, h1=hh);
        translate([0,0,hh-dd-2]) cylinder(d=dd-4, h=hh+2);
    }

}
module invertcylinder(d1=1, h1=1) {
    difference() {
        cube([d1,d1,h1]);
        cylinder(d=d1, h=h1);
    }
}

module graflex_clip() {
    dd = graflex_d + 2;
    hh = 51;

    cylinder(d=dd, h=hh);

}

module t_track() {
    xx = 14;
    yy = 7;
    zz = 92;
    dd = 3;
    difference() {
        union() {
            translate([-xx/2,0,0]) cube([xx,2,zz]);
            hull() {
                translate([-4/2,0,0]) cube([4,2,zz]);
                translate([0,yy-dd/2,0]) cylinder(d=dd, h=92);
            }
        }
        translate([-xx/2,2,11]) cube([xx,10,8]);
        translate([0,2.1,11+4]) rotate([90,0,0])cylinder(d=2.8, h=10);
    }
    
}