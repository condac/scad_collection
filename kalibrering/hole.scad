//

cylinder2(height = 1,radius = 40,fn = 32);
module cylinder2(height = 1,radius = 1,fn = 30){
   fudge = 1/cos(180/fn);
    echo(radius*fudge, fudge);
   cylinder(h=height,r=radius*fudge,$fn=fn);
}