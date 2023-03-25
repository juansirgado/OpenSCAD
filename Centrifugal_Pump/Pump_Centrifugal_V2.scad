/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Magnetic Pump - 2015/04/09              |
|               All rights reserved 2015                   |
|---------------------------------------------------------*/
rotate([90,0,0]) pump();
//--------------------------------------------------------//
// What you need:
// 8x neodimium magnets 5mm height 5mm diameter
//    for the magnetic couple
// 2x allen screws 45mm height 4mm diameter (pump) 
// 2x allen screws 50mm height 4mm diameter (pump+base)
// 2x allen screws 60mm height 4mm diameter (pump+motor)
//    to seal the pump, the motor holder and the pump base
//    all together
// 2x allen screws 10mm height 3mm diameter
//    for pump motor
// 1x flat head screws 10mm height 2mm diameter
//    for internal rotor shaft
// 1x motor 12v running counterclockwise with:
//    2x 3mm screws holes with 24mm distance
//    and 7mm diameter pinion
//    but You can change all  
// 1x PVC glue tube    
//--------------------------------------------------------//
module pump()
{
   // pump internal rotor
   translate([0,0,35]) rotate([0,180,0]) 
      color([0,1,1],.9) in_rotor();

   // pump external rotor
   translate([0,0,75]) rotate([0,0,0]) 
      color([1,1,0],.9) ex_rotor();

   // water input pit
   translate([0,0,-32]) rotate([0,0,0]) 
      color([0,1,0],.9) in_pit();
   
   // water output pit
   translate([50,-18,0]) rotate([0,90,-8]) 
      color([0,1,0],.9) out_pit();
  
   // motor holder
   translate([0,0,100]) rotate([0,0,90]) 
      color([1,0,1],.9) motor_holder();
   
   // motor sleeve
   for(y=[26,-26]) 
      rotate([0,0,90]) translate([0,y,77.5]) 
         color([1,0,1],.9) motor_sleeve();

   // pump motor
   translate([0,0,150]) rotate([0,0,0]) 
      color([1,1,1],.4) pump_motor();

   // pump base
   rotate([0,0,0])translate([0,-30,70])  
      color([1,1,1],.4) pump_base();

   // pump cover
   translate([0,0,55]) rotate([0,180,0]) 
      color([1,0,0],.4) pump_cover();

