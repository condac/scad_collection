// main-chassie
translate([28, -65.1, 0])  rotate([0,0,180]) import("main.stl", convexity=10);
//batteri
batteri_x = 48;
batteri_y = 96;
batteri_z = 28;
b_offset_z = 2; // höjden batteriet ligger på, det som blir basens tjocklek i botten

// bas
b_x = 53;
b_y = 135;
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
s_z = 14;


main_chassie();

module main_chassie() {
    difference() {
        union() {
            %translate([0, 0, p_offset_z]) plattan();
            translate([0, 0, p_offset_z]) mirror([1,0,0])plattan();
            translate([-b_x/2, 0, 0]) cube([b_x, b_y, b_z]);
            
            // fjädrar
            %translate([s_x, p_bak_offset, b_z]) sido_fjadrar();
            translate([-s_x, p_bak_offset, b_z]) mirror([1,0,0])sido_fjadrar();
        }
        translate([-batteri_x/2, bakre_wall, b_offset_z]) batteri();
    }
}

module plattan() {
    
    hull() {
        translate([p_x-4, p_y-4, 0]) cylinder(r=4, h=p_z);
        translate([p_x-4, p_y-34, 0]) cylinder(r=4, h=p_z);
        translate([0, p_bak_offset, 0]) cube([p_b_x, p_y-p_bak_offset, p_z]);
        translate([0, p_bak_offset, 0]) cube([1,p_y-p_bak_offset+11,p_z]);
    }
    
}

module batteri() {
    batteri = [batteri_x, batteri_y, batteri_z];
    cube(batteri);
    //cube([batteri_x, batteri_y, batteri_z]);
}

module sido_fasten() {
    
}

module sido_fjadrar() {
    
    cube([]);
}

