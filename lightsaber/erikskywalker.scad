use <lightsaberparts.scad>;

$fs = 0.5;
$fa = 5.1;

body_d = 34;
body_h = 220;

blade_d = 17;
part2_d = body_d+5;

part1_h = 100;
part2_h = 5;
part3_h = 100;
%translate([0,0,body_h]) cube([10,10,10]);
//difference() {
   // union() {
        
        //part1();
        //part2();
        //part3();
        part_battery();
  //  }
 //   cube([50,50,1000]);
//}

//import_stl("test.stl", convexity = 5);

//translate([0,0,body_h-100]) color("red") cylinder(d=23, h=570);

//translate([50,0,20]) color("blue") cylinder(d=18, h=70);
//translate([0,0,-10]) batterytray1(d=body_d-4-0.5);

module hilt() {
    difference() {
        union() {
            //color([0.8,0.8,0.8]) cap();
            translate([0,0,0]) reflor(antal=8, d1=body_d, d2=body_d+6, space1=6);
            color([0.8,0.8,0.8]) translate([0,0,-1+9*8]) cylinder(d=body_d, h=body_h-(10+9*8));
            
            color([0.2,0.2,0.2])translate([0,0,0+9*8+20]) cylinder(d=body_d+1, h=20);
            color([0.2,0.2,0.2])translate([0,0,0+9*8+20+20+20]) cylinder(d=body_d+1, h=20);
            color([0.2,0.2,0.2]) translate([0,0,0+9*8+20*5]) cylinder(d=body_d+1, h=20);
            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,0]) klor();

            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,90]) klor();

            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,90*2]) klor();

            color([0.2,0.2,0.2]) translate([0,0,body_h]) rotate([0,0,90*3]) klor();
        }
        translate([0,0,body_h-100]) cylinder(d=25, h=400);
        
        rotate([0,0,45+90*0]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        rotate([0,0,45+90*1]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        rotate([0,0,45+90*2]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        rotate([0,0,45+90*3]) translate([body_d/2-8,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=10, y=10);
        
        // sågning för batterihållare
        translate([0,0,-2]) cylinder(d=body_d-4-0.5, h=110);
        // kabelhål
        translate([0,0,-2]) cylinder(d=15, h=400);
        
        translate([0,0,10/2+0.5]) batterytray1_screw_cut(d = body_d);
        
    }
}

module part1() {
    difference() {
        union() {
            //color([0.8,0.8,0.8]) cap();
            translate([0,0,0]) reflor(antal=8, d1=body_d, d2=body_d+6, space1=6);
            color([0.8,0.8,0.8]) translate([0,0,9*8]) cylinder(d=body_d, h=part1_h-9*8);

        }

        
        // sågning för batterihållare
        translate([0,0,-2]) cylinder(d=body_d-4, h=110);
        // kabelhål
        translate([0,0,-2]) cylinder(d=15, h=400);
        
        //translate([0,0,10/2+0.5]) batterytray1_screw_cut(d = body_d);
        all_screws();
    }
}

module part2() {
    difference() {
        union() {
             translate([0,0,part1_h-10]) cylinder(d=part2_d, h=part2_h+10+10);

        }

        
        // sågning för hopfästning
        translate([0,0,part1_h-10-1]) cylinder(d=body_d+0.5, h=11+1);
        
        translate([0,0,part1_h+part2_h-1]) cylinder(d=body_d+0.5, h=12+1);
        // kabelhål
        translate([0,0,-2]) cylinder(d=body_d-2, h=400);
        all_screws();
    }
}

module part3() {
    difference() {
        union() {
            
            //color([0.8,0.8,0.8]) 
            translate([0,0,part1_h+part2_h]) cylinder(d=body_d, h=part3_h);
            
            //color([0.2,0.2,0.2])
            //translate([0,0,0+9*8+20]) cylinder(d=body_d+1, h=20);
            //color([0.2,0.2,0.2])
            translate([0,0,0+9*8+20+20+20]) cylinder(d=body_d+1, h=20);
            //color([0.2,0.2,0.2]) 
            translate([0,0,0+9*8+20*5]) cylinder(d=body_d+1, h=20);
            //color([0.2,0.2,0.2]) 
            translate([0,0,part1_h+part2_h+part3_h]) rotate([0,0,0]) klor();

            color([0.2,0.2,0.2]) translate([0,0,part1_h+part2_h+part3_h]) rotate([0,0,90]) klor();

            color([0.2,0.2,0.2]) translate([0,0,part1_h+part2_h+part3_h]) rotate([0,0,90*2]) klor();

            color([0.2,0.2,0.2]) translate([0,0,part1_h+part2_h+part3_h]) rotate([0,0,90*3]) klor();
        }
        
        
        rotate([0,0,45+90*0]) translate([body_d/2-11,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=body_d, y=10);
        rotate([0,0,45+90*1]) translate([body_d/2-11,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=body_d, y=10);
        rotate([0,0,45+90*2]) translate([body_d/2-11,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=body_d, y=10);
        rotate([0,0,45+90*3]) translate([body_d/2-11,0,body_h-25]) rotate([0,90,0]) cylinder2(d=8, h=body_d, y=10);
        
        // bladet
        translate([0,0,part1_h+part2_h+10]) cylinder(d=blade_d, h=400);
        
        // kabelhål
        translate([0,0,-2]) cylinder(d=15, h=400);
        all_screws();
    }
}

module part_battery() {
    difference() {
        translate([0,0,-10]) batterytray1(d=body_d-4-0.5);
        all_screws();
    }
}

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
    
    translate([0,-body_d/2+1,part1_h+part2_h+20]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    translate([0,body_d/2-1,part1_h+part2_h+20]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90]) translate([0,-body_d/2+1,part1_h+part2_h+part3_h-30]) rotate([90,0,0]) m3screw_cut(l=15, l2=2);
    rotate([0,0,90])translate([0,body_d/2-1,part1_h+part2_h+part3_h-30]) rotate([-90,0,0]) m3screw_cut(l=15, l2=2);
    
}

module cap() {
    
    difference() {
        cylinder(d=body_d+10, h=20);
        for ( i = [0 : 6-1] ) {
            rotate([0,0,(360/6)*i]) translate([body_d/2+10,0,-1]) cylinder(d=20, h=22);
        }

    }
}