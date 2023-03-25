/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|       Program Gear Trapezoidal Tooth - 2019/05/08        |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
ac=0.2;
fn=60;
// n_teeh  -> number of teeth
// h_teeth -> height of teeth
// d_gear  -> diameter of gear (external)
// h_gear  -> gear height
// d_hole  -> diamenter of the center hole(0=none)
gear();
//---------------------------------------------------------|
module gear(n_teeh=10,
            h_teeth=5,
            d_gear=100,
            h_gear=20,
            c_hole=4);
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=h_gear,d=d_gear,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=h_gear+ac,d=d_gear-h_teeth,center=true,$fn=60);
   }
   cube([50,10,10],center=true);
}
//---------------------------------------------------------|