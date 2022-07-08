use <lightsaberparts.scad>;

$fs = 0.5;
$fa = 5.1;

body_d = 38;


blade_d = 25.4;
blade_h = 70;
part2_d = body_d+5;

batteryhole_h = 165;
batteryhole_d = body_d-4;

part1_h = 145;
part2_h = 25;
part3_h = 100;

body_h = part1_h + part2_h +part3_h;


//part_battery();
part1();
//part2();
//part3();
//visualaid();
module visualaid() {
    %translate([0,0,body_h]) cube([10,10,10]);
    difference() {
        union() {
            
            part_battery();
            part1();
            part2();
            part3();
        }
        cube([50,50,1000]);
    }
}
//import_stl("test.stl", convexity = 5);

//translate([0,0,body_h-100]) color("red") cylinder(d=23, h=570);

//translate([50,0,20]) color("blue") cylinder(d=18, h=70);
//translate([0,0,-10]) batterytray1(d=body_d-4-0.5);



module part1() {
    difference() {
        union() {
            //color([0.8,0.8,0.8]) cap();
            translate([0,0,12]) reflor(antal=3, d1=body_d, d2=body_d+3, space1=15);
            translate([0,0,0]) rotate([0,0,45])  cylindercutwall(d=body_d, h=part1_h, r=20);
            translate([0,0,0]) rotate([0,0,45])  cylinder(d=body_d, h=part1_h);
            //color([0.8,0.8,0.8]) translate([0,0,9*8]) cylinder(d=body_d, h=part1_h-9*8);

        }

        
        // sågning för batterihållare
        translate([0,0,-2]) cylinder(d=batteryhole_d, h=batteryhole_h);
        // kabelhål
        translate([0,0,-2]) cylinder(d=15, h=400);
        
        //translate([0,0,10/2+0.5]) batterytray1_screw_cut(d = body_d);
        
        //knapp
        hull() {
            translate([body_d/2-10,0,0+5]) rotate([0,90,0]) cylinder(d=12.8, h=30);
            translate([body_d/2-10,0,0]) rotate([0,90,0]) cylinder(d=12.8, h=30);
        }
        all_screws();
    }
}

module part2() {
    difference() {
        union() {
             //translate([0,0,part1_h-10]) cylinder(d=part2_d, h=part2_h+10+10);
            translate([0,0,part1_h-10]) knappbox(d=body_d+6, h=part2_h+10+10);
        }

        
        // sågning för hopfästning
        translate([0,0,part1_h-10-1]) cylinder(d=body_d+0.3, h=11+1);
        
        translate([0,0,part1_h+part2_h-1]) cylinder(d=body_d+0.3, h=12+1);
        // kabelhål
        translate([0,0,-2]) cylinder(d=body_d-2, h=400);
        
        // sågning för batterihållare
        translate([0,0,-2]) cylinder(d=batteryhole_d, h=batteryhole_h);
        
        all_screws();
    }
}

module part3() {
    reflor = 4;
    reflor_h = reflor*9;
    reflor_d1 = 36;
    reflor_d2 = 42;
    difference() {
        union() {
            translate([0,0,body_h-part3_h]) cylinder(d=body_d, h=10);
            difference() {
                union() {
                    //color([0.8,0.8,0.8]) cap();
                    //color([0.8,0.8,0.8]) translate([0,0,0]) cylinder(d=body_d, h=body_h-50-8*6+1-20-20);
                    translate([0,0,part1_h+part2_h+10]) reflor(antal=reflor, d1=reflor_d1, d2=reflor_d2, space1=6, space2=3);
                    color([0.8,0.7,0.7]) 
                    translate([0,0,part1_h+part2_h+10+reflor_h]) cylinder(d=reflor_d1, h=part3_h-reflor_h-10);
                    //translate([0,0,body_h-4]) torus(d=body_d-6-4, r=4);
                    translate([0,0,part1_h+part2_h+10+reflor_h+6]) reflor(antal=4, d1=reflor_d1, d2=reflor_d2, space1=6);
                    //translate([0,0,0]) cylindercutwall(d=body_d, h=120, r=20);
                    
                    //translate([0,0,body_h-9*8-9-6-45]) knappbox(d=body_d, h=45);
                }
                antal = 10;
                translate([0,0,part1_h+part2_h+10+reflor_h+3]) for ( i = [0 : antal-1] ) {
                    rotate([0,0,i*(360/antal)]) rotate([90,0,0]) cylinder(d=6, h=body_d);
                    
                }
                
                
                
            }
        }
        
        // bladet
        translate([0,0,part1_h+part2_h+part3_h-blade_h]) cylinder(d=blade_d, h=400);
        
        // kabelhål
        translate([0,0,-2]) cylinder(d=15, h=400);
        // sågning för batterihållare
        translate([0,0,-2]) cylinder(d=batteryhole_d-4, h=batteryhole_h);
        
        all_screws();
    }
}

module part_battery() {
    difference() {
        translate([0,0,-12]) batterytray2(d=body_d-4-0.5);
        all_screws();
    }
}
%all_screws();
module all_screws() {
    translate([0,0,10/2+0.5]) batterytray1_screw_cut(d = body_d);
    
    // part1 - part2
    translate([0,-part2_d/2,part1_h-5]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    translate([0,part2_d/2,part1_h-5]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90]) translate([0,-part2_d/2,part1_h-5]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90])translate([0,part2_d/2,part1_h-5]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    
    // part2 - part3
    translate([0,-part2_d/2,part1_h+part2_h+5]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    translate([0,part2_d/2,part1_h+part2_h+5]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90]) translate([0,-part2_d/2,part1_h+part2_h+5]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90])translate([0,part2_d/2,part1_h+part2_h+5]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    
    // skruvar som håller bladet
    
    translate([0, -body_d/2+1, part1_h+part2_h+part3_h-10]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    translate([0, body_d/2-1, part1_h+part2_h+part3_h-10]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90]) translate([0,-body_d/2+1,part1_h+part2_h+part3_h-blade_h+5]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90])translate([0,body_d/2-1,part1_h+part2_h+part3_h-blade_h+5]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    
}

module cap() {
    
    difference() {
        cylinder(d=body_d+10, h=20);
        for ( i = [0 : 6-1] ) {
            rotate([0,0,(360/6)*i]) translate([body_d/2+10,0,-1]) cylinder(d=20, h=22);
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
