use <MCAD/involute_gears.scad>
// Bevel gear diff axle

module under_axle() {
    difference() {
        union() {
            axle1();
            mirror([0,0,1])axle1();
            translate([0,0,190/2-5]) rotate([180,0,0])  %solid_adapter();
            translate([0,0,-190/2+5]) mirror([0,0,1]) rotate([180,0,0])  %turn_adapter();
            
            // Bearing bevel axel
            //translate([0,17.5,0]) rotate([-90,0,0]) hollow_cyl(d=14.5, h=1, w=3);
            color("red") translate([0,16,0]) rotate([-90,0,0]) hollow_cyl(d=15.5, h=4.5, w=3);
            //translate([0,18.5+4.5,0]) rotate([-90,0,0]) hollow_cyl(d=14.5, h=1, w=3);
            
            translate([0,16+4.5,0]) rotate([-90,0,0]) hollow_cyl(d=14.5, h=2, w=3);
            color("red") translate([0,16+4.5+2,0]) rotate([-90,0,0]) hollow_cyl(d=15.5, h=4.5, w=3);
            translate([0,16+4.5+2+4.5,0]) rotate([-90,0,0]) hollow_cyl(d=14.5, h=1, w=3);
        }
        translate([0,-100,-100]) cube([200,200,200]);
        color("red") translate([0,16,0]) rotate([-90,0,0]) cylinder(d=15.5, h=4.5);
        color("red") translate([0,17.5,0]) rotate([-90,0,0]) cylinder(d=14.5, h=14.5);
    }
}
module axle1() {
    $fs= 0.9;
    hollow_cyl(d=38, h=10, w=2);
    translate([0,0,10]) hollow_cyl2(d1=38, d2=15, h=10, w=2);
    
    translate([0,0,15-0.5]) hollow_cyl(d=14.5, h=0.5, w=3);
    color("red") translate([0,0,15]) hollow_cyl(d=15.5, h=4.5, w=3);
    translate([0,0,15+4.5]) hollow_cyl3(d1=15,d2=13, h=4.5, w=3);
    difference() {
        translate([0,0,15+4.5+4.5]) hollow_cyl(d=13, h=45, w=2.5);
        translate([-50,0,15+4.5+4.5+45-5]) rotate([0,90,0]) cylinder(d=3, h=100);
    }
    translate([0,0,40]) mount();
    translate([0,0,40]) mirror([0,1,0]) mount();
    
    translate([0,0,40]) mirror([1,0,0]) mount();
    translate([0,0,40]) mirror([0,1,0]) mirror([1,0,0]) mount();
    
    translate([0,0,20]) mount2();
    translate([0,0,20]) mirror([0,1,0]) mount2();
    
