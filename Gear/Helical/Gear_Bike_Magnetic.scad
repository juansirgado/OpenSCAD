/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|       Program Gear Trapezoidal Tooth - 2019/05/08        |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
include <Gear_Double_Helical.scad>
//---------------------------------------------------------|
ac=0.2; // cut adjust in the objects
fn=60;  // number of faces in the objects 
dg=23.6;  // distance between the gears
//---------------------------------------------------------|
// n_teeh  -> number of teeth
// h_teeth -> height of teeth
// d_gear  -> diameter of gear (external)
// h_gear  -> gear height
// d_hole  -> diamenter of the center hole(0=none)
//---------------------------------------------------------|
//gear_bike();
gear_bike_half();
//---------------------------------------------------------|
module gear_bike()
{
   translate([dg,0,-12.5])
      gear_fix();
   translate([-dg,0,12.5])
      rotate([180,0,5])
         gear_select();
   translate([-dg,0,0])
      gear_bearing();
   translate([-dg,0,12.5])
      gear_shaft();
   translate([-dg,0,12.5])
      gear_lock();
   translate([-dg,0,0.5])
      gear_control();
}
//---------------------------------------------------------|
module gear_bike_half()
{
   difference()
   {
      // snake charger
      translate([0,0,0]) 
         gear_bike();
      // half cut snake charger
      translate([0,100,100]) 
         cube([200,200,2000],center=true);
   }
}
//---------------------------------------------------------|
module gear_fix()
{
   for(z=[25:5:50])
      difference()
      {
         translate([0,0,z-25])
            make_gear(number_of_teeth=z+10, 
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
            make_gear(number_of_teeth=z+10, 
                     circular_pitch=180, 
                     diametral_pitch=false, 
                     gear_height=4.8,
                     angle_twist=12);
         translate([0,0,z-26.5])
            cylinder(h=2+ac,d=20,center=true,$fn=fn);
         translate([0,0,z-25])
            cylinder(h=5+ac,d=16.5,center=true,$fn=fn);
         difference()
         {
            translate([0,0,z-23.2])
               cylinder(h=2,d=28,center=true,$fn=fn);
            translate([0,0,z-23.2])
               cylinder(h=2+ac,d=24,center=true,$fn=fn);
         }
         for(r=[0:10:350])
            rotate([0,0,r])
               translate([7.5,0,z-24])
                  rotate([0,0,20])
                     cube([2,2,4],center=true);
      }
}
//---------------------------------------------------------|
module gear_bearing()
{
   for(z=[25:5:50])
      for(r=[0:15:345])
         rotate([0,0,r])
            translate([9,0,z-36])
               sphere(d=2,center=true,$fn=fn);
   for(z=[25:5:50])
      for(r=[0:10:350])
         rotate([0,0,r])
            translate([13,0,z-39.3])
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
      for(r=[0:180:180])
         rotate([0,0,r+6])
            translate([7,0,-12.5])
               cylinder(h=30+ac,d=0.5,center=true,$fn=fn);
      for(r=[0:180:180])
         rotate([0,0,r-6])
            translate([6,0,-12.5])
               cylinder(h=30+ac,d=1.5+ac,center=true,$fn=fn);      for(z=[25:5:50])
         for(r=[0:180:180])
            rotate([0,0,r])
               translate([7.5,0,z-51])
                  rotate([0,90,0])
                     cube([2,4,3],center=true);
      translate([0,0,-12.5])
         cylinder(h=30+ac,d=8,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module gear_lock()
{
   for(z=[25:5:50])
      for(r=[0:180:180])
         rotate([0,0,r])
            translate([7,0.25,z-51])
                  simple_lock();
   for(r=[0:180:180])
      rotate([0,0,r+6])
         translate([7,0,-12.5])
            cylinder(h=30.5,d=0.5,center=true,$fn=fn);      
}
//---------------------------------------------------------|
module gear_control()
{
   union()
   {
      for(r=[0:180:180])
         rotate([0,0,r-5])
            translate([6,0,-15])
               cylinder(h=60,d=1,center=true,$fn=fn);
      for(z=[-25:5:25])
         for(r=[0:180:180])
            rotate([0,0,r-5])
               translate([6,0,z-14])
                  color([0,0,1],1)
                     if(z!=0)
                        cylinder(h=3,d=2,center=true,$fn=fn);
      for(r=[0:180:180])
         rotate([0,0,r-5])
            translate([6,0,-14])
               color([1,0,0],1)
                  cylinder(h=3,d=2,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module simple_lock()
{
   union()
   {   
      difference()
      {  
         union()
         { 
            translate([0,-0.5,0])
               cube([2,2.5,2],center=true);
            translate([0,0.5,0])
               cylinder(h=2,d=2,center=true,$fn=fn);
         }
         translate([-1.25,-1.25,0])
            rotate([0,0,30])
               cube([2,3,2+ac],center=true);
         translate([0,0.5,0])
            cylinder(h=2+ac,d=0.5,center=true,$fn=fn); 
   //      translate([-0.25,-0.75,0])
   //         cylinder(h=1+ac,d=1,center=true,$fn=fn); 
      }
      translate([-0.25,-0.75,0])
         rotate([0,90,30])
            color([1,0,0],1)
               cylinder(h=0.5+ac,d=1.5,center=true,$fn=fn); 
   }
}
//---------------------------------------------------------|







