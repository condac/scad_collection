// main-chassie

%translate([28, -65, 0])  rotate([0,0,180]) import("main.stl", convexity=10);
//translate([28+28+28+15, -20, -91])  rotate([-90,0,0]) rotate([0,0,180]) %import("body.stl", convexity=10);

long = true;
long_extra = 42; // set to 0 if short 42 if long battery
long_extra2 = 18; // set to 0 if short 18 if long battery
//long = false;

//batteri
batteri_x = 48;
batteri_y = 96.5+long_extra;
batteri_z = 28;
b_offset_z = 2; // höjden batteriet ligger på, det som blir basens tjocklek i botten

if (long) {
    echo("long");
    batteri_y = 96.5+long_extra;
} else {
    echo("short");
    batteri_y = 96.5; // 138mm för lång ack
}

// bas
b_x = 53;
b_y = 135+long_extra2;
b_z = 14;

bakre_wall = 6;

//plattan
p_x = 132/2; // bredden på plattan delat med 2
p_b_x = 100/2; // bredden på plattan bak
p_y = 92;
p_z = 2;
p_offset_z = b_z-p_z;
p_bak_offset = 7;

// Fjädrar

s_x = 80/2;
s_z = 12;
s_wall = 5; // väggtjocklek
s_wall_x = 9; // väggbredd
s_plate_z = 3; // plattans tjocklek
s_plate_y = 11; // hur långt bak plattan sticker ut
s_plate_h_y = 6.1; // hur långt bak hålet ska va

// skruvar
$fs= 0.4;
m3_d = 3; // hål som en skruv inte ska fästa i
m3_d_s = 2.8; // hål som skruven ska skapa gängor i

// front mount
fm_y = 8;
fm_z = 30;
fm_screw_dist_z = 20;
fm_screw_dist_x = 44;

// lilla badkaret
lb_wall = 2; // väggen mellan lilla och batteriet
lb_x = batteri_x;
lb_y = b_y-lb_wall-bakre_wall-fm_y-batteri_y;
lb_z = batteri_z;

// sidofästen
sf_y = 44;


main_chassie();

module main_chassie() {
    difference() {
        union() {
            translate([0, 0, p_offset_z]) plattan();
            translate([0, 0, p_offset_z]) mirror([1,0,0])plattan();
            translate([-b_x/2, 0, 0]) cube([b_x, b_y, b_z]);
            
            // fjädrar
            translate([s_x, p_bak_offset, b_z]) sido_fjadrar();
            translate([-s_x, p_bak_offset, b_z]) mirror([1,0,0])sido_fjadrar();
            
            // framfästet
            translate([0,b_y,0]) front_mount();
            translate([0,b_y,0]) mirror([1,0,0]) front_mount();
            
            // sidofästen
            translate([b_x/2, sf_y, 0]) mirror([0,0,0]) sido_fasten();
            translate([-b_x/2, sf_y, 0]) mirror([1,0,0]) sido_fasten();
            
            // fäste för plattan med dämparen
            translate([28, 32, p_offset_z+p_z]) hoger_faste();
            translate([-28, 32, p_offset_z+p_z]) vanster_faste();
            
            // sidodämparen
            translate([0, 0, p_offset_z+p_z])sido_dampare();
        }
        translate([-batteri_x/2, bakre_wall, b_offset_z]) batteri();
        translate([-batteri_x/2, bakre_wall+batteri_y+lb_wall, b_offset_z]) lilla_bad();
        
        //utsågning för skruvar i framfäste
        translate([0,b_y,0]) front_mount_cut();
        translate([0,b_y,0]) mirror([1,0,0]) front_mount_cut();
        
        bak_screw_cut();
        
        
    }
}

module plattan() {
    
    hull() {
        translate([p_x-4, p_y-4+long_extra2, 0]) cylinder(r=4, h=p_z);
        translate([p_x-4, p_y-34+long_extra2, 0]) cylinder(r=4, h=p_z);
        translate([0, p_bak_offset+long_extra2, 0]) cube([p_b_x, p_y-p_bak_offset, p_z]);
        translate([0, p_bak_offset+long_extra2, 0]) cube([1,p_y-p_bak_offset+11,p_z]);
        
        
    }
    translate([0, p_bak_offset, 0]) cube([p_b_x-4, p_y-p_bak_offset, p_z]);
    
    hull() {
        translate([b_x/2-1,p_bak_offset,-2]) cube([1, b_y-p_bak_offset, 2]);
        translate([b_x/2+1,p_bak_offset,0]) cube([1, b_y-p_bak_offset, 2]);
        translate([b_x/2-3,p_bak_offset,0]) cube([1, b_y-p_bak_offset, 2]);
    }
    
}

