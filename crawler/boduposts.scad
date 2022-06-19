

//frontposts();
rearposts();

module rearposts() {
    dist = 55;
    dist2 = 87.5;
    hh = 4.4;
    th = 10;
    height = 87;
    union() {
        
        translate([hh/2,-dist2/2,15+height-27+8]) bodypost(ll=27);
        translate([hh/2,dist2/2,15+height-27+8]) bodypost(ll=27);
        
        translate([hh/2,-dist/2,0]) bodypost(ll=20);
        translate([hh/2,dist/2,0]) bodypost(ll=20);
        
        hull() {                
            translate([0,-dist/2-2,15])cube([th,1,th]);
            translate([0,dist2/2+2,15+height-th]) cube([th,1,th]);
        }
        hull() {                
            translate([0,-dist2/2-2,15+height-th])cube([th,1,th]);
            translate([0,dist/2+2,15]) cube([th,1,th]);
        }
    }
}

module frontposts() {
    dist = 55;
    hh = 4.4;
    th = 10;
    union() {
        
        translate([hh/2,0,0]) bodypost(ll=50);
        translate([hh/2,dist,0]) bodypost(ll=50);
        
        hull() {                
            translate([0,-2,15])cube([th,1,th]);
            translate([0,dist+2,28]) cube([th,1,th]);
        }
        hull() {                
            translate([0,-2,28])cube([th,1,th]);
            translate([0,dist+2,15]) cube([th,1,th]);
        }
    }
}


module bodypost(ll=50) {
    
dd = 5.75;
hh = 4.4;
l = ll;

hole = 2;

$fn=64;

difference() {
    cylinder(d=dd, h = l);
    
    translate([hh/2,-10,0]) cube([20,20,l]);
    translate([-hh/2-20,-10,0]) cube([20,20,l]);
    
    dist = 4;
    for (a =[dist:dist:l]) {
        translate([-100, 0, a]) rotate([0,90,]) cylinder(d=hole, h=400);
    }
    
}

}