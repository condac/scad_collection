$fs = 1;

h_d = 4;
h_i_d = 26.7; //hole inner distance
h_dist = h_i_d+h_d;
h_h = 19.5;

difference() {
    
    union() {
        
        translate([0,0,0]) cylinder(d=40, h=6+h_h+10);
        //translate([0,0,1]) cylinder(d=17, h=7);
    }
    translate([0,0,0]) cylinder(d=20, h=250);
    translate([0,0,6]) cylinder(d=24.5, h=250);
    translate([0,0,6]) cylinder(d=34, h=50);
    
    translate([h_dist/2,100,6+h_h+h_d/2]) rotate([90,0,0]) cylinder(d=h_d, h=250);
    translate([-h_dist/2,100,6+h_h+h_d/2]) rotate([90,0,0]) cylinder(d=h_d, h=250);
}