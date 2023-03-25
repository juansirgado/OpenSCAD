/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|            Program Polia Lisa - 2019/05/15               |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
ac=0.2;
fn=60;
!polia();
eixo();
//---------------------------------------------------------|
module polia()
{
   difference()
   {
      union()
      {
         translate([0,0,0])
            cylinder(h=12,d=16,center=true,$fn=60);
         translate([0,0,0])
            cylinder(h=8,d1=20,d2=0,center=true,$fn=60);
         translate([0,0,0])
            cylinder(h=8,d1=0,d2=20,center=true,$fn=60);
         translate([0,0,5])
            cylinder(h=2,d=20,center=true,$fn=60);
         translate([0,0,-5])
            cylinder(h=2,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=12+ac,d=4,center=true,$fn=60);
   }

}
//---------------------------------------------------------|
module eixo()
{
   translate([16,0,0])
      cylinder(h=12+ac,d=3,center=true,$fn=60);
}
//---------------------------------------------------------|