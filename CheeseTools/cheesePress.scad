// Cheese press by condac 2018
// Free for non-comercial use


diameter = 95; // Use 160mm for making about 1kg cheese, 0.5kg cheese around 114mm
height = 120; // Use 140mm for full size

wall = 2;

hole_d = 3;
hole_dist = 10;

rr = diameter/2;
hh = height;
//cylinder(r=rr, h=hh);
basket();
//translate([0,0,height]) lid();
//holecutters();
module basket() {
    difference() {
        cylinder(r=rr+wall, h=hh);
        translate([0,0,wall]) cylinder(r=rr, h=hh);
        holecutters();
    }
}

module holecutters() {
    // Formula to create holes with fixed distance...
    length = diameter*3.14159;
    number = length/hole_dist;
    
    // Side holes
    for (zloop =[0:10:height]) {
        for (a =[0:1:number]) {
            translate([0,0,wall+hole_d/2+zloop]) rotate([0,0,(360/number)*a]) rotate([90,0,0]) cylinder(d=hole_d, h=diameter, $fn=6);
        }
        
    }
    
    // Bottom holes
    for (zloop2 =[0:hole_dist:rr]) {
        //zloop2 = 20;
        length2 = zloop2*2*3.14159;
        number2 = length2/hole_dist;
        for (a =[0:1:number2]) {
             rotate([0,0,(360/number2)*a]) translate([zloop2,0,0]) cylinder(d=hole_d, h=diameter, $fn=6);
        }
        
    }
}

module lid() {
    cylinder(r=rr-2, h=5);
    cylinder(r=15, h=7);
}