use <MCAD/involute_gears.scad>
fn=64;
pitch = 150;
union() {
    gear (number_of_teeth=40, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.175,
        circles=2, $fn=fn);
    translate([0,0,8]) gear (number_of_teeth=15, circular_pitch=pitch,
        gear_thickness = 8,
        rim_thickness = 8,
        hub_thickness = 8,
        bore_diameter=3.175,
        circles=2, $fn=fn);
}    
module motor() {
    union() {
        cylinder(r=35.5/2, h=50, $fn=fn);
        cylinder(r=3.175/2, h=68, $fn=fn);
    }
}
//translate([0,0,-68])motor();