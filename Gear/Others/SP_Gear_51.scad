/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Gear External - 2019/05/08              |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
include <Gear_Trapezoidal_Tooth.scad>
include <Gear_External.scad>
ac=0.2;
fn=60;
pi=3.141592;
rt=-($t*360);
gear_full();
//gear_rotate();
//---------------------------------------------------------|
module gear_full()
{
   union()
   {
   //    translate([0,0,-1])
   //       gear_52();
   //    translate([0,0,0])
   //       gear_external(num_teeth=21);
       translate([0,0,-1])
          gear_52();
       translate([0,0,0])
          gear();
   }
}
//---------------------------------------------------------|
module gear_rotate()
{
   translate([56.5,0,0])
      rotate([0,0,-rt])
         gear_full();
   translate([-56.5,0,0])
      rotate([0,0,rt])
         gear_full();
}
//---------------------------------------------------------|
module gear_52()
{
   translate([0,5.75,-5])
      scale([0.825,0.825,4])
         import("Skull_and_Cross_Bones.stl");
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
