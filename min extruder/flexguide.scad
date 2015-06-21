x = 23;
y = 21.5;
z = 13;

mk_gear_d = 12 +2;
bearing_d = 13+2;
filament_d = 2;
screw_d = 4;

trim = 2.5;
difference() {
    cube([x,y,z]);
    
    //mk gear
    translate([24-trim,y,-1]) cylinder(d=mk_gear_d,h = z*2);
    //bearing
    hull(){
        translate([10-trim,y,-1]) cylinder(d=bearing_d,h = z*2);
        translate([0,y,-1]) cylinder(d=bearing_d,h = z*2);
    }
    
    //filament
    hull(){
        translate([6+8,10,8]) rotate([90,0,0]) cylinder(d=filament_d,h = 1, $fn=30);
        translate([6+9.5,10,8]) rotate([90,0,0]) cylinder(d=filament_d,h = 1, $fn=30);
        
        translate([6+8,20,8]) rotate([90,0,0]) cylinder(d=filament_d,h = 1, $fn=30);
    }
    // mount block
    translate([0,0,1])cube([42,9.4, 12]);
    
    // screw
    translate([5.5,5,-1]) cylinder(d=screw_d,h = z*2, $fn=30);
}