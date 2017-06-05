//

$fs=0.1;
$fa=6;
in_d = 8.5;
out_d = in_d+0.4*2*3;
hh= 6;

difference() {
    cylinder(d=out_d, h=hh);
    cylinder(d=in_d, h=hh);
}