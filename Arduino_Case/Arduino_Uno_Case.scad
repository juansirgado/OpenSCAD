/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|           Program Arduino Case - 2014/05/03              |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
arduino_case();
//---------------------------------------------------------|
// Arduino board size in milimeters
b = [[0,0],[0,53.34],[68.58,0],[68.58,53.34]];
// Arduino holes position
h = [[13.97,2.54],[15.24,50.80],[66.04,7.62],[66.04,35.56]]; 
r = 1.5875; // Hole radius
// Arduino box parameters
w = 5;             // Box wall thickness
t = 35;            // Box tall size
u = [0,38.10];     // Position of USB cable
s = [0,7.62];      // Position of auxiliary power suply
i = [64.77,27.93]; // Position of ICSP header
x = b[3][0]/2;     // X center relative position
y = b[3][1]/2;     // y center relative position
e = 1.5;             // edge radius
//---------------------------------------------------------|
module arduino_case()
{
   rotate([0,0,0]) translate([0,0, 40]) arduino_cover();
   rotate([0,0,0]) translate([0,0,-30]) arduino_box();
   rotate([0,0,0]) translate([0,0,  0]) arduino_board();
}
//---------------------------------------------------------|

module arduino_cover()
{
   difference()
   {
      translate([0,0,0])
         rotate([180,0,0])
            cub8([90,80,w],r=e,center=true,fn=60,b=1);
      translate([7.5,-y+h[0][1],0]) 
         cube([52,5,10],center=true);
      translate([8.5,-y+h[1][1],0]) 
         cube([50,5,10],center=true);
      translate([-x+i[0],y-i[1],0]) 
         cube([8,10,10],center=true);
      for(p = [[40,35],[-40,35],[40,-35],[-40,-35]])
         translate([p[0],p[1],0]) 
            cylinder(w+0.2,2,2,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module arduino_box()
{   
   difference()
   {
      union()
      {
         difference()
         {
            translate([0,0,0]) 
               cub8([90,80,t],r=e,center=true,fn=60,b=1);
            translate([0,0,w]) 
               cube([90-w*2,80-w*2,t],center=true);
         }
         translate([0,0,w-(t/2)]) 
            arduino_fix();
         for(p = [[40,35],[-40,35],[40,-35],[-40,-35]])
            translate([p[0],p[1],0]) 
               cylinder(t,4,4,center=true,$fn=60);
         for(p = [[35,35],[-35,35],[35,-35],[-35,-35]])
            translate([p[0],p[1],0]) 
               cube([10,5,t],center=true);
         for(p = [[30,35],[-30,35],[30,-35],[-30,-35]])
            translate([p[0],p[1],(-t/2)+15]) 
               rotate([90,0,0])
                  cylinder(5,7.5,7.5,center=true,$fn=60);
      }
      translate([-42.5,-y+u[1],12+w-(t/2)]) 
         cube([w*2,17,17],center=true);
      translate([-42.5,-y+s[1],9.5+w-(t/2)]) 
         cube([w*2,12,12],center=true);
      for(p = [[40,35],[-40,35],[40,-35],[-40,-35]])
         translate([p[0],p[1],0]) 
            cylinder(t+0.2,1.5,1.5,center=true,$fn=60);
      for(p = [[30,35],[-30,35],[30,-35],[-30,-35]])
         translate([p[0],p[1],(-t/2)+15]) 
            rotate([90,0,0])
               cylinder(w+7.5,1.5,1.5,center=true,$fn=60);
      for(l = [h[0],h[1]])
         translate([l[0]-34.25,l[1]-26.75,(-t/2)+w]) 
            cube([r*4,r,w*3],center=true,$fn=60);
      for(l = [h[2],h[3]])
         translate([l[0]-34.25,l[1]-26.75,(-t/2)+w]) 
            cube([r,r*4,w*3],center=true,$fn=60);

   }
}
//---------------------------------------------------------|
module arduino_board()
{
   union()
   {
      difference()
      {
         translate([0,0,0]) 
            cube([b[3][0],b[3][1],2],center=true);
         for(l = h)
         {
            translate([-x,-y,0])
               translate([l[0],l[1],0]) 
                  cylinder(w+0.2,r,r,center=true,$fn=60);
         }
      }
      difference()
      {
         translate([-30,-y+u[1],8.5]) 
            cube([15,15,15],center=true);
         translate([-35,-y+u[1],8.5]) 
            cube([10.2,10,10],center=true);
      }
      difference()
      {
         translate([-29,-y+s[1],7]) 
            cube([12,10,12],center=true);
         translate([-32,-y+s[1],7]) 
            rotate([0,90,0])
               cylinder(10.2,3,3,center=true,$fn=60);
      }
      translate([7.5,-y+h[0][1],6]) 
         cube([50,4,10],center=true);
      translate([8.5,-y+h[1][1],6]) 
         cube([48,4,10],center=true);
      translate([-x+i[0],-y+i[1],6]) 
         cube([6,8,10],center=true);
   }
}
//---------------------------------------------------------|
module arduino_fix()
{
   c = r*2;
   translate([-b[3][0]/2,-b[3][1]/2,0]) // center position for holes
   difference() 
   {
      union()
      {
         for(l = [h[0],h[1]])
         {
             translate([l[0]+c,l[1],0]) cylinder(w,c,c,center=true,$fn=60);
             translate([l[0]  ,l[1],0]) cube([c*2,c*2,w],center=true);
             translate([l[0]-c,l[1],0]) cylinder(w,c,c,center=true,$fn=60);
         }
         for(l = [h[2],h[3]])
         {
             translate([l[0],l[1]+c,0]) cylinder(w,c,c,center=true,$fn=60);
             translate([l[0],l[1]  ,0]) cube([c*2,c*2,w],center=true);
             translate([l[0],l[1]-c,0]) cylinder(w,c,c,center=true,$fn=60);
         }
      }
   }
}
//---------------------------------------------------------|
module cub8(xyz,r,center,fn,b)
{
   // rounded corners cube
   union() 
   {
      cube([xyz[0]-(r*2),xyz[1]-(r*2),xyz[2]],center=center);
      cube([xyz[0]-(r*2),xyz[1],xyz[2]-(r*2)],center=center);
      cube([xyz[0],xyz[1]-(r*2),xyz[2]-(r*2)],center=center);
      if(b==1)
      {
         translate([0,0,(xyz[2]/2)-r/2])
            cube([xyz[0]-(r*2),xyz[1],r],center=center);
         translate([0,0,(xyz[2]/2)-r/2])
            cube([xyz[0],xyz[1]-(r*2),r],center=center);
         for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
            for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
               translate([x,y,(xyz[2]/2)-r/2])
                  cylinder(h=r,
                           r1=r,r2=r,center=center,$fn=fn);
      }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
               translate([x,y,z])
                  sphere(r=r,center=center,$fn=fn);
            }
      for(x=[0]) 
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
               translate([x,y,z]) 
                  rotate([0,90,0])
                     cylinder(h=xyz[0]-(r*2),
                              r1=r,r2=r,center=center,$fn=fn);
            }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
         for(y=[0]) 
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
               translate([x,y,z]) 
                  rotate([90,0,0])
                     cylinder(h=xyz[1]-(r*2),
                              r1=r,r2=r,center=center,$fn=fn);
            }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
            for(z=[0]) 
            {
               translate([x,y,z]) rotate([0,0,0])
                  cylinder(h=xyz[2]-(r*2),
                           r1=r,r2=r,center=center,$fn=fn);
            }
   }
}
//---------------------------------------------------------|