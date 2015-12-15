//

b608_8 = 8;
b608_ytter = 22;
b608_h = 7;

    b625_d = 16+ 0.3;
    b625_h = 5.5;
    
    f_h = 8+8.5; // height for filament position
    f_off = 7.5/2+2/4; // offset for filament from M5 axle centrum

    
nema_screw_d = 3.3;
nema_screw_dist = 31;
tube_d = 4;

    mk8_big = 10; // diameter where mounting screw is
    mk8 = 9.2;
    mk8_small = 7.5;
    
    base_h = 8;
    
    
module b608() {
    
    difference() {
        cylinder(d=b608_ytter, h=b608_h);
        cylinder(d=b608_8, h=b608_h);
    }
    
}

//b608();

module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim, $fn=fn);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
    }
}


module tubeholder(z=4, nut=6.5) {
    
    screw_d = 3;
    nut_d = nut;
    x = 17;
    y = 19;
    clamp_gap = 1;
    //z = 4;
    nut4_d = 7.3;
    
    difference() {
        translate([-x/2, 0, -z]) roundedcube(x,y,z,3);
        translate([0,-y,0]) rotate([-90,0,0]) cylinder(d= tube_d, h= 50, $fn=64);
        
        translate([0,0,0]) rotate([-90,0,0]) cylinder(d= nut4_d, h=3.2 , $fn=6);
        //screws
        screw_x = 3.5;
        screw_y = 5;
        translate([screw_x, screw_y +y/2, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        translate([-screw_x, screw_y+y/2, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        translate([screw_x, -screw_y+y/2, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        translate([-screw_x, -screw_y+y/2, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        
        //nuts
        translate([screw_x, screw_y+y/2, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        translate([-screw_x, screw_y+y/2, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        translate([screw_x, -screw_y+y/2, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        translate([-screw_x, -screw_y+y/2, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        
        translate([-x/2, 0, -clamp_gap]) roundedcube(x,y,z,3);
    }
}
module tubeholder_cut(z=4) {
    
    screw_d = 3;
    nut_d = 6.5;
    x = 17;
    y = 17;
    clamp_gap = 1;
    //z = 4;
    nut4_d = 8;
    
    difference() {
        translate([-x/2, 0, -z]) roundedcube(x,y,z,3);
        translate([0,-y,0]) rotate([-90,0,0]) cylinder(d= tube_d, h= 30, $fn=64);
        
        
    }
}



module mk8() {

    h1 = 5;
    h2 = 6.8 -h1;
    h3 = 8.5 -h1-h2;
    cylinder(d=mk8_big, h= h1);
    translate([0,0,h1]) cylinder(d=mk8, h= h2);
    translate([0,0,h1+h2]) cylinder(d1=mk8, d2=mk8_small, h= h3);
    
    translate([0,0,h1+h2+h3]) cylinder(d2=mk8, d1=mk8_small, h= h3);
    translate([0,0,h1+h2+h3+h3]) cylinder(d=mk8, h= h2);
    translate([0,0,h1+h2+h3+h3+h2]) cylinder(d=mk8_big, h= h1);
    
}
module extruder() {
    b608_d = 22;
    b608_h = 8;
    
    mk8_d = 10;
    gearing_dist = 45.5;
    
    y = nema_screw_dist + 3 + 4;
    x = y + gearing_dist;
    z = base_h;
    
    nema_hole = 24; // the hole for extra part sticking out of stepper around axle
    
    f = 2; // for hole
    f1= 1.75; // for visual

    
    
    difference() {
        union() {
            difference() {
                
                translate([-y/2-gearing_dist, -y/2, 0]) cube([x, y, z]);
                translate([f_off,y/2-1,f_h-5])tubeholder_cut(z=f_h);
                
            }
            cylinder(d=b625_d+4, h=b625_h+1);
            translate([0,0,f_h-8.5]) rotate([]) %mk8();
            //filament outlet
            hull() {
                translate([f_off,0,f_h]) rotate([-90,0,0]) cylinder(d=8, h= 18.1, $fn=32);
                translate([f_off,0,5]) rotate([-90,0,0]) cylinder(d=8, h= 18.2, $fn=32);
            }
            
            //filamen inlet
            hull() {
                translate([f_off-4,  -y/2-10,  f_h+7+2])  cube([1,8+10,1]);
                translate([f_off,  -y/2-10,  f_h+2+2+2]) rotate([-90,0,0]) cylinder(d=8, h= 8+10, $fn=32);
                
                translate([f_off,  -y/2-10,  4]) rotate([-90,0,0]) cylinder(d=8, h= 8+12, $fn=32);
                translate([f_off-4,  -y/2-10,  0])  cube([10,10,1]);
            }
            translate([f_off,y/2-1,f_h])tubeholder(z=f_h);
            
            //screw poles
            translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=10, h=f_h+10, $fn=20);
            
            translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=10, h=f_h+10, $fn=20);
            //short pole
            translate([+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=7, h=z+0.5, $fn=20);
            //Pole support
            translate([-nema_screw_dist/2-3/2,  -nema_screw_dist/2,  0])  cube([3,nema_screw_dist,f_h]);
            hull() {
                translate([-nema_screw_dist/2-3/2-1,  nema_screw_dist/2-3/2,  0])  cube([nema_screw_dist/2+4,3,f_h-2]);
            translate([-nema_screw_dist/2-3/2,  nema_screw_dist/2-3/2,  0])  cube([1,3,f_h+10]);
            
            }
        }
        
        //filament clamp cut
        translate([f_off-4-nema_screw_dist/2+3,-y/2,0]) cube([nema_screw_dist/2-3, 8, z]);
        
        //b625 1
        cylinder(d=b625_d, h=b625_h);
        cylinder(d=b625_d-2, h=z);
        
        //b608 cut
        
        //translate([b608_d/2+mk8/2-1, 0, f_h-b608_h/2]) %cylinder(d=b608_d, h=b608_h);
        translate([b608_d/2+mk8/2-0.5, 0, z]) cylinder(d=b608_d, h=b608_h+f_h);
        
        // gear cut
        color("cyan") translate([0,0,f_h-8.5]) mk8();
        //color("cyan") translate([0,0,f_h-8.5]) cylinder(d=mk8, h=20);;
        
        // filamen guide
        translate([f_off,-y/2-11,f_h]) rotate([-90,0,0]) cylinder(d=3, h= y/2+10, $fn=32);
        
        
        // overhang cut
        translate([0,0,z])cylinder(d1=b625_d-2, d2=mk8_small, h=z);
        
        
        //nema big hole
        translate([-gearing_dist, 0, 0]) cylinder(d=nema_hole, h = z);
        //translate([0, 0, 0]) cylinder(d=nema_hole, h = 2);
        
        //nema mounting screw
        translate([-gearing_dist-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
        translate([-gearing_dist+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
        translate([-gearing_dist+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
        translate([-gearing_dist-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
    
        //nema screw heads heads
        //translate([-gearing_dist-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=5.8, h=2, $fn=20);
        //translate([-gearing_dist+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=5.8, h=2, $fn=20);
        //translate([-gearing_dist-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=5.8, h=2, $fn=20);
        //translate([-gearing_dist+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=5.8, h=2, $fn=20);
        
        //(nema) mounting screw
        translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
        translate([+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
        translate([+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
        translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
                
        //filament
        //color("red")translate([f_off,-50,f_h]) rotate([-90,0,0]) %cylinder(d=f1, h= 100, $fn=16);
        color("red")translate([f_off,-50,f_h]) rotate([-90,0,0]) cylinder(d=f, h= 100, $fn=16);
        
        //outlet filament tube
        translate([f_off,y/2-6,f_h]) rotate([-90,0,0]) cylinder(d=4.2, h= 10, $fn=32);
        
        
        //spring screws
        translate([20, -23 -4+5.5/2, f_h-5+0.5]) rotate([0,-90,0])rotate([0,0,-90]) cylinder(d=3.4, h=50, w=4, $fn=16);
        translate([20, -23 -4+5.5/2, f_h+5+0.5]) rotate([0,-90,0])rotate([0,0,-90]) cylinder(d=3.4, h=50, w=4, $fn=16);
        
        //nut trap
        translate([-1,-23- 4 ,0]) cube([2.5,5.5,50]);

    }
    
}

module brace() {
    hb = 6;
    d_small = 6;
    d_big = 10;
    difference() {
        union() {
            cylinder(d=b625_d+4, h=hb);
            
            hull() {
                cylinder(d=d_small, h=hb);
                translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=d_small, h=hb);
            }
            translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=d_big, h=hb);
            
            hull() {
                cylinder(d=d_small, h=hb);
                translate([+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=d_small, h=hb);
            }
            translate([+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=d_big, h=hb);
            
            hull() {
                cylinder(d=d_small, h=hb);
                translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=d_small, h=hb);
            }
            translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=d_big, h=hb);
        }
        cylinder(d=b625_d, h= b625_h);
        
        cylinder(d=b625_d-2, h= b625_h+hb);
        
        // screw cut
        translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=3, h=hb, $fn=20);
        translate([+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=3, h=hb, $fn=20);
        translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=3, h=hb, $fn=20);
        // screw head cut
        translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=5.8, h=3, $fn=20);
        translate([+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=5.8, h=3, $fn=20);
        translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=5.8, h=3, $fn=20);
    }
}


module cylinder_hull(d = 1, h=1, w=1, fn=32) {
    hull() {
        
        cylinder(d=d, h=h, $fn=fn);
        translate([w,0,0])cylinder(d=d, h=h, $fn=fn);
    }
}
module bearing_holder() {
    h= 7+6+4;
    spring_screw_dist = 10;
    difference() {
        union() {
                translate([0, nema_screw_dist/2, 0]) cylinder(d=10, h=h, $fn=32);
            hull() {
                
                translate([3, nema_screw_dist/2, 0]) cylinder(d=4, h=h);
                translate([-3, 0, 0]) cylinder(d=14, h=h);
                
                //translate([0, -nema_screw_dist/2, 0]) cylinder(d=1, h=h);
                translate([-2, -nema_screw_dist/2, 0]) cube([7,1,h]);
                
            }
            translate([-2, -nema_screw_dist/2-25, 0]) cube([7,25,h]);
        }
        //bearing cut
        translate([-2, 0, 4]) cylinder(d=24, h=8);
        translate([-2, 0, 4]) %cylinder(d=22, h=8);
        
        //bearing axle
        hull() {
            translate([-2, 0, 1]) cylinder(d=8.5, h=15);
            translate([-50, 0, 1]) cylinder(d=8.5, h=15);
        }
        //screww cut
        translate([0, nema_screw_dist/2, 0]) cylinder(d=3.3, h=h, $fn=16);
        
        //spring screws
        translate([20, -23, h/2-spring_screw_dist/2]) rotate([0,-90,0])rotate([0,0,-90]) cylinder_hull(d=3.3, h=50, w=4, fn=16);
        translate([20, -23, h/2+spring_screw_dist/2]) rotate([0,-90,0])rotate([0,0,-90]) cylinder_hull(d=3.3, h=50, w=4, fn=16);
        
        // remove unused material
        translate([-107, -50, 0]) cube([100,100,100]);
        
        
    }
    
    
}


extruder();
//color("cyan") mk8();

//translate([nema_screw_dist/2, 0, base_h+0.5]) bearing_holder();

//translate([7.5/2,20,f_h]) rotate([180,0,0]) tubeholder(z=5, nut=0);

//translate([0,0,f_h+10+6]) rotate([180,0,0]) brace();