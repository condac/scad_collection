difference() {
    
    union() {
        translate([0,0,-9]) h_cylinder(d1=20.3, d2=26,  h1=10 );
        //translate([0,0,-9+8]) h_cylinder(d1=16, d2=26,  h1=3 );
        
        difference() {
    
            union() {
                rotate([-90,0,0]) import("WaterRocketNozzle.stl", convexity=5);
                //translate([0,0,1]) cylinder(d=10, h=25);
                //translate([0,0,1]) cylinder(d=17, h=7);
                
            }
            //translate([0,0,1]) cylinder(d=8, h=25);
            translate([0,0,-59]) cylinder(d=50, h=50);
        }
    }
    
    translate([0,0,-19]) h_cylinder(d1=26, d2=50,  h1=100 );
}

module h_cylinder(d1=1, d2=2,  h1=1, ) {
    
    difference() {
        cylinder(d=d2, h=h1);
        translate([0, 0, -1]) cylinder(d=d1, h=h1+2);
    }
}