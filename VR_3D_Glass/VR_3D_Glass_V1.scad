/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Gyroscopic Ball - 2015/09/30            |
|               All rights reserved 2015                   |
|---------------------------------------------------------*/
// iPhone 4 size in mm (if other change the paramenters)
//---------------------------------------------------------|
px = 115.5;    // height real 115.20
py =  59.0;    // width  real  58.60
pz =   9.5;    // depth  real   9.30
pr =  15.5 /2; // radius real   15.7/2(phone border curve)
//---------------------------------------------------------|
// Screen size from the top to bottom, not diagonal
// in the most large side, will be used in the X axis
//---------------------------------------------------------|
ps =  75.0;  // screen size real 75.20
//---------------------------------------------------------|
// iPhone 5 size in mm (if other change the paramenters)
//---------------------------------------------------------|
//px = 124.0;    // height real 123.80
//py =  59.0;    // width  real  58.60
//pz =   7.5;    // depth  real   7.60
//pr =  15.5 /2; // radius real   9.28/2(phone border curve)
//---------------------------------------------------------|
// iPhone 6 size in mm (if other change the paramenters)
//---------------------------------------------------------|
//px = 138.5;    // height real 138.10
//py =  67.5;    // width  real  67.00
//pz =   7.0;    // depth  real   6.90
//pr =  15.7 /2; // radius real  15.7/2(phone border curve)
//---------------------------------------------------------|
// your nose house in mm (change as you wish)
//---------------------------------------------------------|
nx = 25; // width
ny = 60; // height
nz = 70; // length
//---------------------------------------------------------|
// your facial curve in mm (change as you wish) 
//---------------------------------------------------------|
hx = 160; // width
hy = 220; // length
hz = 180; // height
//---------------------------------------------------------|
// your eyes distance in mm(change as you wish)
//---------------------------------------------------------|
// Interpupillary distance - IPD
// male 95% has an IDP 68mm of distance
// female 95% has an IDP 64mm of distance
//---------------------------------------------------------|
yc = 60; // distance between eyes center(IPD)
yd = yc / 2; // half of the "yc" (do not change this line)
//---------------------------------------------------------|
// lens diameter in mm, only lens with 45mm distance focus
//---------------------------------------------------------|
//ld = 37; // lens diamenter 37mm
ld = 25;   // lens diamenter 25mm
lf = 45;   // lens focal distance 45mm
fc = 5;    // height for focus corretion ring
// distance to screen center
dd = (((ps / 2) - 1.25) / 2) + 1.25; 
// distance from IPD to screen center
dc = yd - dd;
// degrees rotation to aim the screen center
dr = (90 - atan(lf / dc)) / 4;
//---------------------------------------------------------|
// ribbon width in mm to fix the box and the phone
//---------------------------------------------------------|
rw = 15;   // ribbon width
//---------------------------------------------------------|
// number of faces for objects
//---------------------------------------------------------|
fn = 120;  // object resolution
//---------------------------------------------------------|
// vr_3d_glass(); // module VR 3D Glass render
vr_3d_test(); // module VR 3D Glass render
//---------------------------------------------------------|
module vr_3d_glass()
{  
   for(x=[yd,-yd])
      translate([x,0,100]) 
         rotate([180,0,x<0?0:180]) 
            len_lock();
   for(x=[yd,-yd])
      translate([x,0,120]) 
         rotate([0,x>0?dr:-dr,0]) 
            len_sample();
   for(x=[yd,-yd])
      translate([x,0,140]) 
         rotate([180,0,0]) 
            len_house();
   translate([0,0,17.5+70]) 
      rotate([0,180,0]) 
         lens_frame();
   for(x=[(px+20)/2,-(px+20)/2])
      translate([x,0,50]) 
         rotate([0,90,0]) 
            ribbon_clip();
   translate([0,0,0]) 
      vr_box();
   translate([0,0,-60]) 
      phone_sample();
   translate([0,0,-80]) 
      rotate([0,0,90]) 
         ribbon_clip();
}
//---------------------------------------------------------|
module vr_3d_test()
{  
   translate([0,0,40]) 
      rotate([0,180,0]) 
         lens_frame();
   for(x=[yd,-yd])
      translate([x,0,10]) 
         rotate([180,0,x<0?0:180]) 
            len_lock();
   for(x=[yd,-yd])
   {
      translate([x,0,0]) 
         rotate([0,x>0?dr:-dr,0]) 
            len_sample();
   }
   for(x=[yd,-yd])
      translate([x,0,-10]) 
         rotate([0,0,x>0?0:180]) 
            len_lock();

