shaft_d = 5.1;
shaft_pin = 2.5;
mount_d = 6;
mount_pin = 2;
d = 10;
h0 = 6;
h1 = 18;
h2 = -5;
$fs=0.5;
fork_d = 9;

module fork() {
    w= 15;
    w1 = w +5;

    difference() {
        union() {
            hull() {
                translate([0,w1/2,h1]) rotate([90,0,0]) cylinder(d=mount_d, h=w1);
                translate([0,0,h0]) rotate([0,0,0]) cylinder(d=10, h=1);
            }
            cylinder(d=10, h=h0);
        }
        hull() {
            translate([-10,0,h1+h2]) rotate([0,90,0]) cylinder(d=fork_d, h=w1);
            translate([-10,0,h1+100]) rotate([0,90,0]) cylinder(d=fork_d, h=w1);
        }
        
        // side trim
        translate([-15, w/2 ,0]) cube(30);
        translate([-15, -30-w/2 ,0]) cube(30);
        
        // shaft hole
        cylinder(d= shaft_d, h= h1);
        // shaft pin
        translate([-30,0,h0/2]) rotate([0,90,0]) cylinder(d= shaft_pin, h= 60);
        
        //mount hole
        translate([0,w1/2,h1]) rotate([90,0,0]) cylinder(d=mount_pin, h=w1);
    }
}
module fork_male() {
    l = 50;
    difference() {
        union() {
            fork();
            //translate([0,0,-l+8])cylinder(d=10, h=l);
            translate([0,0,-l+8])cylinder(d=6.5, h=l, $fn=4);
        }
        
    }
    
}

module fork_female() {
    l = 50;
    difference() {
        union() {
            fork();
            translate([0,0,-l+8])cylinder(d=10, h=l);
        }
        translate([0,0,-l+8])cylinder(d=7.5, h=l, $fn=4);
    }
    
}
module fork_big() {
    l = 15;
    difference() {
        union() {
            fork();
            translate([0,0,-l+8])cylinder(d=14, h=l);
        }
        translate([0,0,-l+8])cylinder(d=11, h=l, $fn=4);
        translate([-30,0,0]) rotate([0,90,0]) cylinder(d= shaft_pin, h= 60);
    }
    
}
module ball() {
    $fs=0.5;
    difference() { 
        cylinder(d=8, h=8);
        translate([0,10,1+2]) rotate([90,0,0]) cylinder(d=2, h=80);
        translate([-10,0,1+2+2]) rotate([0,90,0]) cylinder(d=2, h=80);
    }
}

module display() {
    translate([0,0,h1-2-1]) ball();
    fork();
    translate([0,0,h1*2+2]) rotate([0,0,90]) rotate([180,0,0]) fork();
    translate([h1,0,h1]) rotate([0,90,0])  rotate([0,0,90]) rotate([180,0,0]) fork();

}
//fork();
//ball();
fork_male();
//fork_female();
//fork_big();