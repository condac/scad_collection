
angle = 12;

screw_hole_d = 3;
bottom_hole_d = 7;
hole_res = 30;

//bottom plate
b_plate_l = 50; // length of bottom plate
b_plate_h = 30; // height of bottom plate
b_plate_w = 4;  // thickness of bottom plate

// upper plate
u_plate_l = 35; 
u_plate_h = 55;
u_plate_w = 4;

// side plate
s_plate_w = 4;

union() {
    translate([0,0,0]) rotate([0,0,0]) b_plate();
    translate([15,18,0]) rotate([0,0,angle]) u_plate();
    s_plate();
}


module b_plate() {
    difference() {
        r3_cube(b_plate_l, b_plate_w, b_plate_h,1);
        
        //Big hole
        translate([10,b_plate_w+1,22]) rotate([90,0,0]) cylinder(d=bottom_hole_d, h=b_plate_w+2, $fn=hole_res);
        
        // Angle cut
        translate([b_plate_l,-1,s_plate_w]) rotate([0,-55,0]) cube(100);
        
        //Material saving
        translate([25,b_plate_w+1,10]) rotate([90,0,0]) cylinder(d=12, h=b_plate_w+2, $fn=hole_res);
    }
}

module u_plate(t=true) {
    difference() {
        r3_cube(u_plate_l, u_plate_w, u_plate_h,1);
        translate([u_plate_l/2+3,3.6,u_plate_h/3.5]) rotate([0,180,0]) rotate([0,90,90]) linear_extrude(height=1) oshw_logo_2d(22);
        
        //small hole
        translate([27,b_plate_w+1,50]) rotate([90,0,0]) cylinder(d=screw_hole_d, h=b_plate_w+2, $fn=hole_res);
        
        //material saver
        translate([-2,u_plate_w,30]) rotate([90,0,0]) r_cube(22,30,u_plate_w,2);
        translate([4,u_plate_w,5]) rotate([90,0,0]) r_cube(5,20,u_plate_w,2);
    }
    if (t) {
        translate([u_plate_l-2,0,5])r3_cube(2, u_plate_w+2, u_plate_h-10,1);
    }
}

module s_plate() {
    difference() {
        hull() {
            translate([0,0,0]) rotate([0,0,0]) b_plate();
            translate([15,18,0]) rotate([0,0,angle]) u_plate(t=false);
        }
        translate([-1,-1,s_plate_w])cube(100);
        translate([18,12,-1]) cylinder(r=6, h=s_plate_w+2, $fn=hole_res);
        translate([18*2,12,-1]) cylinder(r=6, h=s_plate_w+2, $fn=hole_res);
    }
}


module r_cube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim, $fn=fn);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
    }
}

module r3_cube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=20;
        translate([rdim,rdim,rdim]) sphere(r=rdim, $fn=fn);
        translate([xdim-rdim,rdim,rdim])sphere(r=rdim, $fn=fn);

        translate([rdim,ydim-rdim,rdim]) sphere(r=rdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,rdim]) sphere(r=rdim, $fn=fn);
        
        translate([rdim,rdim,zdim-rdim]) sphere(r=rdim, $fn=fn);
        translate([xdim-rdim,rdim,zdim-rdim])sphere(r=rdim, $fn=fn);

        translate([rdim,ydim-rdim,zdim-rdim]) sphere(r=rdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,zdim-rdim]) sphere(r=rdim, $fn=fn);
    }
}

module slot(l,r,h) {
    
    hull() {
        
    }
    
}


//////////////////////////////////////
// Other peoples code below
//////////////////////////////////////

// OSHW Logo Generator
// Open Source Hardware Logo : http://oshwlogo.com/
// -------------------------------------------------
//
// Adapted from Adrew Plumb/ClothBot original version
// just change internal parameters to made dimension control easier
// a single parameter : logo diameter (millimeters)
//
// oshw_logo_2D(diameter) generate a 2D logo with diameter requested
// just have to extrude to get a 3D version, then add it to your objects
//
// cc-by-sa, pierre-alain dorange, july 2012

module gear_tooth_2d(d) {
	polygon( points=[ 
			[0.0,10.0*d/72.0], [0.5*d,d/15.0], 
			[0.5*d,-d/15.0], [0.0,-10.0*d/72.0] ] );
}

module oshw_logo_2d(d=10.0) {
	rotate(-135) {
		difference() {
			union() {
				circle(r=14.0*d/36.0,$fn=20);
				for(i=[1:7]) {
                    rotAngle=45*i+45;
					rotate(rotAngle) gear_tooth_2d(d);
                }
			}
			circle(r=10.0*d/72.0,$fn=20);
			intersection() {
	  			rotate(-20) square(size=[10.0*d/18.0,10.0*d/18.0]);
	  			rotate(20)  square(size=[10.0*d/18.0,10.0*d/18.0]);
			}
    		}
  	}
}
