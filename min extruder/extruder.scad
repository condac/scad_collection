//

b608_8 = 8;
b608_ytter = 22;
b608_h = 7;

    b625_d = 16.1;
    b625_h = 5.5;
    
    f_h = 8+8.5; // height for filament position
    f_off = 7.5/2; // offset for filament from M5 axle centrum

    
nema_screw_d = 3;
nema_screw_dist = 31;
tube_d = 4;

    mk8_big = 10; // diameter where mounting screw is
    mk8 = 9.2;
    mk8_small = 7.5;
    
    
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


module tubeholder(z=4) {
    
    screw_d = 3;
    nut_d = 5;
    x = 14;
    y = 14;
    clamp_gap = 1;
    //z = 4;
    nut4_d = 8;
    
    difference() {
        translate([-x/2, -y/2, -z]) roundedcube(x,y,z,3);
        translate([0,-y,0]) rotate([-90,0,0]) cylinder(d= tube_d, h= 30, $fn=64);
        
        //screws
        screw_s = 4;
        translate([screw_s, screw_s, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        translate([-screw_s, screw_s, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        translate([screw_s, -screw_s, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        translate([-screw_s, -screw_s, -z-1]) cylinder(d=screw_d, h=z*2, $fn=64);
        
        //nuts
        translate([screw_s, screw_s, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        translate([-screw_s, screw_s, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        translate([screw_s, -screw_s, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        translate([-screw_s, -screw_s, -z-1]) cylinder(d=nut_d, h=2.5, $fn=6);
        
        translate([-x/2, -y/2, -clamp_gap]) roundedcube(x,y,z,3);
    }
}
module tubeholder_cut(z=4) {
    
    screw_d = 3;
    nut_d = 5;
    x = 14;
    y = 14;
    clamp_gap = 1;
    //z = 4;
    nut4_d = 8;
    
    difference() {
        translate([-x/2, -y/2, -z]) roundedcube(x,y,z,3);
        translate([0,-y,0]) rotate([-90,0,0]) cylinder(d= tube_d, h= 30, $fn=64);
        
        
    }
}
//tubeholder();


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
    gearing_dist = 45;
    
    y = nema_screw_dist + 3 + 4;
    x = y + gearing_dist;
    z = 8;
    
    nema_hole = 24; // the hole for extra part sticking out of stepper around axle
    
    f = 2; // for hole
    f1= 1.75; // for visual

    
    
    difference() {
        union() {
            difference() {
                
                translate([-y/2-gearing_dist, -y/2, 0]) cube([x, y, z]);
                translate([f_off,20,f_h-5])tubeholder_cut(z=f_h);
                
            }
            cylinder(d=b625_d+4, h=b625_h+1);
            translate([0,0,f_h-8.5]) rotate([]) %mk8();
            hull() {
                translate([f_off,0,f_h]) rotate([-90,0,0]) cylinder(d=5, h= 13, $fn=32);
                translate([f_off,0,5]) rotate([-90,0,0]) cylinder(d=5, h= 13, $fn=32);
            }
            hull() {
                translate([f_off,-15,f_h]) rotate([-90,0,0]) cylinder(d=5, h= 5, $fn=32);
                translate([f_off,-15,5]) rotate([-90,0,0]) cylinder(d=5, h= 5, $fn=32);
            }
            translate([f_off,20,f_h])tubeholder(z=f_h);
            
            //screw poles
            translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=5.8, h=f_h+10, $fn=20);
            
            translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=5.8, h=f_h+10, $fn=20);
            //short pole
            translate([+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=5.8, h=z+2, $fn=20);
        }
        
        //b625 1
        cylinder(d=b625_d, h=b625_h);
        cylinder(d=b625_d-2, h=z);
        
        //b608 cut
        
        translate([b608_d/2+mk8/2-1, 0, f_h-b608_h/2]) %cylinder(d=b608_d, h=b608_h);
        translate([b608_d/2+mk8/2-1, 0, z]) cylinder(d=b608_d, h=b608_h+f_h);
        
        // gear cut
        color("cyan") translate([0,0,f_h-8.5]) mk8();
        color("cyan") translate([0,0,f_h-8.5]) cylinder(d=mk8, h=20);;
        
        // filamen guide
        translate([f_off,-15,f_h]) rotate([-90,0,0]) cylinder(d=3, h= 5, $fn=32);
        
        
        // overhang cut
        translate([0,0,z])cylinder(d1=b625_d-2, d2=mk8_small, h=z);
        
        
        //nema big hole
        translate([-gearing_dist, 0, 0]) cylinder(d=nema_hole, h = z);
        
        //nema mounting screw
        translate([-gearing_dist-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
        translate([-gearing_dist+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
        translate([-gearing_dist+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
        translate([-gearing_dist-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = z, $fn=16);
    
        //nema mounting screw
        translate([-nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
        translate([+nema_screw_dist/2, -nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
        translate([+nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
        translate([-nema_screw_dist/2, +nema_screw_dist/2, 0]) cylinder(d=nema_screw_d, h = 100, $fn=16);
                
        //filament
        color("red")translate([f_off,-50,f_h]) rotate([-90,0,0]) %cylinder(d=f1, h= 100, $fn=16);
        color("red")translate([f_off,-50,f_h]) rotate([-90,0,0]) cylinder(d=f, h= 100, $fn=16);

    }
    
}
extruder();
//color("cyan") mk8();
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
translate([0,0,f_h+10+6]) rotate([180,0,0]) brace();