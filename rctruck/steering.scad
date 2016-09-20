
use <frame.scad>
use <wormtest.scad>



module link(length, thick) {
    wall = 2;
    y = wall*2;
    hole = 4;
    
    difference() {
        union() {
            hollow_cyl(d=hole, w=wall, h=thick);
            translate([length,0,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,-y/2,0])cube([length, y,thick]);
        }
        translate([0,0,-1]) cylinder(d=4, h=thick*2);
        translate([length,0,-1]) cylinder(d=4, h=thick*2);
    }
    
}
module steering_link() {
    wall = 2;
    y = wall*2;
    hole = 4;
    thick =y;
    union() {
        link(68*2, 3);
        translate([10,y/2,hole/2+3]) rotate([90,0,0]) hollow_cyl(d=hole, w=wall, h=thick);
        translate([10,y/2,hole/2+3]) rotate([90,0,0]) hollow_cyl(d=hole, w=wall, h=thick);
    }
}
//link(68*2, 3);
//steering_link();
//link(75,3);

module hollow_cyl(d, w, h) {
    $fs= 0.9;
    difference() {
        cylinder(d=d+w*2, h=h);
        translate([0,0,-1])cylinder(d=d, h=h+2);
    }
}

module susp_mount() {
     $fs= 0.9;
    hole = 3;
    wall = 2;
    thick = 3;
    difference() {
        hull() {    
            translate([12,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([-12,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,8+7,0]) hollow_cyl(d=hole, w=wall, h=thick);
        }
        translate([0,0,-1]) cylinder(d=19, h=thick*2);
        translate([12,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([-12,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([0,8+7,0]) cylinder(d=hole, h=thick*2);
    }
}
//susp_mount2();

module susp_mount2() {
     $fs= 0.9;
    hole = 3;
    wall = 2;
    thick = 3;
    difference() {
        hull() {    
            translate([10,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([-10,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,50,0]) hollow_cyl(d=hole, w=wall, h=thick);
        }
        //translate([0,0,-1]) cylinder(d=19, h=thick*2);
        translate([10,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([-10,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([0,50,0]) cylinder(d=hole, h=thick*2);
    }
    translate([0,50,0]) hollow_cyl(d=hole, w=wall, h=13+thick);
}
module link_mount() {
     $fs= 0.9;
    hole = 3;
    wall = 2;
    thick = 3;
    difference() {
        hull() {    
            translate([10,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([-10,8/2,0]) hollow_cyl(d=hole, w=wall, h=thick);
            translate([0,24,0]) hollow_cyl(d=hole, w=wall, h=thick);
        }
        //translate([0,0,-1]) cylinder(d=19, h=thick*2);
        translate([10,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([-10,8/2,0]) cylinder(d=hole, h=thick*2);
        translate([0,24,0]) cylinder(d=hole, h=thick*2);
    }
    //translate([0,24,0]) hollow_cyl(d=hole, w=wall, h=13+thick);
}

module cover() {
    difference() {
        union() {
            // bearing mount
            translate([20,18,0]) rotate([90,0,0]) hollow_cyl(d=10.5, w=4, h=5);
            translate([20,18+1,0]) rotate([90,0,0]) hollow_cyl(d=9.5, w=3, h=1);
            translate([20,18-5,0]) rotate([90,0,0]) hollow_cyl(d=9.5, w=3, h=1);
            translate([20,-18+5,0]) rotate([90,0,0]) hollow_cyl(d=10.5, w=4, h=5);
            translate([20,-18+5+1,0]) rotate([90,0,0]) hollow_cyl(d=9.5, w=3, h=1);
            translate([20,-18+5-5,0]) rotate([90,0,0]) hollow_cyl(d=9.5, w=3, h=1);
            // screw mount
            dist = 12;
            dist_y = 13;
            hole = 3.3;
            translate([20,dist_y,dist]) rotate([0,90,0]) hollow_cyl(d=hole, w=3, h=5);
            translate([20,-dist_y,dist]) rotate([0,90,0]) hollow_cyl(d=hole, w=3, h=5);
            translate([20,-dist_y,-dist]) rotate([0,90,0]) hollow_cyl(d=hole, w=3, h=5);
            translate([20,dist_y,-dist]) rotate([0,90,0]) hollow_cyl(d=hole, w=3, h=5);
            
            // cover
            translate([20,15,0]) rotate([90,0,0]) hollow_cyl(d= 17, w=2, h= 30);
            
            
        }
        // gear cut
        translate([20,12-1,0]) rotate([90,0,0]) cylinder(d= 15.5, h= 23);
        
        //translate([16.6667+6.25,0,-15])cylinder(r= 6.25+1.5, h= 25);
        //translate([16.6667+6.25,0,8])cylinder(r= 16.6667+1.5, h= 10);
        // bearing cut
        translate([20,18,0]) rotate([90,0,0]) cylinder(d= 10.5, h= 5);
        
        // cover cut
        translate([20-100,-50,-50]) cube(100);
    }
}

module cover_servo() {
    difference() {
        union() {
            translate([0,0,-20]) rotate([0,-90,0]) cover();
            
        }
        translate([-50,-50,8.5]) cube(100);
    }
    translate([0,0,24+8.5-3]) rotate([-90,0,0]) servo_mount2();
}
module servo_mount2() {
    $fs=1;
    m_x=56;
    m_y=29.5;
    m_z=10;
    
    s_x=41;
    s_y=21;
    s_z=15;
    
    xx = 60;
    wall = 4;
    
    screw_d = 2.9;
    
    difference() {
        translate([-m_x/2,0,0]) cube([m_x,m_y,m_z]);
        translate([-s_x/2,0,0]) cube([s_x,s_y,s_z]);
        
        //servo screws
        translate([50/2,5,0])  cylinder(d=screw_d, h=xx*2);
        translate([50/2,5+10,0])  cylinder(d=screw_d, h=xx*2);
        translate([-50/2,5,0])  cylinder(d=screw_d, h=xx*2);
        translate([-50/2,5+10,0])  cylinder(d=screw_d, h=xx*2);
                

        
    }
}
    
cover_servo();
//link_mount();