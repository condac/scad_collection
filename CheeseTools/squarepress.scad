//
xx = 70;
yy = 120;
zz = 100;

wall = 2;

hole_d = 3;

%burk();
lock();
module burk() {
    difference() {
        union() {
            roundedBox([xx+wall*2,yy+wall*2,zz+wall],5);
            
        }
        translate([0,0,wall]) roundedBox([xx,yy,zz+wall], 5,1);
        
        for (i =[0:7:xx]) {
            for (k =[0:7:zz-7]) {
                translate([i-xx/2,yy,k-zz/2+wall+7]) rotate([90,0,0]) cylinder(d=hole_d, h=yy*2, $fn=6);
            }
        }
        
        for (i =[0:7:yy]) {
            for (k =[0:7:zz-7]) {
                translate([-xx,i-yy/2,k-zz/2+wall+7]) rotate([0,0,90]) rotate([90,0,0]) cylinder(d=hole_d, h=xx*2, $fn=6);
            }
        }
        for (i =[0:7:xx]) {
            for (k =[0:7:yy]) {
                translate([i-xx/2,k-yy/2,-zz-wall*2]) rotate([0,0,0]) cylinder(d=hole_d, h=zz*2, $fn=6);
            }
        }
    }
    
}

module lock() {
    union() {
        roundedBox([xx-6,yy-6,4],5);
        translate([0,0,3])cylinder(d=30, h=4+3);
    }
}


 module roundedBox(dimentions, radius, unknown) {
     depth = dimentions[0];
     width = dimentions[1];
     height = dimentions[2];
     
     translate([-depth/2, -width/2, -height/2+radius]) hull() {
         translate([0, width, height]) cylinder(r=radius, h=1);
         translate([depth, 0, height]) cylinder(r=radius, h=1);
         translate([0, 0, height]) cylinder(r=radius, h=1);
         translate([depth, width, height]) cylinder(r=radius, h=1);
         
         translate([0, width, 0]) cylinder(r=radius, h=1);
         translate([depth, 0, 0]) cylinder(r=radius, h=1);
         translate([0, 0, 0]) cylinder(r=radius, h=1);
         translate([depth, width, 0]) cylinder(r=radius, h=1);
     }
 }