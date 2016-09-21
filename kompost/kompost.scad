// Kompost gångjärn skapad 2015 juni
//                  rättad 2016 första har spruckit

bas_x = 32;
bas_y = 53;
bas_z = 11;
rod_h = 30;

rod_hole = 13;
rod_d = 28;
rod_hole_x = 23;
rod_hole_x2 = 16;
clips = 3.5;
wall = 2;
y_clip = 20;
rygg = 3;

avrund = 5;
uthang = 20;
framhang = 20;
hanghojd = 42; // totala höjden på objektet

f_clip = 29; // avstånd från framhang till fästklipps
f_clip_x = 3; // hur stor ihakningen är i klippet

fn = 50; // upplösning på hål

union() {
    difference() {
        union() {
            cube([bas_x,bas_y,bas_z]);
            hull() {
                translate([0,framhang-avrund,hanghojd-avrund]) rotate([0,90,0]) cylinder(r=avrund,h=bas_x, $fn=fn);
                translate([0,-uthang+avrund,hanghojd-avrund]) rotate([0,90,0]) cylinder(r=avrund,h=bas_x, $fn=fn);
                translate([0,-uthang+avrund,avrund]) rotate([0,90,0]) cylinder(r=avrund,h=bas_x, $fn=fn);
                translate([0,framhang-avrund,avrund]) rotate([0,90,0]) cylinder(r=avrund,h=bas_x, $fn=fn);
            }
            //framklippsen
            translate([-f_clip_x,bas_y-(bas_y-framhang-f_clip),0]) cube([bas_x+f_clip_x*2,bas_y-framhang-f_clip,bas_z]);
        }
        
        //övre skär på framklips
        translate([0,framhang,bas_z]) cube([bas_x,bas_y,bas_z*3]);
        
        //vinklade skär
        translate([0,y_clip,bas_z+8]) rotate([45,0,0])cube([bas_x,bas_y,bas_z*4]);
        translate([0,0,0]) rotate([45+180,0,0]) translate([0,0,-bas_z*4]) cube([bas_x,bas_y,bas_z*4]);
        
        //hålet för locket
        translate([wall,-rod_hole/2,rod_h]) rotate([0,90,0]) cylinder(d=rod_hole,h=bas_x-wall*2, $fn=fn);
        
        //clips
        translate([clips,y_clip,-1]) cube([bas_x-clips*2,bas_y,bas_z*2]);
        
        //hålets bredskärning
        translate([(bas_x-rod_hole_x)/2,-30,rod_h-wall]) cube([rod_hole_x,bas_y,100]);
        translate([(bas_x-rod_hole_x2)/2,-30,rod_h-rod_hole/2-2]) cube([rod_hole_x2,bas_y,100]);
        
        //luftning
        translate([(bas_x-rod_hole_x2)/2,-bas_y+rygg,-1]) cube([rod_hole_x2,bas_y,100]);
        translate([wall,rygg+wall,-2]) cube([bas_x-wall*2,y_clip-wall*2-rygg,bas_z*2]);
        translate([wall,rygg+wall,-1]) cube([bas_x-wall*2,y_clip-wall*2-rygg-wall,bas_z*2+wall/2]);
        
        //luftning vid hålet
        translate([wall,rygg-uthang,0]) cube([(bas_x-rod_hole_x2-wall*4)/2,uthang,rod_h]);
        translate([bas_x/2+rod_hole_x2/2+wall,rygg-uthang,0]) cube([(bas_x-rod_hole_x2-wall*4)/2,uthang,rod_h]);
        //luftning i hålet
        temp1 = (bas_x-rod_hole_x)/2 -wall/2 -wall;//höjden på cylindern i luftningen
        translate([wall,-rod_hole/2,rod_h]) rotate([0,90,0]) cylinder(d=20,h=temp1, $fn=fn);
        translate([bas_x-wall-temp1,-rod_hole/2,rod_h]) rotate([0,90,0]) cylinder(d=20,h=temp1, $fn=fn);
        
        // sågning framklips
        translate([-f_clip_x,framhang+f_clip,0]) rotate([0,0,45]) cube([20,20,bas_z]);
        translate([f_clip_x+bas_x,framhang+f_clip,0]) rotate([0,0,45]) cube([20,20,bas_z]);
        
    }
    //påfyllnad efter skärningar
    translate([ (bas_x-rod_hole_x2)/2, rygg, 0]) cylinder(d=3,h=10, $fn=fn);
    translate([ (bas_x-rod_hole_x2)/2+rod_hole_x2, rygg, 0]) cylinder(d=3,h=10, $fn=fn);
}