   for(x=[yd,-yd])
   {
      translate([0,0,0]) 
         len_inclination(x);
   }
   translate([0,0,-50]) 
      phone_sample();
}
//---------------------------------------------------------|
module vr_box()
{
   difference()
   {
      union()
      {
         // main box
         translate([0,0,0])
            cube_rounded([px+10,py+5,72],r=5,a=2);
         // phone fix  
         translate([0,0,-31])
            cube_rounded([rw+10,py+15,10],r=5,a=2);      
         // head border
         intersection()
         {  
           translate([0,0,28.5])
              cube_rounded([px,py+10,15],r=2,a=0);
           translate([0,0,28.5])
              cube_rounded([px,py+10,15],r=20,a=2);
         }
      }
      // phone house
      intersection()
      {
        translate([0,0,-36])
           cube_rounded([px,py,4],r=1,a=0);
        translate([0,0,-36])
           cube_rounded([px,py,4],r=1,a=1);
        translate([0,0,-36])
           cube_rounded([px,py,4],r=pr,a=2);
      }
      // lens frame house 
      translate([0,0,30])
         cube_rounded([px-5,py,30],r=5,a=2);
      // box center cut
      translate([0,0,0])
         cube_rounded([px-5,py-5,72.2],r=5,a=2);
      // phone fix holes  
      for(y=[(py+7)/2,-(py+7)/2])
      {
         translate([0,y,-31])
            cube_rounded([rw,2,10.2],r=1,a=2);
      }

      // head fix holes
      for(x=[(px+2.5)/2,-(px+2.5)/2])
      {
         translate([x,0,21.5]) 
            cube_rounded([7.7,rw,2.5],r=1,a=0);
      }
      // box head cut
      translate([0,0,(hz/2)+20])
         scale([hx,hy,hz])
            sphere(d=1,center=true,$fn=fn);
      // box nose cut
      translate([0,-30,30])
         scale([nx,ny,nz])
            sphere(d=1,center=true,$fn=fn);
      // box nose cut
      translate([0,-(py+2.5)/2,27.5])
         rotate([90,0,0])
            scale([1,0.5,1])
               cylinder(h=10,d=35,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module lens_frame()
{
   difference()
   {
      union()
      {
         // lens frame
         translate([0,0,0])
            cube_rounded([px-5.5,py-0.5,5],r=5,a=2);
         // center wall
         translate([0,0,25])
            cube_rounded([2.5,py-5.5,53],r=1,a=1);
         intersection()
         {
            // lens frame nose area 
            translate([0,-(py-45.5)/2,17.5])
               cube([40,40,40],center=true);
            // lens frame nose shell
            translate([0,-30,-12])
               scale([nx+5,ny+5,nz+5])
                  sphere(d=1,center=true,$fn=fn);
         }
      }
      // lens hole
      for(x=[yd,-yd])
      {
         translate([x,0,0])
            cube_rounded([ld+10,ld+5,5.2],r=(ld+5)/2,a=2);
      }
      // lens frame nose cut
      translate([0,-30,-12])
         scale([nx,ny,nz])
            sphere(d=1,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module len_house()
{
   difference()
   {
      union()
      {
         translate([0,0,0])
            cylinder(h=15,d=ld+5,center=true,$fn=fn);
         translate([0,0,-6.25])
            cube_rounded([ld+15,ld+10,2.5],r=ld/2,a=2);
      }
      translate([0,0,0])
         cylinder(h=15.2,d=ld-2,center=true,$fn=fn);
      translate([0,0,1.35])
         cylinder(h=12.7,d=ld+0.25,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module len_lock()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=2.5,d=ld,center=true,$fn=fn);
      translate([0,0,0])
         cylinder(h=2.7,d=ld-2.25,center=true,$fn=fn);
//      translate([0,0,5])
//         rotate([0,dr,0]) 
//            cylinder(h=10,d=ld+5,center=true,$fn=60);

   }
}
//---------------------------------------------------------|
module len_inclination(x=0)
{
      // image direction
   translate([x+(x>0?-dc/2:dc/2),0,-22.5]) 
      rotate([0,x>0?dr:-dr,0]) 
         cylinder(h=lf,r1=2.5,r2=0.25,center=true,$fn=60);
   translate([x,0,0]) 
      cylinder(h=1,r=1,center=true,$fn=60);
   // IPD over screen
   translate([x,0,-lf]) 
      cylinder(h=1,r=0.5,center=true,$fn=60);
   // screen center
   translate([x>0?dd:-dd,0,-lf]) 
      cylinder(h=1,r=1,center=true,$fn=60);

}
//---------------------------------------------------------|
module ribbon_clip()
{
   difference()
   {
      translate([0,0,0])
         cube_rounded([20,rw+10,5],r=2.5,a=2);
      for(x=[4.5,-4.5])
      {
         translate([x,0,0])
            cube_rounded([4,rw,5.2],r=1,a=2);
      }
   }
}
//---------------------------------------------------------|
module phone_sample()
{
   difference()
   {
      translate([0,0,0])
         cube_rounded([px,py,pz],r=pr,a=2);
      difference()
      {
         translate([0,0,pz/2])
            cube_rounded([ps,py-5,0.2],r=1,a=2);
         translate([0,0,pz/2])
            cube([2.5,py-4.8,0.4],center=true);
      }
   }
}
//---------------------------------------------------------|
module len_sample()
{
   translate([0,0,0])
      scale([1,1,0.2])
         color([1,1,1],0.5)
            sphere(d=ld,center=true,$fn=fn);
}
//---------------------------------------------------------|
module cube_rounded(xyz=[20,10,5],r=1,a=2) 
{
   // cut corners in x -> a=0 or y -> a=1 or z -> a=2
   x = xyz[0]; // x axis length
   y = xyz[1]; // y axis length
   z = xyz[2]; // z axis length
   ra=a==0?[0,90,0]:
      a==1?[90,0,0]:
           [0,0,0];
   difference()
   {
      // main cube no translation and no rotation
      translate([0,0,0]) 
         rotate([0,0,0]) 
            cube(xyz,center=true);
      // cornner cut rotation, default cut is z
      rotate(ra) 
         cube_corners(x=x,y=y,z=z,r=r,a=a);
   }
}
//---------------------------------------------------------|
module cube_corners(x=20,y=10,z=5,r=1,a=2)
{
   c = 0.2;    // correction
   // points and rotation for z corners 
   px = [[-z,-y,0,-1,-1,0,0],[z,-y,0,1,-1,0,90],
        [z,y,0,1,1,0,180],[-z,y,0,-1,1,0,270]]; 
   py = [[-x,-z,0,-1,-1,0,0],[x,-z,0,1,-1,0,90],
        [x,z,0,1,1,0,180],[-x,z,0,-1,1,0,270]]; 
   pz = [[-x,-y,0,-1,-1,0,0],[x,-y,0,1,-1,0,90],
        [x,y,0,1,1,0,180],[-x,y,0,-1,1,0,270]];
   p=a==0?px:a==1?py:pz;
   d=a==0?x:a==1?y:z;
   for(i=p)
   {
      translate([(i[0]-r*i[3])/2,
                 (i[1]-r*i[4])/2,
                 (i[2]-r*i[5])/2]) 
         rotate([0,0,i[6]])
            cube_border(z=d,r=r,c=c);
   }
}
//---------------------------------------------------------|
module cube_border(z=10,r=1,c=2) 
{
   // cube border cut
   difference() 
   {
      translate([0,0,0])
         cube([r+c,r+c,z+c],center=true);
      translate([r/2,r/2,0]) 
         cylinder(h=z+(c*2),r=r,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
