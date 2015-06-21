c_d = 22;
c_h = 20;

x = -30.06;
y = -12.25;

extra_h = 10;

module bearing() {
    extra = 0.5;
    d=8+extra;
    D1= 16 +extra;
    Df = 18 +extra;
    h = 5;
    hf = 1.1;
    res = 64;
    cylinder(d=D1, h+2, $fn=res);
    
    cylinder(d=Df, hf+1, $fn=res);
    
}

difference() {
union() {
    translate([-433.1,-154,-146]) import("Gantry_Y-Axis_Back_Left.stl", convexity=10);
    translate([x,y, 0.1]) color("red") cylinder(d=26,h=20+extra_h, $fn=64);
}
    // coupler
    translate([x,y, -10]) color("cyan") cylinder(d=c_d,h=c_h+extra_h, $fn=30);
    // hole for coupler screw
    sd = 5;
    sl = 5;
    sh = 5;
    hull() {
        translate([x,y, sh]) rotate([90,0,0]) cylinder(d=5,h=20, $fn=20);
        translate([x,y, sh+sl]) rotate([90,0,0]) cylinder(d=5,h=20, $fn=20);
    }

    translate([x,y, -1]) color("cyan") cylinder(d=9,h=200, $fn=30);

    translate([x,y, 20+extra_h+0.2]) rotate([180,0,0]) color("green")bearing();
    
    //remove switch holder to get space for nema mounting screws
    translate([-66,-40,-1]) cube([15,35,15]);
    
    translate([-50,-21, 10]) rotate([0,90,0]) cylinder(d=4.5,h=35, $fn=20);
    
    translate([-50, 0, 0]) cube(100,10,21);
    
}