    translate([0,0,20]) mirror([1,0,0]) mount2();
    translate([0,0,20]) mirror([0,1,0]) mirror([1,0,0]) mount2();
    
    
    translate([0,0,65/2]) %sakura_axle();
}
module hollow_cyl(d, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d=d+w*2, h=h);
        translate([0,0,-1])cylinder(d=d, h=h+2);
    }
}
module hollow_cyl2(d1, d2, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d1=d1+w*2, d2=d2+w*2, h=h);
        translate([0,0,0])cylinder(d1=d1,d2=d2, h=h);
        //translate([0,0,-1])cylinder(d=d2, h=h+2);
    }
}
module hollow_cyl3(d1, d2, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d1=d1+w*2, d2=d2+w*2, h=h);
        
        translate([0,0,-1]) cylinder(d=d2, h=h+2);
    }
}
module mount() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 4;
    $fs= 0.9;
    difference() {
        cube([x,y,z]);
        translate([x/2,y-3,-1]) cylinder(d=3,h=z+2);
        translate([0,0,-1]) cylinder(d=12,h=z+2);
    }
}
module mount2() {
    $fs= 0.9;
    x = 8;
    y= 15;
    z = 6;
    $fs= 0.9;
    difference() {
        cube([x,y,z]);
        translate([0,y-3,z/2]) rotate([0,90,0]) cylinder(d=3,h=z+2);
        translate([0,0,-1]) cylinder(d=16,h=z+2);
    }
}
module sakura_axle() {
    $fs= 0.9;
    sphere(d=6);
    translate([0,5,0]) rotate([90,0,0]) cylinder(d=2, h=10);
    cylinder(d=3.15, h=44);
    translate([0,5,44]) rotate([90,0,0]) cylinder(d=2, h=10);
    translate([0,0,44]) cylinder(d=10, h=3);
    translate([0,0,44+3]) cylinder(d1=10, d2=7, h=1.5);
    translate([0,5,44+15.5]) rotate([90,0,0]) cylinder(d=2, h=10);
    translate([0,0,44]) cylinder(d=5, h=17.5);
    translate([0,0,44]) cylinder(d=3,85, h=30);
}
module solid_adapter() {
    $fs= 0.9;
    hollow_cyl(d=5.5, w=4, h=4);
    color("cyan")translate([0,0,4]) %hollow_cyl(d=5, w=5/2, h=4);
    translate([0,0,4]) hollow_cyl(d=10.5, w=3, h=4);
    translate([0,0,4+4]) hollow_cyl2(d1=12, d2=12+3+3+1, w=2, h=13);
    difference() {
        translate([0,0,4+4+13]) hollow_cyl(d=12+3+3+1, w=2, h=10);
        translate([-50,0,4+4+13+5]) rotate([0,90,0]) cylinder(d=3, h=100);
    }
}
module turn_arm() {
    $fs= 0.5;
    hm = 20.5;
    difference() {
        union() {
            hollow_cyl(d=10.5, w=2, h=10);
            hollow_cyl(d=5.5, w=3, h=5);
            translate([0, 0, 8])  hollow_cyl2(d1=10.5, d2=12, w=2, h=2); // strength
            translate([0, 0, 10])  hollow_cyl(d=12, w=2, h=4);
            translate([-hm/2, 0, 14]) rotate([0,90,0]) cylinder(d=7, h=hm);
        }
        translate([-15, 0, 14]) rotate([0,90,0]) cylinder(d=2.85, h=30);
        translate([0, 0, 10])  cylinder(d=12, h=10);
    }
    difference() {
        hull() {
            translate([-5/2,6,0]) cube([5,1,10]);
            translate([-5/2,26,22]) rotate([0,90,0]) hollow_cyl(d=3, w=2, h=5);
        }
        translate([-5/2,26,22]) rotate([0,90,0]) cylinder(d=3, h=5);
    }
}
module turn_hub() {
    $fs= 0.9;
    hm = 20.5;
    difference() {
        union() {
            translate([0,0,4+4+13]) hollow_cyl(d=12+3+3+1, w=2, h=10);
            hull() {
                translate([-hm/2-1.2/2-3, 0, 14]) rotate([0,90,0]) cylinder(d=7, h=3);
                translate([-hm/2-1.2/2-3, 0, 4+4+13+5]) rotate([0,90,0]) cylinder(d=7, h=3);
            }
            hull() {
                translate([hm/2+1.2/2 , 0, 14]) rotate([0,90,0]) cylinder(d=7, h=3);
                translate([hm/2+1.2/2 , 0, 4+4+13+5]) rotate([0,90,0]) cylinder(d=7, h=3);
            }
        }
        translate([-50,0,4+4+13+5]) rotate([0,90,0]) cylinder(d=3, h=100);
        translate([-50,0,14]) rotate([0,90,0]) cylinder(d=3, h=100);
    }
    
    
}
module turn_adapter() {
    turn_arm();
    turn_hub();
}


module bevel_gear_pair2_diff () {
    gear1_teeth = 32;
	gear2_teeth = 11;
	axis_angle = 90;
	outside_circular_pitch=170;
    
	outside_pitch_radius1 = gear1_teeth * outside_circular_pitch / 360;
	outside_pitch_radius2 = gear2_teeth * outside_circular_pitch / 360;
	pitch_apex1=outside_pitch_radius2 * sin (axis_angle) +
		(outside_pitch_radius2 * cos (axis_angle) + outside_pitch_radius1) / tan (axis_angle);
	cone_distance = sqrt (pow (pitch_apex1, 2) + pow (outside_pitch_radius1, 2));
	pitch_apex2 = sqrt (pow (cone_distance, 2) - pow (outside_pitch_radius2, 2));
	echo ("cone_distance", cone_distance);
	pitch_angle1 = asin (outside_pitch_radius1 / cone_distance);
	pitch_angle2 = asin (outside_pitch_radius2 / cone_distance);
	echo ("pitch_angle1, pitch_angle2", pitch_angle1, pitch_angle2);
	echo ("pitch_angle1 + pitch_angle2", pitch_angle1 + pitch_angle2);

	rotate([0,0,90])
	translate ([0,0,0])	{
		translate([0,0,-pitch_apex1])
		bevel_gear (
			number_of_teeth=gear1_teeth,
			cone_distance=cone_distance,
			pressure_angle=30,
			outside_circular_pitch=outside_circular_pitch, 
            face_width=8,gear_thickness = 1);

		
	}
}
module bevel_gear_pair2_gear () {
    gear1_teeth = 32;
	gear2_teeth = 11;
	axis_angle = 90;
	outside_circular_pitch=170;
    
