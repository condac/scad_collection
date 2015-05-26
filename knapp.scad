// Knapp till christoffer och emmie

innerradie=6/2;
spar=6-4.5;
wall=1.5;
h = 11;
h2 = 6;
res = 20;
knappradie = 14/2;


union() {
    difference() {
        union() {
        cylinder(h=h, r=innerradie+wall, $fn=res);
        cylinder(h=h2, r= knappradie, $fn=res);
        }
        translate([0,0,h2])cylinder(h=h, r=innerradie, $fn=res);
        translate([-wall/2, -h2-knappradie/2,0]) cube([wall,h2,wall]);
    }
    
    translate([-innerradie,spar,0]) cube([innerradie*2,wall,h]);
}

