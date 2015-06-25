shaft = 150;
shaft_w = 20;
shaft_h = 3;
wall = shaft_h;
shaft_s = 50;
klack = 5;
ball_d = 50;

small_fn = 30;

module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim, $fn=fn);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
    }
}

difference(){
    union() {
        sphere(d=ball_d, $fn=60);
        translate([-shaft_s, -shaft_w/2, 0]) roundedcube(shaft, shaft_w, shaft_h, 3 );
        translate([-shaft_s, -shaft_w/2, shaft_h]) roundedcube(klack+1, shaft_w, shaft_h*2, 3 );
    }
    
    slask = 300;
    translate([-slask/2, -slask/2, -slask]) cube([slask, slask, slask ]);
    sphere(d=ball_d-wall, $fn=60);
    cylinder(d=4, h= 100, $fn=small_fn);
    
    
    //rotating small hole
    antal = 8;
    for ( i = [0 : antal-1] ) {
        rotate( i * 360 / antal, [0, 0, 1]) translate([0, 21.5, 0]) cylinder(d=4, h= 100, $fn=small_fn);
    }

    //rotating small hole
    antal2 = 4;
    for ( i = [0 : antal2-1] ) {
        rotate( (i * 360 / antal2) +(360/antal2)/4, [0, 0, 1]) translate([0, 11.5, 0]) cylinder(d=4, h= 100, $fn=small_fn);
    }
    //rotating small hole
    antal2 = 4;
    for ( i = [0 : antal2-1] ) {
        rotate( (i * 360 / antal2) +((360/antal2)/4)*3, [0, 0, 1]) translate([0, 0, 35]) rotate([45+180,0,0]) cylinder(d=4, h= 100, $fn=small_fn);
    }
    
    //handle holes
    hole = shaft_w-wall*2;
    
     translate([shaft-shaft_s-shaft_w/2, 0, 0]) cylinder(d=hole, h= 100, $fn=small_fn);
    
    
    hull() {
        translate([shaft-shaft_s-shaft_w/2-shaft_w, 0, 0]) cylinder(d=hole, h= 100, $fn=small_fn);
        translate([shaft-shaft_s-shaft_w/2-shaft_w*2+wall*2, 0, 0]) cylinder(d=hole, h= 100, $fn=small_fn);
    }
    hull() {
        translate([ball_d/2+hole/2, 0, 0]) cylinder(d=hole, h= 100, $fn=small_fn);
        translate([ball_d/2+hole, 0, 0]) cylinder(d=hole, h= 100, $fn=small_fn);
    }
    
    translate([-shaft_s+shaft_w/2+wall, 0, 0]) cylinder(d=shaft_w-wall*2, h= 100, $fn=small_fn);
}




