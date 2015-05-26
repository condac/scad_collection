//luftrör
h1=10;
h2=18;
ytterradie=82;
innerradie=80;
klackradie=75;
res=110;

difference(){
	cylinder(h=h1+h2, r=ytterradie, $fn=res);
	cylinder(h=h1, r1=ytterradie, r2=klackradie, $fn=res);
	translate([0,0,h1])
	cylinder(h=h2, r=innerradie, $fn=res);
}