//
$fs = 0.5;
$fa = 5.1;



%translate([0,0,290]) cube([10,10,10]);
flash_d = 38.1;

difference() {
    //lightsaber_bottom();
    lightsaber_top();
    translate([0,0,5]) cylinder(d=16.5, h = 780);
}

   % translate([0,0,5]) cylinder(d=16.5, h = 780+290);

module lightsaber_bottom() {
    difference() {
        union() {
            //flash();
            translate([0,0,7])flash_body();
            color([0.1,0.1,0.1]) translate([0,0,7+96+21])flash_clip();
            color("lightgrey") translate([0,0,0])flash_endcap();
            antal = 6;
            for ( i = [0 : antal-1] ) {
                color([0.1,0.1,0.1]) rotate( i * 360 / antal, [0, 0, 1]) translate([0, flash_d/2-1, 7]) t_track();
            }
        }
        translate([0,0,7+96+21+46]) cylinder(d=100, h=100);
        translate([0,0,7+96+21+46-2]) cylinder(d=flash_d+1, h=100);
    }
    //color([0.1,0.1,0.1]) translate([-flash_d/2+2, 0, 290-45-25-35])sidepice1();
    //color([0.1,0.1,0.1]) translate([0, 0, 290-45-25])topcap();
}
module lightsaber_top() {
    difference() {
        union() {
            //flash();
            translate([0,0,7])flash_body();
            color([0.1,0.1,0.1]) translate([0,0,7+96+21])flash_clip();
            color("lightgrey") translate([0,0,0])flash_endcap();
            antal = 6;
            for ( i = [0 : antal-1] ) {
                //color([0.1,0.1,0.1]) rotate( i * 360 / antal, [0, 0, 1]) translate([0, flash_d/2-1, 7]) t_track();
            }
        }
        translate([0,0,0]) cylinder(d=100, h=7+96+21+46);
    }
    color([0.1,0.1,0.1]) translate([-flash_d/2+2, 0, 290-45-25-35])sidepice1();
    color([0.1,0.1,0.1]) translate([0, 0, 290-45-25])topcap();
}

module flash() {
    translate([0,0,7])flash_body1();
    translate([0,0,7])flash_body2();
    color([0.1,0.1,0.1]) translate([0,0,7+96+21])flash_clip();
    color("lightgrey") translate([0,0,0])flash_endcap();
}


