// A correct 8mm test for fiting bearing and rods

wall = 4;
ll = 11;
xx = 12;

$fn=32;

shaft = 7.888; //7.84828
hole = 8.1993; //8,15



difference() {
    union() {
        
        translate([0,xx,0]) cylinder(d=shaft, h=ll*2);
        translate([-xx/2,-xx/2,0]) cube([xx,xx*2,ll]);
        
    }
    translate([0,0,-1])  cylinder(d=hole, h=ll*2);
    //translate([-xx,xx,ll/2]) rotate([0,90,0]) cylinder(d=hole, h=ll*2);
    translate([-xx,xx,ll/2]) flatteardrop(radius=hole/2, length=100, angle=90, luck=0.3);
    
}
//translate([-xx,xx,ll/2]) rotate([0,90,0]) cylinder(d=hole, h=ll*2);

module flatteardrop(radius=5, length=10, angle=90, luck=0) {
	//$fn=resolution(radius);

	sx1 = radius * sin(-45);
	sx2 = radius * -sin(-45);
	sy = radius * -cos(-45);
	ex = 0;
	ey = (sin(-135) + cos(-135)) * radius;

	dx= ex-sx1;
	dy = ey-sy;

	eys = -radius-luck;
	dys = eys-sy;
	ex1 = sy+dys*dx/dy;
	ex2 = -ex1;

	rotate([0, angle, 0]) union() {
		linear_extrude(height = length, center = true, convexity = radius, twist = 0)
			circle(r = radius);
		linear_extrude(height = length, center = true, convexity = radius, twist = 0)
			polygon(points = [
				[sy, sx1],
				[sy, sx2],
				[eys, ex2],
				[eys, ex1]],
				paths = [[0, 1, 2, 3]]);
	}
}