   // pump body
   translate([0,0,0]) rotate([0,0,0]) 
      color([0,0,1],.4) pump_body();
}
//--------------------------------------------------------//
module pump_cover()
{
   difference()
   {
      union()
      {
         // main cover
         translate([0,0,0]) 
            cylinder(5,30,30,center=true,$fn=60);
         // internal rotor shaft
         translate([0,0,5]) 
            cylinder(5,4,3,center=true,$fn=60);
      }
      // center hole
      translate([0,0,5]) 
         cylinder(5.2,1,1,center=true,$fn=60);
      // 6x screws holes
      for(z=[0:60:300])
      {
         rotate([0,0,z]) 
            translate([26,0,0]) 
               cylinder(5.2,2,2,center=true,$fn=60);
      }      
   }
}
//--------------------------------------------------------//
module pump_body()
{
   difference()
   {
      // main body
      translate([0,0,0]) 
         cylinder(25,30,30,center=true,$fn=60);
      // body chamber
      translate([0,0,2.5]) 
         cylinder(20.2,22,22,center=true,$fn=60);
      // in_pit central hole 
      translate([0,0,-10]) 
         cylinder(5.2,7.5,7.5,center=true,$fn=60);
      // 6x screws holes
      for(z=[0:60:300])
      {
         rotate([0,0,z]) translate([26,0,0])
            cylinder(25.2,2,2,center=true,$fn=60);
      }
      // out_pit lateral hole internal small
      translate([18,-12.8,0]) rotate([0,90,-16])  
         cylinder(25,5,5,center=true,$fn=60);
      // out_pit lateral hole external big
      translate([30,-16,0]) rotate([0,90,-16])  
         cylinder(20.2,6.5,6.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module in_rotor()
{
   difference()
   {
      union()
      {
         // internal rotor main base 
         translate([0,0,0]) 
            cylinder(5,20,20,center=true,$fn=60);
         // internal rotor shaft house 
         translate([0,0,5]) 
            cylinder(10,6,4,center=true,$fn=60);
         // rotor blades 
         translate([0,0,8]) rotor_blades();
      }
      // central shaft hole
      translate([0,0,5]) 
         cylinder(15.2,1,1,center=true,$fn=60);
      // bottom hole for shaft
      translate([0,0,0]) 
         cylinder(5.2,4,3,center=true,$fn=60);
      // 4x magnets holes
      for(r=[0:90:270])
         rotate([0,0,r])
            translate([12,0,0]) 
               cylinder(5.2,2.5,2.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module rotor_blades()
{
   // 6x internal rotor blades
   for(z=[0:60:300])
   {
      rotate([0,0,z]) 
         translate([-2,-10,0]) 
            single_blade();
   }
}
//--------------------------------------------------------//
module single_blade()
{
   difference()
   { 
      // main cylinder blade
      cylinder(15,10,10,center=true,$fn=60);
      // cut cylinder blade
      translate([13,0,0]) 
         cylinder(15.2,20,20,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module ex_rotor()
{
   difference()
   {
      union()
      {
         // external rotor main base 
         translate([0,0,0]) 
            cylinder(5,17.5,17.5,center=true,$fn=60);
         // external rotor shaft house 
         translate([0,0,5]) 
            cylinder(5,8,7,center=true,$fn=60);
      }
      // central shaft hole
      translate([0,0,2.5]) 
         cylinder(10.2,3,3,center=true,$fn=60);
      // 10x tooth central shaft hole
      for(r=[0:36:324])
         rotate([0,0,r])
            translate([3,0,2.5]) 
               cylinder(10.2,1.5,1.5,center=true,$fn=3);
      // 4x magnets holes
      for(r=[0:90:270])
         rotate([0,0,r])
            translate([12,0,0]) 
               cylinder(5.2,2.5,2.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module in_pit()
{
   difference()
   {
      union()
      {
         // main input pit
         translate([0,0,0])  
            cylinder(30,5.5,5.5,center=true,$fn=60);
         translate([0,0,5])  
            cylinder(10,5.5,10,center=true,$fn=60);
         translate([0,0,10])  
            cylinder(10,7.5,7.5,center=true,$fn=60);
      }
      // input pit hole
      translate([0,0,0])  
         cylinder(30.2,3.5,3.5,center=true,$fn=60);
      translate([0,0,10])  
         cylinder(10.2,3.5,5.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module out_pit()
{
   difference()
   {
      union()
      {
         // main output pit
         translate([0,0,0])  
            cylinder(30,5.5,5.5,center=true,$fn=60);
         translate([0,0,-10])  
            cylinder(10,6.5,6.5,center=true,$fn=60);
      }
      // output pit hole
      translate([0,0,0])  
         cylinder(30.2,3.5,3.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module motor_sleeve()
{
   difference()
   {
      // main motor sleeve
      cylinder(15,5,5,center=true,$fn=60);
      // motor sleeve screw hole
      cylinder(15.2,2,2,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module motor_holder()
{
   difference()
   {
      // 
      union()
      {
         // main frame motor holder
         translate([0,0,0]) 
            cylinder(5,17.5,17.5,center=true,$fn=60);
         // motor holder arms
         translate([0,0,0]) 
            cube([15,48,5],center=true);
         // motor holder arms edge
         for(y=[23.5,-23.5])
            translate([0,y,0]) 
               cylinder(5,7.5,7.5,center=true,$fn=60);
      }
      // motor house
      translate([0,0,0]) 
         cylinder(5.2,6.5,6.5,center=true,$fn=60);
      // pump screws holes
      for(y=[26,-26])
         translate([0,y,0]) 
            cylinder(5.2,2,2,center=true,$fn=60);
      // motor screws holes
      for(y=[12.5,-12.5]) 
         translate([0,y,0]) 
            cube([3,5,5.2],center=true);
      for(y=[15,10,-10,-15]) 
         translate([0,y,0]) 
            cylinder(5.2,1.5,1.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module pump_motor()
{
   union()
   {
      // main motor
      cylinder(33,17.5,17.5,center=true,$fn=60);
      // motor head
      cylinder(43,6.25,6.25,center=true,$fn=60);
      // motor shaft
      translate([0,0,-5]) 
         cylinder(60,1.5,1.5,center=true,$fn=60);
      // 10x tooth central shaft hole
      for(r=[0:36:324])
         rotate([0,0,r])
            translate([2,0,-29]) 
               cylinder(10.2,1.5,1.5,center=true,$fn=3);
   }
}
//--------------------------------------------------------//
module pump_base()
{
   difference()
   {
      union()
      {
         cube([60,5,15],center=true);
            intersection()
            {
               translate([0,7.5,-5]) 
                  cube([60,15,5],center=true);
               for(x=[13,-13])
               {
                  translate([x,-2,-5]) 
                     cylinder(5,16,16,center=true,$fn=60);
               }      
            }
      }
      for(x=[13,-13])
      {
         translate([x,7.5,0]) 
            cylinder(25.2,2,2,center=true,$fn=60);
      }      
      for(x=[20,0,-20])
      {
         translate([x,0,2.5]) rotate([90,0,0]) 
            cylinder(5.2,2,2,center=true,$fn=60);
      }      
   }
}
//--------------------------------------------------------//
