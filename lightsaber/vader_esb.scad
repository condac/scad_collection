//
$fs = 0.5;
$fa = 5.1;

lightsaber();
translate([0,0,290]) cube([10,10,10]);
flash_d = 39;
module lightsaber() {
    flash();
    
    antal = 6;
    for ( i = [0 : antal-1] ) {
        color([0.1,0.1,0.1]) rotate( i * 360 / antal, [0, 0, 1]) translate([0, flash_d/2, 7]) t_track();
    }
    
    color([0.1,0.1,0.1]) translate([-flash_d/2+2, 0, 290-45-25-35])sidepice1();
    color([0.1,0.1,0.1]) translate([0, 0, 290-45-25])topcap();
}

module flash() {
    color("lightgrey") translate([0,0,7])flash_body();
    color([0.1,0.1,0.1]) translate([0,0,7+96+21])flash_clip();
    color("lightgrey") translate([0,0,0])flash_endcap();
}


module flash_body() {
    dd = flash_d;
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

module flash_clip() {
    dd = flash_d + 5;
    hh = 46;
    flare = 1.5;
    difference() {
        union() {
            //cylinder(d=dd, h=hh);
            hull() {
                translate([0,0,flare]) torus(d=dd-flare*2, r=flare);
                translate([0,0,hh-flare]) torus(d=dd-flare*2, r=flare);
            }
        }
        translate([0,0,flare]) tube(id=dd-1, od=dd+2, h=hh-flare*2);
    }

}
module flash_endcap() {
    dd = flash_d;
    hh = 7;

    difference() {
        union() {
            translate([0,0,2]) torus(d=dd-2*2, r=2);
            cylinder(d=dd-2*2, h=hh);
            //translate([0,0,2])cylinder(d=dd+4, h=5);
            
            //translate([0,0,2+5])cylinder(d=dd+2, h=19);
        }
    }
    difference() {
        union() {
            translate([0,0,2+5])cylinder(d=dd+2, h=19);
        }
        // ringar
        antal2 = 7;
        for ( i = [0 : antal2-1] ) {
            translate([0, 0, 9 +(i*2)]) torus(d=dd+2, r=0.5);
        }
    }
    difference() {
        union() {
            translate([0,0,2])cylinder(d=dd+4, h=5);
        }
        antal = 142/2;
        for ( i = [0 : antal-1] ) {
            rotate( (i * 360 / antal), [0, 0, 1]) translate([0, flash_d/2, 2]) rotate([0,0,45])cube([10,10,5]);
        }
    }
}

module t_track() {
    xx = 14;
    yy = 7;
    zz = 96;
    dd = 3;
    difference() {
        union() {
            translate([-xx/2,0,0]) cube([xx,2,zz]);
            hull() {
                translate([-4/2,0,0]) cube([4,2,zz]);
                translate([0,yy-dd/2,4]) cylinder(d=dd, h=zz-4-4);
            }
        }
        //translate([-xx/2,2,11]) cube([xx,10,8]);
        //translate([0,2.1,11+4]) rotate([90,0,0])cylinder(d=2.8, h=10);
    }
    
}

module sidepice1() {
    zz = 6;
    rotate([0,-90,0]) difference() {
        union() {
            hull() {
                translate([7/2,0,0]) cylinder(d=7, h=zz);
                translate([6+7,0,0]) cylinder(d=13, h=zz);
            }
            hull() {
                translate([6+7,0,0]) cylinder(d=13, h=zz);
                translate([35+6,0,0]) cylinder(d=10, h=zz);
            }
            hull() {
                translate([35+6,0,0]) cylinder(d=10, h=zz);
                translate([55-7/2,0,0]) cylinder(d=7, h=zz);
            }
        }
    }
}

module topcap() {
    
    difference() {
        union() {
            translate([0,0,0]) cylinder(d=44, h=25);
            translate([0,0,25]) cylinder(d=40, h=45);
        }
    }
}


module torus(r=1, d=1, fn=$fn, angle=360) {
    rotate_extrude(convexity = 10, $fn = fn, angle=angle)
    translate([d/2, 0, 0])
    circle(r = r, $fn = fn);
}

module tube(id=1, od=1, h=1) {
    difference() {
        cylinder(d=od, h=h);
        cylinder(d=id, h=h);
        
    }
}