	outside_pitch_radius1 = gear1_teeth * outside_circular_pitch / 360;
	outside_pitch_radius2 = gear2_teeth * outside_circular_pitch / 360;
	pitch_apex1=outside_pitch_radius2 * sin (axis_angle) +
		(outside_pitch_radius2 * cos (axis_angle) + outside_pitch_radius1) / tan (axis_angle);
	cone_distance = sqrt (pow (pitch_apex1, 2) + pow (outside_pitch_radius1, 2));
	pitch_apex2 = sqrt (pow (cone_distance, 2) - pow (outside_pitch_radius2, 2));
	echo ("cone_distance", cone_distance);
	pitch_angle1 = asin (outside_pitch_radius1 / cone_distance);
	pitch_angle2 = asin (outside_pitch_radius2 / cone_distance);
	echo ("pitch_angle1, pitch_angle2", pitch_angle1, pitch_angle2);
	echo ("pitch_angle1 + pitch_angle2", pitch_angle1 + pitch_angle2);

	rotate([0,0,90])
	translate ([0,0,0])	{
		

		rotate([0,-(pitch_angle1+pitch_angle2),0])
		translate([0,0,-pitch_apex2])
		bevel_gear (
			number_of_teeth=gear2_teeth,
			cone_distance=cone_distance,
			pressure_angle=30,
			outside_circular_pitch=outside_circular_pitch, 
            face_width=6,gear_thickness = 1,
            bore_diameter=0
        );
	}
}
module diff() {
    bevel_gear_pair2_diff();
   
    b2b = 40;
    b2b2 = 40-10;
    difference() {
        union() {
            
            translate([0, 0, -b2b/2]) cylinder(d=9.7, h= b2b);
            translate([0, 0, -b2b2/2]) cylinder(d=11, h= b2b2);
            translate([0,0,-b2b2/2+0.5]) cylinder(d1=11, d2=30, h= 7.5);
            translate([0,0,-4]) cylinder(d1=18, d2=11, h= 6);
        }
        translate([0, 0, -b2b/2])cylinder(d=7.5, h= b2b, $fn=4);
        //translate([-slice/2, -10/2, 10]) cube([slice,10,20]);
        
    }
}
module diff_arms_2() {
    $fs= 0.9;
    x = 20;
    ah = 45/2;
    slice = 2;
    difference() {
        union() {
            translate([0, 0, 5]) cylinder(d=6, h= ah, $fn=4);
            translate([0, 0, 15]) cylinder(d=11.5, h= 15);
        }
        translate([0, 0, 20])cylinder(d=6.5, h= ah);
        translate([-slice/2, -10/2, 20]) cube([slice,10,20]);
        translate([0, 0, 30-0.99])cylinder(d2=11, d1=7, h=1);
        
    }
}
module diff_arms() {
    $fs= 0.9;
    x = 20;
    ah = 45/2;
    difference() {
        union() {
            translate([-x/2, -x/2, 0]) cube([x,x,2]);
            cylinder(d=9.7, h= 15);
            cylinder(d=11, h= 9);
        }
        translate([0, 0, 0])cylinder(d=7, h= ah, $fn=4);
        translate([0, 0, -5]) diff_arms_cut();
    }
}
module diff_arms_cut() {
    $fs= 0.9;
    x = 21;
    l = 5+3/2+3;
    rotate([0,0,45]) union() {
        translate([l, 0, -20])cylinder(d=3, h= 50);
        translate([-l, 0, -20])cylinder(d=3, h= 50);
        translate([0, l, -20])cylinder(d=3, h= 50);
        translate([0, -l, -20])cylinder(d=3, h= 50);
    }
    translate([-x/2, -x/2, 0]) cube([x,x,3.5]);

}
module bevelgear() {
    bevel_gear_pair2_gear();
    hh= 12;
    hh2= 22;
    hh3 = 1.5;
    translate([0,hh+14,0]) rotate([90,0,0]) cylinder(d=7, h=hh);
    translate([0,hh+16,0]) rotate([90,0,0]) cylinder(d=9.7, h=hh);
    difference() {
        translate([0,hh2+16,0]) rotate([90,45,0]) cylinder(d=9.7, h=hh2, $fn=4);
        translate([-5,hh2+12,0]) rotate([0,90,0]) cylinder(d=2.5, h=hh);
    }
    translate([0,hh3+15,0]) rotate([90,0,0]) cylinder(d=11, h=1);
}
module display() {
    //under_axle();
    //bevel_gear_pair2_gear ();
    diff();
    bevelgear();
    
}
//display();

//rotate([90,0,0]) bevelgear();
//diff();
//rotate([0,90,0])under_axle();
diff_arms_2();
