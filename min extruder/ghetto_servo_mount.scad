// ghetto Servo mount

servo_x = 12.80;
servo_y = 24;
wall = 3;
z = 10;
wall_extra = 6.5;
servo_screw_distance = 28;

band_thickness = 2.5;
band_w = 7;
mount_extra = band_thickness+wall;

difference () {
    union() {
        cube([servo_x+wall*2,  servo_y+wall_extra*2, z]);
        translate([mount_extra,0,0]) cube([servo_x+wall*2,  servo_y+wall_extra*2, z]);
    }
    translate([wall,wall_extra,0]) cube([servo_x,  servo_y, z]);
    
    color("cyan") translate([wall+servo_x/2,wall_extra+servo_y/2+servo_screw_distance/2,-1]) cylinder(d=3, h=z*2, $fn=24);
    color("cyan") translate([wall+servo_x/2,wall_extra+servo_y/2-servo_screw_distance/2,-1]) cylinder(d=3, h=z*2, $fn=24);
    
    // band cut
    translate([wall+servo_x+wall, wall, -1]) cube([band_thickness, band_w, z*2]);
    translate([wall+servo_x+wall, servo_y+wall_extra*2-wall-band_w, -1]) cube([band_thickness, band_w, z*2]);
    
}
