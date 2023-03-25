/*---------------------------------------------------------\
|    From: Ekobots Innovation Ltda - www.ekobots.com.br    |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|            Program Snake Charger - 2015/08/07            |
|                All rights reserved 2015                  |
|---------------------------------------------------------*/
// thread library, metric and imperial:
include <thread.scad>;
/*
metric_thread (diameter, pitch, length)
english_thread (diameter, threads_per_inch, length)
*/
// Common values:
ac=0.2;  // adjust for cuts;
fn=72;   // object resolution;
handdrill();
// Draw the object cuted:
// handdrill_half();
//---------------------------------------------------------|
module handdrill()
{
   translate([0,0,0]) 
      handle();
   translate([0,0,-110]) 
      rotate([0,180,0])
         head_01();
   translate([0,0,-60]) 
      rotate([0,180,0])
         fixdrill(d=5);
   translate([0,0,-30]) 
      rotate([0,180,0])
         head_02();
   translate([0,0,180]) 
      rotate([0,180,0])
         spinner_01();
   translate([0,0,110]) 
      spinner_02();
}
//---------------------------------------------------------|
module handdrill_half()
{
   difference()
   {
      // snake charger
      translate([0,0,0]) 
         handdrill();
      // half cut snake charger
      translate([100,0,100]) 
         cube([200,200,2000],center=true);
   }
}
//---------------------------------------------------------|
module handle()
{
   difference()
   {
      union()
      {
         translate([0,0,0]) 
            spinbody();
         translate([0,0,150.5]) 
            cylinder(h=1,d1=11,d2=11,center=true,$fn=fn);
         translate([0,0,154.5]) 
            cylinder(h=7,d1=8,d2=8,center=true,$fn=fn);
         translate([0,0,-2.5]) 
            cylinder(h=5,d1=15,d2=15,center=true,$fn=5);
      }
      translate([0,0,75]) 
         cylinder(h=200,d1=3.5,d2=3.5,center=true,$fn=fn);
      translate([0,0,156]) 
         cylinder(h=4+ac,d1=7,d2=7,center=true,$fn=6);
      translate([0,0,-3]) 
         cylinder(h=4+ac,d1=7,d2=7,center=true,$fn=6);
   }
}
//---------------------------------------------------------|
module head_01()
{
   difference()
   {
      union()
      {
         translate([0,0,-2.5]) 
            cylinder(h=20,d1=36,d2=36,center=true,$fn=fn);
         translate([0,0,15]) 
            cylinder(h=15,d1=35,d2=22.5,center=true,$fn=fn);
      }
      translate([0,0,17.5]) 
         cylinder(h=20+ac,d1=25,d2=10,center=true,$fn=fn);
      translate([0,0,-2.5])
         cylinder(h=20+ac,d1=25,d2=25,center=true,$fn=fn);
      translate([0,0,-12.5])
         cylinder(h=5+ac,d1=35,d2=25,center=true,$fn=fn);
      translate([0,0,-15]) 
         scale([1.03,1.03,1])
            metric_thread(30,4,20);
   }
}
//---------------------------------------------------------|
module head_02()
{
   difference()
   {
      union()
      {
         translate([0,0,-12.5]) 
            metric_thread(30,4,20);
         translate([0,0,10]) 
            cylinder(h=5+ac,d1=15,d2=12.5,center=true,$fn=fn);
      }
      translate([0,0,0]) 
         cylinder(h=25+ac,d1=4,d2=4,center=true,$fn=fn);
      translate([0,0,7.5]) 
         cylinder(h=15+ac,d1=8+ac,d2=8+ac,center=true,$fn=fn);
      translate([0,0,-10]) 
         cylinder(h=5+ac,d1=15+ac,d2=15+ac,center=true,$fn=5);
      translate([0,0,-10.5]) 
         cylinder(h=5+ac,d1=18.5+ac,d2=5+ac,center=true,$fn=5);
   }
}
//---------------------------------------------------------|
module fixdrill(d=4)
{
   difference()
   {
      union()
      {
         translate([0,0,0]) 
            cylinder(h=5,d1=25,d2=25,center=true,$fn=fn);
         translate([0,0,12.5]) 
            cylinder(h=20,d1=25,d2=10,center=true,$fn=fn);
      }
      translate([0,0,12.5]) 
         cube([25+ac,0.5,20+ac],center=true);
      translate([0,0,12.5]) 
         cube([0.5,25+ac,20+ac],center=true);
      translate([0,0,0]) 
         cylinder(h=5+ac,d1=15+ac,d2=12.5+ac,center=true,$fn=fn);
      translate([0,0,3.75]) 
         cylinder(h=2.5,d1=12.5,d2=15,center=true,$fn=fn);
      translate([0,0,6.25]) 
         cylinder(h=2.5,d1=15,d2=0,center=true,$fn=fn);
      translate([0,0,12.5]) 
         cylinder(h=40,d1=d,d2=d,center=true,$fn=fn);
      translate([0,0,26-d]) 
         cylinder(h=10,d1=0,d2=10,center=true,$fn=fn);
      translate([0,0,2.5]) 
         rotate([90,0,0])
            cylinder(h=25+ac,d1=2,d2=2,center=true,$fn=fn);
      translate([0,0,2.5]) 
         rotate([0,90,0])
            cylinder(h=25+ac,d1=2,d2=2,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module spinner_01()
{
   difference()
   {
      translate([0,0,0]) 
         sphere(d=35,center=true,$fn=fn);
      translate([0,0,15]) 
         cylinder(h=10+ac,d1=35+ac,d2=35+ac,center=true,$fn=fn);
      difference()
      {
         translate([0,0,7]) 
            cylinder(h=8+ac,d1=22+ac,d2=22+ac,center=true,$fn=fn);
         translate([0,0,2.5]) 
            cylinder(h=2,d1=11,d2=11,center=true,$fn=fn);
      }
      translate([0,0,0]) 
         cylinder(h=35+ac,d1=4+ac,d2=4+ac,center=true,$fn=fn);
      translate([0,0,-12.5]) 
         cylinder(h=6+ac,d1=8+ac,d2=8+ac,center=true,$fn=fn);
      translate([0,0,-16]) 
         cylinder(h=5+ac,d1=15+ac,d2=6+ac,center=true,$fn=fn);
      translate([0,0,-18]) 
         cylinder(h=5+ac,d1=20+ac,d2=20+ac,center=true,$fn=fn);
      for(r=[10:10:360])
         rotate([0,0,r])
            translate([0,21,0]) 
               rotate([0,0,27])
                  cylinder(h=20+ac,d1=10,d2=10,center=true,$fn=3);
   }
}
//---------------------------------------------------------|
module spinner_02()
{
   difference()
   {
      union()
      {
         translate([0,0,0]) 
            sphere(d=35,center=true,$fn=fn);
         translate([0,0,11]) 
               cylinder(h=10+ac,d1=25+ac,d2=25+ac,center=true,$fn=fn);
         translate([0,0,-11]) 
               cylinder(h=10+ac,d1=25+ac,d2=25+ac,center=true,$fn=fn);
      }
      translate([0,0,-75]) 
         spinbody(d=16);
      for(r=[10:10:360])
         rotate([0,0,r])
            translate([0,21,0]) 
               rotate([0,0,27])
                  cylinder(h=20+ac,d1=10,d2=10,center=true,$fn=3);
      translate([0,0,15]) 
         rotate([0,0,5])
            cylinder(h=10+ac,d1=5+ac,d2=30+ac,center=true,$fn=5);
      translate([0,0,-15]) 
         rotate([0,0,45])
            cylinder(h=10+ac,d1=30+ac,d2=5+ac,center=true,$fn=5);
      for(r=[10:10:360])
         rotate([0,0,r])
            translate([0,22,0]) 
               rotate([0,90,0])
                  {
                     rotate([0,0,30])
                        translate([5,0,0]) 
                           cylinder(h=5+ac,d1=17,d2=17,center=true,$fn=3);
                     rotate([0,0,30])
                        cylinder(h=5+ac,d1=11,d2=11,center=true,$fn=3);
                     rotate([0,0,30])
                        translate([-5,0,0]) 
                           cylinder(h=5+ac,d1=7,d2=7,center=true,$fn=3);
                  }
   }
}
//---------------------------------------------------------|
module spinbody(d=15)
{
   translate([0,0,0])
      linear_extrude(height=150,center=false,convexity=10,twist=600,$fn=200)
         circle(d=d,$fn=5);
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
module cub8r(xyz,r,center,fn)
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