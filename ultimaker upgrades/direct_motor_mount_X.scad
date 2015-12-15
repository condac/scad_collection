c_d = 22;
c_h = 25;

extra_h = 5;

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
    translate([-396,-160,-157]) import("Gantry_X-Axis_Back_Left.stl", convexity=10);
    translate([-38.5,-12, 0.1]) color("red") cylinder(d=24,h=20+extra_h, $fn=64);
}
    // coupler
    translate([-38.5,-12, -10]) color("cyan") cylinder(d=c_d,h=c_h, $fn=30);
    // hole for coupler screw
    sd = 5;
    sl = 5;
    sh = 5;
    hull() {
        translate([-38.5,-12, sh]) rotate([90,0,0]) cylinder(d=5,h=20, $fn=20);
        translate([-38.5,-12, sh+sl]) rotate([90,0,0]) cylinder(d=5,h=20, $fn=20);
    }

    translate([-38.5,-12, -1]) color("cyan") cylinder(d=9,h=200, $fn=30);

    translate([-38.5,-12, 20+5+0.2]) rotate([180,0,0]) color("green")bearing();
    
    //remove switch holder to get space for nema mounting screws
    translate([-66,-40,-1]) cube([15,35,15]);
}