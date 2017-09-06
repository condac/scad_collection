//


p_d1 = 12.5; // hyllsans stora diameter 12mm
p_d2 = 11; // diametern inne i klacken 10.4mm

h0 = 0.4*4;
h1 = 2; // höjd första delen bakifrån på hyllsan
h2 = 0.9;
h3 = 0.8;

b = 6;
w = 14.4;
m_h = 62; // total höjd/längd på magasinet 62
stop_h = 15;
stop_w = 16;

spring_w = 9;
spring_y = 0.4*2;

$fs=0.1;
magasin();
module magasin() {
    difference() {
        union() {
            translate([-w/2, 0, 0]) cube([w, b, m_h]);
            translate([-stop_w/2, 1, stop_h]) cube([stop_w, 2, 4]);
            translate([-stop_w/2, 1, m_h-stop_h-4]) cube([stop_w, 2, 4]);
        }
        
        hull() {
            translate([0, h0, 0]) rotate([-90,0,0]) cylinder(d=p_d1, h=h1);
            translate([0, h0, m_h]) rotate([-90,0,0]) cylinder(d=p_d1, h=h1);
        }
        hull() {
            translate([0, h0+h1, 0]) rotate([-90,0,0]) cylinder(d=p_d2, h=h2);
            translate([0, h0+h1, m_h]) rotate([-90,0,0]) cylinder(d=p_d2, h=h2);
        }
        hull() {
            translate([0, h0+h1+h2, 0]) rotate([-90,0,0]) cylinder(d1=p_d2, d2=p_d1, h=h3);
            translate([0, h0+h1+h2, m_h]) rotate([-90,0,0]) cylinder(d1=p_d2, d2=p_d1, h=h3);
        }
        
        hull() {
            translate([0, h0+h1+h2+h3, 0]) rotate([-90,0,0]) cylinder(d=p_d1+2, h=50);
            translate([0, h0+h1+h2+h3, m_h]) rotate([-90,0,0]) cylinder(d=p_d1+2, h=50);
        }
        //translate([-spring_w/2-1, 0, m_h-11]) cube([spring_w+2, spring_y+10, 12+1]);
    }
    translate([-w/2, 0, 0]) cube([w, b, 1]);
    //m
    translate([-spring_w/2, 0, m_h-12]) rotate([-10,0,0]) cube([spring_w, spring_y, 12]);
}
    
    