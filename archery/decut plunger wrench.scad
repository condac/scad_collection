//
slot_distance = 15.8;
plunger_diameter = 17.2;
tool_wall = 5;
tool_h = 5.5;
tool_slot_h = 4;

hole_d = 11;

$fs = 0.5;
$fa = 5.1;
wrench();
module wrench() {
    union() {
        difference() {
            union() {
                hull() {
                    translate([0,0,0]) cylinder(d=plunger_diameter+tool_wall*2, h=tool_h);
                    translate([40,0,0]) cylinder(d=plunger_diameter, h=tool_h);
                }
            }
            translate([0,0,tool_h-tool_slot_h]) cylinder(d=plunger_diameter, h=tool_h);
                
                
            hull() {
                translate([0,0,0]) cylinder(d=hole_d, h=tool_h);
                translate([-40,0,0]) cylinder(d=hole_d, h=tool_h);
            }
            translate([20,0,0]) cylinder(d=15, h=tool_h);
            translate([40,0,0]) cylinder(d=hole_d, h=tool_h);
            
        }
        slot_x = (plunger_diameter/2+tool_wall) - slot_distance/2;
        translate([-7.25/2,slot_distance/2,0]) cube([7.25, slot_x, tool_h]);
        
        translate([-7.25/2,-slot_distance/2-slot_x,0]) cube([7.25, slot_x, tool_h]);
    }
}
