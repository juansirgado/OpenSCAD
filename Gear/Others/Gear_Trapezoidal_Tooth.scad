/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|       Program Gear Trapezoidal Tooth - 2019/05/08        |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
ac=0.2;
fn=60;
pi=3.141592;
rt=-($t*360);
// gear();
// rotate_gear(); // Animate Parametes are (FPS: 60 Steps: 300)
//---------------------------------------------------------|
module rotate_gear()
{
   translate([56.5,0,0])
      rotate([0,0,-rt])
         gear();
   translate([-56.5,0,0])
      rotate([0,0,rt])
         gear();
}
//Gear Parameters
//---------------------------------------------------------|
module gear(
//Gear Parameters
n_teeth=15, // n_teeth -> number of teeth
h_teeth=10,  // h_teeth -> height of teeth
a_teeth=30, // a_teeth -> angle of teeth 
d_gear=120, // d_gear  -> diameter of gear (external)
h_gear=12,  // h_gear  -> gear height
c_hole=4)   // d_hole  -> diamenter of the center hole(0=none)
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=h_gear,d=d_gear,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=h_gear+ac,d=d_gear-(h_teeth*2),center=true,$fn=60);
      dr=360/n_teeth;
      ss=d_gear*pi/(n_teeth*2);
      for(r=[0:dr:360-dr])
         rotate([0,0,r])
            translate([(d_gear/2)-h_teeth/2,0,0])
            {
               translate([0,0,0])
                  cube([h_teeth*2,ss/2,h_gear+ac],center=true);
               translate([0,(ss/4)-1,0])
                  rotate([0,0,a_teeth])
                     cube([h_teeth*4,ss/2,h_gear+ac],center=true);
               translate([0,-(ss/4)+1,0])
                  rotate([0,0,-a_teeth])
                     cube([h_teeth*4,ss/2,h_gear+ac],center=true);
            }      
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=12,d=103,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=12+ac,d=96,center=true,$fn=60);
   }
}
//---------------------------------------------------------|