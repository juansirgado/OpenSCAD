/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|       Program Gear Trapezoidal Tooth - 2019/05/08        |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
include <Gear_Double_Helical.scad>
//---------------------------------------------------------|
ac=0.2;
fn=60;
//---------------------------------------------------------|
// n_teeh  -> number of teeth
// h_teeth -> height of teeth
// d_gear  -> diameter of gear (external)
// h_gear  -> gear height
// d_hole  -> diamenter of the center hole(0=none)
//---------------------------------------------------------|
gear_bike();
//---------------------------------------------------------|
module gear_bike()
{
   translate([18.6,0,-12.5])
      gear_fix();
   translate([-18.6,0,12.5])
      rotate([180,0,7])
         gear_select();
   translate([-18.6,0,0])
         gear_bearing();
   translate([-18.6,0,12.5])
         gear_shaft();
   translate([-18.6,0,12.5])
         gear_lock();
}
//---------------------------------------------------------|
module gear_fix()
{
   for(z=[25:5:50])
      difference()
      {
         translate([0,0,z-25])
            make_gear(number_of_teeth=z, 
                     circular_pitch=180, 
                     diametral_pitch=false, 
                     gear_height=4.8,
                     angle_twist=12);
         translate([0,0,z-25])
            cylinder(h=5+ac,d=8,center=true,$fn=fn);
      }
}
//---------------------------------------------------------|
module gear_select()
{
   for(z=[50:-5:25])
      difference()
      {
         translate([0,0,z-25])
            make_gear(number_of_teeth=z, 
                     circular_pitch=180, 
                     diametral_pitch=false, 
                     gear_height=4.8,
                     angle_twist=12);
         translate([0,0,z-26.5])
            cylinder(h=2+ac,d=20,center=true,$fn=fn);
         translate([0,0,z-25])
            cylinder(h=5+ac,d=16.5,center=true,$fn=fn);
         for(r=[0:60:300])
            rotate([0,0,r])
               translate([8,0,z-25])
                  cylinder(h=5+ac,d=2,center=true,$fn=fn);
      }
}
//---------------------------------------------------------|
module gear_bearing()
{
   for(z=[25:5:50])
      for(r=[0:15:345])
         rotate([0,0,r])
            translate([9,0,z-36.5])
               sphere(d=2,center=true,$fn=fn);
   for(z=[25:5:50])
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([7.5,0,z-38.5])
               rotate([0,90,0])
                  sphere(d=2,center=true,$fn=fn);
}
//---------------------------------------------------------|
module gear_shaft()
{
   difference()
   {
      translate([0,0,-12.5])
         cylinder(h=30,d=16,center=true,$fn=fn);
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([6,0,-12.5])
               cylinder(h=30+ac,d=2+ac,center=true,$fn=fn);
   for(z=[25:5:50])
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([7.5,0,z-51])
               rotate([0,90,0])
                  cylinder(h=3+ac,d=2+ac,center=true,$fn=fn);
      translate([0,0,-12.5])
         cylinder(h=30+ac,d=8,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module gear_lock()
{
   difference()
   {
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([6,0,-15])
               cylinder(h=60,d=2,center=true,$fn=fn);
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([8,0,3])
               cylinder(h=30+ac,d=3,center=true,$fn=fn);
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([8,0,-12])
               scale([1,1,2])
                  sphere(d=3,center=true,$fn=fn);
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([8,0,-35])
               cylinder(h=30+ac,d=3,center=true,$fn=fn);
      for(r=[0:60:300])
         rotate([0,0,r])
            translate([8,0,-20])
               scale([1,1,2])
                  sphere(d=3,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|







