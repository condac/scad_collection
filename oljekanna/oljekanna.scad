totalvolym = 400000;  // 4dl i mm³
//radie = 100;
hojd = 90;

//hojd = totalvolym / PI*radie*radie;
radie = sqrt(totalvolym/(PI*hojd));
echo(radie);

tratt_r = 30/2;
tratt_r_2 = radie;
tratt_h = 80;
wall = 3;

fn= 64;

difference() {
    union() {
        cylinder(r=radie+wall, h=hojd+wall, $fn=fn);
        translate([2,0,hojd+10]) rotate([0,55,0])  tratt();
    }
    translate([0,0,wall]) cylinder(r=radie, h=hojd+1, $fn=fn);
    translate([2,0,hojd+10]) rotate([0,55,0]) tratt_in(wall2=0);
    translate([-195,-100,hojd+wall]) cube(200);
    translate([0,0,wall+hojd/2])pie(radie+0.3, 20, 1, 90, $fn=fn); //2dl mark 4%
    translate([0,0,wall+hojd/4])pie(radie+0.3, 20, 1, 90, $fn=fn); //1dl mark 2%
    translate([0,0,wall+hojd/2+hojd/4])pie(radie+0.3, 20, 1, 90, $fn=fn); //3dl mark 6%
    
    pie(radie+0.1, 30, 0.5, 90,$fn=100);
}

module tratt_in(wall2=0) {
    hull() {
        scale([1.28, 1, 1]) cylinder(r=tratt_r_2+wall2, 1, $fn=fn);
        translate([0,0,tratt_h])cylinder(r=tratt_r+wall2, 1, $fn=fn);
    }
}
module tratt() {
    difference() {
        tratt_in(wall2=wall);
        tratt_in(wall2=0);
    }
}

//tratt();



// Andras moduler
module pie(radius, angle, height, spin=0) {
    // Negative angles shift direction of rotation
    clockwise = (angle < 0) ? true : false;
    // Support angles < 0 and > 360
    normalized_angle = abs((angle % 360 != 0) ? angle % 360 : angle % 360 + 360);
    // Select rotation direction
    rotation = clockwise ? [0, 180 - normalized_angle] : [180, normalized_angle];
    // Render
    if (angle != 0) {
        rotate([0,0,spin]) linear_extrude(height=height)
            difference() {
                circle(radius);
                if (normalized_angle < 180) {
                    union() for(a = rotation)
                        rotate(a) translate([-radius, 0, 0]) square(radius * 2);
                }
                else if (normalized_angle != 360) {
                    intersection_for(a = rotation)
                        rotate(a) translate([-radius, 0, 0]) square(radius * 2);
                }
            }
    }
}