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
   //       gear_54();
   //    translate([0,0,0])
   //       gear_external(num_teeth=21);
       translate([0,0,-1])
          gear_54();
       translate([0,0,0])
          gear();
       translate([0,0,0])
          head();
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
module gear_54()
{
   difference()
   {
      translate([0,0,0])
          cylinder(h=10,d1=65,d2=55,center=true,$fn=60);
      translate([0,0,0])
          cylinder(h=10+ac,d=10,center=true,$fn=60);
   }
   for(r=[0:45:315])
      rotate([0,90,r])
         translate([0,20,30])
            cylinder(h=30,d=10,center=true,$fn=fn);
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module head()
{
   rotate([90,0,0])
      translate([0,2.5,-10])
         scale([0.75,0.75,0.75])
            import("T-800_Exoskull_MeshLab_v3.stl");
}
//---------------------------------------------------------|