module batteri() {
    batteri = [batteri_x, batteri_y, batteri_z];
    cube(batteri);
    //cube([batteri_x, batteri_y, batteri_z]);
}

module sido_fasten() {
    skruv_z = 5;
    bredd = 9.5;
    
    difference() {
        hull() {
            translate([0, -2, 0]) cube([bredd, 4, 1]);
            translate([0, -6, skruv_z-1]) cube([bredd, 12, 1]);
            translate([0, -6, p_offset_z]) cube([bredd, 12, 1]);
        }
        translate([0,0,skruv_z]) rotate([0,90,0]) flat_screw_tap(l=bredd);
    }
    
}

module sido_fjadrar() {
    extra_x = s_x - batteri_x/2;
    difference() {
        union() {
            translate([-s_wall_x/2, 0, 0]) cube([s_wall_x, s_wall, s_z]);
            translate([-s_wall_x/2, -s_plate_y, s_z-s_plate_z]) cube([s_wall_x, s_plate_y, s_plate_z]);
        }
        translate([0, -s_plate_h_y, s_z-s_plate_z]) flat_screw_tap(l=s_plate_z);
    }
    translate([-extra_x, 0, 0]) cube([extra_x, s_wall, 5]);
}

module sido_dampare() {
    difference() {
        translate([17,0,0]) cube([9,6,11]);
        translate([17+9/2, 3, 3+0.01]) flat_screw_tap(l=8);
    }
}

module flat_screw_tap(l = 10) {
    tap_z = 0.8;
    cylinder(d = m3_d_s, h= l);
    translate([0,0,l-tap_z]) cylinder(d1 = m3_d_s, d2= m3_d_s+1.8, h= tap_z);
}

module flat_screw(l = 10) {
    tap_z = 0.8;
    cylinder(d = m3_d, h= l);
    translate([0,0,l-tap_z]) cylinder(d1 = m3_d, d2= m3_d+1.8, h= tap_z);
}

module screw_tap(l = 10) {
    cylinder(d = m3_d_s, h= l);
}

module screw(l = 10) {
    cylinder(d = m3_d_s, h= l);
}

module lilla_bad() {
    
    cube([lb_x, lb_y, lb_z]);
}

module front_mount() {
   // hull() {
        translate([fm_screw_dist_x/2, 0, 5+fm_screw_dist_z]) rotate([90]) cylinder(d=10, h=fm_y);
        
    //}
    translate([fm_screw_dist_x/2, -fm_y,  5+fm_screw_dist_z]) cube([5, fm_y, 5]);
    translate([fm_screw_dist_x/2-4.5-5, -fm_y,  b_z]) cube([5, fm_y, 5]);
    translate([fm_screw_dist_x/2-4.5, -fm_y,  0]) cube([5+4, fm_y, 5+fm_screw_dist_z]);
}

module front_mount_cut() {
    
    translate([fm_screw_dist_x/2, -10+0.01, 5]) rotate([-90]) flat_screw(l = 10);
    translate([fm_screw_dist_x/2, -10+0.01, 5+fm_screw_dist_z]) rotate([-90]) flat_screw(l = 10);
    
    translate([fm_screw_dist_x/2-5-4.5, 0, b_z+5]) rotate([90]) cylinder(d=10, h=fm_y);
    
    translate([b_x/2, -fm_y,  0]) cube([5, fm_y, b_z+fm_screw_dist_z]);
    
    //muttrar
    
    translate([fm_screw_dist_x/2, -fm_y-3, 5]) rotate([0,90,0]) rotate([-90,0,0])  cylinder(d=7, h=6, $fn=6);
    translate([fm_screw_dist_x/2, -fm_y-3, 5+fm_screw_dist_z]) rotate([0,90,0]) rotate([-90,0,0])  cylinder(d=7, h=6, $fn=6);
    
}

module hoger_faste() {
    hh = 16;
    difference() {
        hull() {
            translate([0,-2,0]) cylinder(d=10, h=hh);
            translate([0,4,0]) cylinder(d=10, h=hh);
        }
        flat_screw_tap(l = hh);
    }
}

module vanster_faste() {
    hh = 16;
    difference() {
        hull() {
            translate([0,-2,0]) cylinder(d=10, h=hh);
            translate([0,14,0]) cylinder(d=10, h=hh);
        }
        flat_screw_tap(l = hh);
        translate([0,13,0]) flat_screw_tap(l = hh);
    }
}

module bak_screw_cut() {
    translate([0,10-0.01,5]) rotate([90,0,0]) flat_screw_tap(l = 10);
    translate([0,bakre_wall+0.01,5]) rotate([90,0,0]) cylinder(d=7, h=3, $fn=6);
}