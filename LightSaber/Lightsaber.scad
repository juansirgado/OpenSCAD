/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|             Program Lightsaber - 2015/01/28              |
|               All rights reserved 2015                   |
|---------------------------------------------------------*/
a =  0.2;   // Adjust value for hole gap
led =  3;   // Number of rgb leds, range=(1:3)
fn = 120;   // Number of faces for common objects
//---------------------------------------------------------|
Lightsaber();   // Lasersaber draw 
//---------------------------------------------------------|
module Lightsaber()
{
   translate([-250,0,0]) rotate([0,90,0]) blade();
   translate([ 150,0,0]) rotate([0,90,0]) handle();
}
//---------------------------------------------------------|
module blade()
{
   translate([0,0,-60]) blade_tip();
   for(z=[0:70:210])
      translate([0,0,z]) blade_body();
}
//---------------------------------------------------------|
module handle()
{
   translate([0,0,-135]) laser_body(led);
   translate([0,0, -55]) switch_body();
   translate([0,0,   0]) rotate([180,0,0]) join_bodies();
   translate([0,0,  75]) battery_body();
   translate([0,0, 150]) rotate([180,0,0]) battery_lock();
}
//---------------------------------------------------------|
module battery_body()
{
   difference()
   {
      union()
      {
         translate([0,0,0])
            cylinder(100,15,15,center=true,$fn=12);
         translate([0,0,-45])
            cylinder(10,20,20,center=true,$fn=8);
      }
      translate([0,0,0]) 
         cylinder(100+a,10,10,center=true,$fn=fn);
      translate([10,0,0])
         cube([5,2.5,100+a],center=true);
      translate([0,0,45]) rotate([90,0,0])
         cylinder(30+a,1.5,1.5,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module battery_lock()
{
   difference()
   {
      union()
      {
         translate([0,0,0])
            cylinder(10,22.5,22.5,center=true,$fn=8);
         translate([0,0,10])
            cylinder(10,10-a,10-a,center=true,$fn=fn);
      }
      translate([0,0,10]) rotate([90,0,0])
         cylinder(20+a,1.5,1.5,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module switch_body()
{
   difference()
   { 
      union()
      {
         translate([0,0,0]) rotate([0,0,30])
            cylinder(80,15,15,center=true,$fn=fn);
         for(z=[20,0,-20])
            translate([0,0,z]) rotate([0,90,0])
               cylinder(30,11,11,center=true,$fn=fn);
      }
      translate([0,0,0]) rotate([0,0,30])
         cylinder(80+a,9,9,center=true,$fn=fn);
      for(z=[20,0,-20])
         translate([-2.5,0,z]) rotate([0,90,0])
            cylinder(25+a,8,8,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module join_bodies()
{
   difference()
   {
      union()
      {
         translate([0,0,0])
            cylinder(10,9-a,9-a,center=true,$fn=fn);
         translate([0,0,-10])
            cylinder(10,10-a,10-a,center=true,$fn=fn);
      }
      translate([0,0,-5])
         cylinder(20+a,2,2,center=true,$fn=fn);
      translate([5,0,-5])
         cube([10,2.5,20+a],center=true);
   }
}
//---------------------------------------------------------|
module laser_body(led=1)
{
   angle=360/led;
   difference()
   {
      union()
      {
         translate([0,0,0]) rotate([0,0,30])
            cylinder(15,17.5,17.5,center=true,$fn=10);
         translate([0,0,12.5])
            cylinder(15,12.5-a,12.5-a,center=true,$fn=fn);
         translate([0,0,25])
            cylinder(15,9-a,9-a,center=true,$fn=fn);
      }
      translate([0,0,-5])
         cylinder(15+a,9+a,9+a,center=true,$fn=fn);
         translate([0,0,17.5]) 
            cylinder(30+a,4,4,center=true,$fn=fn);
      if(led>1&&led<4)
      {
         for(z=[angle:angle:360])
         {
            rotate([0,0,z]) translate([3.5,0,10]) 
               cylinder(15+a,3,3,center=true,$fn=fn);
         }
      }
      else 
      {
         translate([0,0,10]) 
            cylinder(15+a,3,3,center=true,$fn=fn);
      }
   }
}
//---------------------------------------------------------|
module blade_body()
{
   union()
   {
      difference()
      {
         union()
         {
            translate([0,0,0]) rotate([0,0,30])
               cylinder(50,10+a,10+a,center=true,$fn=fn);
            translate([0,0,30])
               cylinder(10,9-a,9-a,center=true,$fn=fn);
         }
         translate([0,0,5])
            cylinder(60+a,8-a,8-a,center=true,$fn=fn);
         translate([0,0,-20])
            cylinder(10+a,9,9,center=true,$fn=fn);
      }
      for(z=[0,120,240])
         translate([0,0,10]) rotate([0,0,z])
            cube([1,17.5,50],center=true);
   }
}
//---------------------------------------------------------|
module blade_tip()
{
   union()
   {
      difference()
      {
         union()
         {
            translate([0,0,0]) rotate([0,0,30])
               sphere(10+a,center=true,$fn=fn);
            translate([0,0,5]) rotate([0,0,30])
               cylinder(10,10+a,10+a,center=true,$fn=fn);
            translate([0,0,15])
               cylinder(10,9-a,9-a,center=true,$fn=fn);
         }
         translate([0,0,10])
            cylinder(20+a,8-a,8-a,center=true,$fn=fn);
      }
      for(z=[0,120,240])
         translate([0,0,10]) rotate([0,0,z])
            cube([1,17.5,20],center=true);
   }
}
//---------------------------------------------------------|