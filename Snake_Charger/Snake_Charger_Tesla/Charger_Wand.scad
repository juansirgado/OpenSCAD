/*---------------------------------------------------------\
|    From: Ekobots Innovation Ltda - www.ekobots.com.br    |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|            Program Wand Charger - 2017/02/10             |
|                All rights reserved 2017                  |
|---------------------------------------------------------*/
// Common values:
ac=0.2;   // adjust for cuts;
fn=120;    // object resolution;
ht=44.45;       // tip height
hh=139.70 - ht; // handle height
c1=9.5;   // connector 1 diamater 
c2=3.5;   // connector 2 diamater
c3=1.8;   // connector 3 diamater
//---------------------------------------------------------|
// wand pieces to draw:
sp=0;    // 0=all; 1=tip; 2=handle; 3=flex; 4=cable;
// Distance between pieces:
ds=0;   // milimeters for pieces displacement;
//---------------------------------------------------------|
wandcharger_full();
// wandcharger_parts();
// Draw the object cuted:
// wnadcharger_half();
//---------------------------------------------------------|
module wandcharger_full()
{
   if((sp==0)||(sp==1))
      translate([0,0,67+ds])
         wandtip();
   if((sp==0)||(sp==2))
      translate([0,0,0]) 
         wandhandle();
   if((sp==0)||(sp==3))
      translate([0,-14.125,-(94.5+ds)]) 
         rotate([162,0,0]) 
            wandflex();
   if((sp==9)||(sp==4))
      translate([0,-34,-(155+(ds*2))]) 
         rotate([162,0,0]) 
            wandcable();
}
//---------------------------------------------------------|
module wandcharger_parts()
{
   translate([0,0,80]) 
      wandtip();
   translate([0,0,0]) 
      wandhandle();
   translate([0,-20,-110]) 
      rotate([162,0,0]) 
         wandflex();
   translate([0,-45,-190]) 
      rotate([162,0,0]) 
         wandcable();
}
//---------------------------------------------------------|
module wandcharger_half()
{
   difference()
   {
      // snake charger
      translate([0,0,0]) 
         wandcharger();
      // half cut snake charger
      translate([100,0,100]) 
         cube([200,200,2000],center=true);
   }
}
//---------------------------------------------------------|
module wandtip()
{
   union()
   {
      // tip connector 1
      for(x=[10.75,-10.75])
         translate([x,10,0]) 
            arc8r(h=ht,d1=c1+8,d2=c1+8,w=4,r=1.5,center=true,fn=fn);
      // tip connector 2
      translate([0,-5.5,0]) 
         arc8r(h=ht,d1=c2+6,d2=c2+6,w=3,r=1.25,center=true,fn=fn);
      // tip connector 3
      for(x=[8.25,-8.25])
         translate([x,-6.5,0]) 
            arc8r(h=ht,d1=c3+6,d2=c3+6,w=3,r=1.25,center=true,fn=fn);
      // tip wall
      translate([0,0,0]) 
         wandwall(h=ht);
      // tip connector fix
      intersection()
      {
         translate([0,-20,0]) 
            arc8r(h=ht,d1=40,d2=40,w=2.5,r=1.25,center=true,fn=fn);
         translate([0,0,0]) 
            cube([27.5,40,ht],center=true);
      }
   }
/*
   translate([0,4,0]) 
      *cylinder(h=190.5,d1=38.1,d2=38.1,center=true,$fn=fn);
   translate([0,10,0])
      *cube([12,20,20],center=true);
   translate([10.75,10,0])
      *cube([9.5,20,20],center=true); 
   translate([0,0.5,0])
      *cube([30,9,10],center=true);
   translate([0,0,0])
      *cube([30,10.5,10],center=true);
   translate([0,-7,0])
      *cube([14.75,10.5,10],center=true);
*/
}
//---------------------------------------------------------|
module wandhandle_top()
{
   union()
   {
      // tip wall
      translate([0,0,0]) 
         wandwall(h=hh);
      intersection()
      {
         // tip connector 1
         translate([10.75,10,0]) 
            arc8r(h=hh,d1=c1+8,d2=c1+8,w=3,r=1.5,center=true,fn=fn);
         translate([17,15,0]) 
            cube([10,10,hh+ac],center=true);
      }
      intersection()
      {
         // tip connector 1
         translate([-10.75,10,0]) 
               arc8r(h=hh,d1=c1+8,d2=c1+8,w=3,r=1.5,center=true,fn=fn);
         translate([-17,15,0]) 
            cube([10,10,hh+ac],center=true);
      }
   }
}
//---------------------------------------------------------|
module wandhandle()
{
   difference()
   {
      union()
      {
         translate([0,0,0])
            wandhandle_top();
         translate([0,-3,-60]) 
            rotate([162,0,0])
               arc8r(h=40,d1=36,d2=32,w=3,r=1.5,center=true,fn=fn);
         for(x=[11,-11])
            translate([x,5,-62]) 
               rotate([162,0,0])
                  cylinder(h=36,d1=16,d2=1,center=true,$fn=fn);
     
      }
      translate([0,-3,-60]) 
         rotate([162,0,0])
               cylinder(h=40+ac,d1=30,d2=26,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module wandflex()
{
   translate([0,0,0]) 
      arc8r(h=38.1,d1=32,d2=20,w=3,r=1.5,center=true,fn=fn);
}
//---------------------------------------------------------|
module wandcable()
{
   translate([0,0,0]) 
      cylinder(h=100,d1=15.875,d2=15.875,center=true,$fn=fn);

}
//---------------------------------------------------------|
module wandwall(h=20)
{
   union()
   {
      intersection()
      {
         translate([0,-24.65,0]) 
            arc8r(h=h,d1=90,d2=90,w=3,r=1.5,center=true,fn=fn);
         translate([0,0,0]) 
            cube([25,45,h],center=true);
      }
      intersection()
      {
         rotate([0,0,117])
            translate([0,-23,0]) 
               arc8r(h=h,d1=80,d2=80,w=3,r=1.5,center=true,fn=fn);
         translate([0,1,0]) 
            cube([45,19,h],center=true);
      }
      intersection()
      {
         rotate([0,0,-117])
            translate([0,-23,0]) 
               arc8r(h=h,d1=80,d2=80,w=3,r=1.5,center=true,fn=fn);
         translate([0,1,0]) 
            cube([45,19,h],center=true);
      }
      intersection()
      {
         translate([0,8.5,0]) 
            arc8r(h=h,d1=45,d2=45,w=3,r=1.5,center=true,fn=fn);
         translate([0,0,0]) 
            cube([30,40,h],center=true);
      }
   }
}
//---------------------------------------------------------|
module cylind8r(h,d1,d2,r,center,fn)
{
   // rounded corners cylinder
   pi = 3.1415926535897932384626433832795028841971693993751;
   c1 = pi*d1;
   c2 = pi*d2;
   h1 = c1/fn;
   h2 = c2/fn;
   union() 
   {
      cylinder(h=h,d1=d1-(r*2),d2=d2-(r*2),center=center,$fn=fn);
      cylinder(h=h-(r*2),d1=d1,d2=d2,center=center,$fn=fn);
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d1/2)-r,0,(-h/2)+r]) 
               rotate([90,0,0])
                  cylinder(h=h1,r1=r,r2=r,
                           center=center,$fn=fn);
      }
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d2/2)-r,0,(h/2)-r]) 
               rotate([90,0,0]) 
                  cylinder(h=h2,r1=r,r2=r,
                           center=center,$fn=fn);
      }
   }
}
//---------------------------------------------------------|
module cub8(xyz,r,center,fn)
{
   // original cube
   //%cube(xyz,center=true);
   // rounded corners cube
   union() 
   {
      cube([xyz[0]-(r*2),xyz[1]-(r*2),xyz[2]],center=center);
      cube([xyz[0]-(r*2),xyz[1],xyz[2]-(r*2)],center=center);
      cube([xyz[0],xyz[1]-(r*2),xyz[2]-(r*2)],center=center);
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
      {
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
         {
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
            translate([x,y,z])
               sphere(r=r,center=center,$fn=fn);
            }
         }
      }
      for(x=[0]) 
      {
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
         {
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
            translate([x,y,z]) rotate([0,90,0])
               cylinder(h=xyz[0]-(r*2),
                        r1=r,r2=r,center=center,$fn=fn);
            }
         }
      }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
      {
         for(y=[0]) 
         {
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
            translate([x,y,z]) rotate([90,0,0])
               cylinder(h=xyz[1]-(r*2),
                        r1=r,r2=r,center=center,$fn=fn);
            }
         }
      }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
      {
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
         {
            for(z=[0]) 
            {
            translate([x,y,z]) rotate([0,0,0])
               cylinder(h=xyz[2]-(r*2),
                        r1=r,r2=r,center=center,$fn=fn);
            }
         }
      }
   }
}
//---------------------------------------------------------|
module arc8r(h,d1,d2,w,r,center,fn)
{
   // rounded corners cylinder
   pi = 3.1415926535897932384626433832795028841971693993751;
   c1 = pi*d1;
   c2 = pi*d2;
   h1 = c1/fn;
   h2 = c2/fn;
   union() 
   {
      difference()
      {
         cylinder(h=h-(r*2),d1=d1,d2=d2,center=center,$fn=fn);
         cylinder(h=h-(r*2)+ac,d1=d1-(w*2),d2=d2-(w*2),center=center,$fn=fn);
      }
      difference()
      {
         cylinder(h=h,d1=d1-(r*2),d2=d2-(r*2),center=center,$fn=fn);
         cylinder(h=h+ac,d1=d1-(w*2)+(r*2),d2=d2-(w*2)+(r*2),center=center,$fn=fn);
      }
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d1/2)-r,0,(-h/2)+r]) 
               rotate([90,0,0])
                  cylinder(h=h1,r1=r,r2=r,
                           center=center,$fn=fn);
      }
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d1/2)-w+r,0,(-h/2)+r]) 
               rotate([90,0,0])
                  cylinder(h=h1,r1=r,r2=r,
                           center=center,$fn=fn);
      }
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d2/2)-r,0,(h/2)-r]) 
               rotate([90,0,0]) 
                  cylinder(h=h2,r1=r,r2=r,
                           center=center,$fn=fn);
      }
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d2/2)-w+r,0,(h/2)-r]) 
               rotate([90,0,0]) 
                  cylinder(h=h2,r1=r,r2=r,
                           center=center,$fn=fn);
      }
   }
}
//---------------------------------------------------------|
