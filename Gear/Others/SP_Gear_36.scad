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
   //       gear_36();
   //    translate([0,0,0])
   //       gear_external(num_teeth=21);
       translate([0,0,-1])
          gear_36();
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
module gear_36()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,22.5,45,67.5,90,110.5,135,157.5,180,202.5,225,247.5,270,292.5,315,337.5])
      rotate([0,0,r])
           difference()
           {
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10,d=50,center=true,$fn=60);
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10+ac,d=45,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