module flash_body() {
    dd = flash_d;
    hh = 290-45-3-7;
    color("lightgrey")difference() {
        union() {
            cylinder(d=dd, h=hh);
        }
        
        rotate([0,0,0]) translate([dd/2-3,0,hh-25-5]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        rotate([0,0,0]) translate([dd/2-3,0,hh-25-5-13]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        
        rotate([0,0,70]) translate([dd/2-3,0,hh-25-5]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        rotate([0,0,70]) translate([dd/2-3,0,hh-25-5-13]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        
        rotate([0,0,-70]) translate([dd/2-3,0,hh-25-5]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        rotate([0,0,-70]) translate([dd/2-3,0,hh-25-5-13]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        
        rotate([0,0,-105]) translate([dd/2-2,0,hh-25-5-8]) rotate([0,90,0]) cylinder2(d=8, h=10, x=15-8);
        
        
        rotate([0,0,-60]) translate([dd/2-2,0,hh-25-5-13-10]) rotate([0,90,0]) cylinder(d=2, h=10);
        rotate([0,0,60]) translate([dd/2-2,0,hh-25-5-13-10]) rotate([0,90,0]) cylinder(d=2, h=10);
        
        translate([0, 0, 290-45-25-35-7]) rotate([0,-90,0]) union() {
            translate([7/2,0,0])  cylinder(d=2.85, h=50*2); // skruvar för bladet
            translate([55-7/2,0,0])  cylinder(d=2.85, h=50*2);
        }
    }
    color("red")rotate([0,0,-105]) translate([dd/2-2,0,hh-25-5-8]) rotate([0,90,90]) torus(d=8, r=2.5/2);

    color("red")rotate([0,0,-75]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
    color("red")rotate([0,0,-65]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
    
    color("red")rotate([0,0,75]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
    color("red")rotate([0,0,65]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
}


module flash_body2() {
    dd = flash_d;
    hh = 290-45-3-7;
    color("lightgrey")difference() {
        union() {
            cylinder(d=dd, h=hh);
        }
        
        rotate([0,0,0]) translate([dd/2-3,0,hh-25-5]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        rotate([0,0,0]) translate([dd/2-3,0,hh-25-5-13]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        
        rotate([0,0,70]) translate([dd/2-3,0,hh-25-5]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        rotate([0,0,70]) translate([dd/2-3,0,hh-25-5-13]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        
        rotate([0,0,-70]) translate([dd/2-3,0,hh-25-5]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        rotate([0,0,-70]) translate([dd/2-3,0,hh-25-5-13]) rotate([0,90,0]) cylinder2(d=5, h=10, y=5);
        
        rotate([0,0,-105]) translate([dd/2-2,0,hh-25-5-8]) rotate([0,90,0]) cylinder2(d=8, h=10, x=15-8);
        
        
        rotate([0,0,-60]) translate([dd/2-2,0,hh-25-5-13-10]) rotate([0,90,0]) cylinder(d=2, h=10);
        rotate([0,0,60]) translate([dd/2-2,0,hh-25-5-13-10]) rotate([0,90,0]) cylinder(d=2, h=10);
        
        translate([0, 0, 290-45-25-35-7]) rotate([0,-90,0]) union() {
            translate([7/2,0,0])  cylinder(d=2.85, h=50*2); // skruvar för bladet
            translate([55-7/2,0,0])  cylinder(d=2.85, h=50*2);
        }
    }
    color("red")rotate([0,0,-105]) translate([dd/2-2,0,hh-25-5-8]) rotate([0,90,90]) torus(d=8, r=2.5/2);

    color("red")rotate([0,0,-75]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
    color("red")rotate([0,0,-65]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
    
    color("red")rotate([0,0,75]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
    color("red")rotate([0,0,65]) translate([dd/2-5,0,hh-25-5-13/2]) rotate([0,90,90]) torus(d=15, r=2.5/2);
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
    translate([0,0,hh/2])controlbox();
    //translate([flash_d/2+11,0,hh/2]) rotate([0,90,0]) rotate([0,0,90]) boubles();

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
        translate([7/2,0,0]) cylinder(d=5, h=zz*2);
        translate([6+7,0,5]) cylinder(d=12, h=zz);
        translate([35+6,0,1]) cylinder(d=5, h=zz);
        translate([55-7/2,0,0]) cylinder(d=5, h=zz*2);
    }
}

module topcap() {
    fasning_d = 20;
    fasning_x = 0;
    difference() {
        union() {
            hull() {
                translate([0,0,0]) cylinder(d=44, h=25);
                translate([-44/2+3,-44/2+4,0]) cylinder(d=8, h=25);
                
                translate([-44/2+3,44/2-4,0]) cylinder(d=8, h=25);
            }
            translate([0,0,25]) cylinder(d=40, h=45);
            
            hull() {
                translate([0,0,25]) rotate([0,-90,0]) cylinder(d=12, h=44/2+1);
                translate([0,0,25+10]) rotate([0,-90,0]) cylinder(d=12, h=44/2+1);
            }
        }
        translate([-3,0,25+10]) rotate([0,-90,0]) cylinder(d=6, h=44/2+1);
        
        translate([0,0,25+1]) cylinder(d=40-4, h=45);
        translate([-44/2,-50,25+45]) rotate([0,35,0]) cube([100,100,100]);
        hull() {
          translate([0,0,0]) rotate([0,-90,0]) cylinder(d=12, h=100);
          translate([0,0,15]) rotate([0,-90,0]) cylinder(d=12, h=100);
        }
        hull() {
          translate([fasning_x+0,50,11-fasning_d/2]) rotate([90,0,0]) cylinder(d=fasning_d, h=100);
          translate([fasning_x+50,50,11-fasning_d/2]) rotate([90,0,0]) cylinder(d=fasning_d, h=100);
            
          translate([fasning_x-20,50,11-fasning_d/2-40]) rotate([90,0,0]) cylinder(d=fasning_d, h=100);
        }
        
        invertedcone(d1=flash_d, d2=60, h=10);
    }
}

module controlbox() {
    utstick = 14;
    difference() {
        union() {
            hull() {
                translate([flash_d/2+utstick,0,2]) cube([0.1,15,40], center=true);
                translate([flash_d/2,0,0]) cube([0.1,15,46], center=true);
            }
        }
        translate([flash_d/2+utstick-1-1.1,0,0]) cube([2.2,15-2,46], center=true);
        translate([flash_d/2+utstick-1+3,0,0]) cube([10,15-2-6,46], center=true);
    }
}

module boubles() {
    x = 14.5;
    y = 40;
    z = 2;
    translate([-x/2, -y/2, 0]) cube([x, y, z]);
    translate([0, 20-3-4, 1]) sphere(d=6);
    
    translate([0, 20-3-4-6, 1]) sphere(d=6);
    translate([0, 20-3-4-6-6, 1]) sphere(d=6);
    translate([0, 20-3-4-6-6-6, 1]) sphere(d=6);
    translate([0, 20-3-4-6-6-6-6, 1]) sphere(d=6);
    translate([0, 20-3-4-6-6-6-6-6, 1]) sphere(d=6);
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
module cylinder2(d=1, h=1, y=0, x=0) {
    hull() {
        translate([x/2,y/2,0]) cylinder(d=d, h=h);
        translate([-x/2,-y/2,0]) cylinder(d=d, h=h);
        
    }
}

module invertedcone(d1=0, d2=0, h=0) {
    difference() {
        cylinder(d=d2*2, h=h);
        cylinder(d1=d1, d2=d2, h=h);
    }
    
}