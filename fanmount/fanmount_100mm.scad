screw_d = 105;

screw_hole = 4;
wall = 0.8*2;
begin_d = 98+wall*2;
end_d = 100+wall*2;
end2_d = 102+wall*2;


h_1 = 10;
h_2 = 20;
fn = 64;

module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim, $fn=fn);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
    }
}


difference() {
    union() {
        translate([-60,-60,0]) roundedcube(120,120,0.8*2,8);
        cylinder(d1=begin_d, d2=end_d, h=h_1, $fn = fn);
        
        translate([0,0,h_1]) cylinder(d1=end_d, d2=end2_d, h = h_2, $fn = fn);
    }
    cylinder(d1=begin_d-wall*2, d2=end_d-wall*2, h=h_1, $fn = fn);
    
    translate([0,0,h_1]) cylinder(d1=end_d-wall*2, d2=end2_d-wall*2, h = h_2, $fn = fn);
    //screw holes
    translate([screw_d/2, screw_d/2,-1]) cylinder(d=screw_hole, h = wall*2, $fn = 32);
    translate([screw_d/2, -screw_d/2, -1]) cylinder(d=screw_hole, h = wall*2, $fn = 32);
    translate([-screw_d/2, screw_d/2,-1]) cylinder(d=screw_hole, h = wall*2, $fn = 32);
    translate([-screw_d/2, -screw_d/2,-1]) cylinder(d=screw_hole, h = wall*2, $fn = 32);
    
}

