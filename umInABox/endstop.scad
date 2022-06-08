//

xx = 20;
yy = 10;
zz = 2;
wall = 2;

union() {
    translate([-xx/2, 0,0]) cube([xx,yy,zz]);
    
    translate([-wall/2, 0,0]) cube([wall,yy*2,10]);
}