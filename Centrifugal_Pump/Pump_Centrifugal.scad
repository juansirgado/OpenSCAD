/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Centrifugal Pump - 2014/12/09           |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
pump();
//--------------------------------------------------------//
module pump()
{
   // pump motor sample and size
   translate([0,0,110]) motor();
   
   // pump cover
   translate([0,0,50]) cover();
   
   // pump rotor
   translate([0,0,35]) rotate([0,180,0]) rotor();

   // pump body
   translate([0,0,0]) rotate([0,0,-8]) body();
   
   // water input pit
   translate([0,0,-40]) in_pit();
   
   // water output pit
   translate([50,13.5,0]) rotate([0,90,8]) out_pit();
  
}
//--------------------------------------------------------//
module rotor()
{
   difference()
   {
      union()
      {
         translate([0,0,0]) 
            cylinder(5,15,15,center=true,$fn=60);
         translate([0,0,5]) 
            cylinder(5,5,2,center=true,$fn=60);
         for(z=[0:60:300])
         {
            rotate([0,0,z]) translate([10,0,5.5])
            difference()
            { 
               rotate([0,0,-18]) 
                  cube([12,2.5,10],center=true);
               translate([-6,0]) rotate([0,0,27]) 
                  cube([5,5,10.2],center=true);
               translate([6,0]) rotate([0,0,27]) 
                  cube([5,5,10.2],center=true);
            }
         }      
      }
      translate([0,0,5]) 
         cylinder(15.2,1,1,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module cover()
{
   difference()
   {
      union()
      {
         translate([0,0,0]) 
            cylinder(5,25,25,center=true,$fn=60);
        translate([0,0,15]) 
            motor_holder();
      }
      translate([0,0,0]) 
         cylinder(5.2,1,1,center=true,$fn=60);
      for(z=[0:60:300])
      {
         rotate([0,0,z]) translate([21,0,0]) 
            cylinder(5.2,2,2,center=true,$fn=60);
      }      
   }
}
//--------------------------------------------------------//
module body()
{
   difference()
   {
      union()
      {
         translate([0,0,0]) 
            cylinder(20,25,25,center=true,$fn=60);
      }
      translate([0,0,2.5]) 
         cylinder(15.2,17,17,center=true,$fn=60);
      difference()
      {
         translate([18,12,0]) rotate([0,90,16])  
            cylinder(25,5,5,center=true,$fn=60);
         translate([0,0,0]) 
            cylinder(15,16.8,16.8,center=true,$fn=60);
      }
      translate([25.5,14,0]) rotate([0,90,16])  
         cylinder(20.2,6.5,6.5,center=true,$fn=60);
      translate([0,0,-7.5]) 
         cylinder(5.2,5.5,5.5,center=true,$fn=60);
      for(z=[0:60:300])
      {
         rotate([0,0,z+6]) translate([21,0,0]) 
            cylinder(20.2,2,2,center=true,$fn=60);
      }      
   }
}
//--------------------------------------------------------//
module in_pit()
{
   difference()
   {
      union()
      {
         translate([0,0,0])  
            cylinder(30,5.5,5.5,center=true,$fn=60);
         translate([0,0,5])  
            cylinder(10,5,7.5,center=true,$fn=60);
      }
      translate([0,0,0])  
         cylinder(30.2,3.5,3.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module out_pit()
{
   difference()
   {
      union()
      {
         translate([0,0,0])  
            cylinder(30,5.5,5.5,center=true,$fn=60);
         translate([0,0,-10])  
            cylinder(10,6.5,6.5,center=true,$fn=60);
      }
      translate([0,0,0])  
         cylinder(30.2,3.5,3.5,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module motor()
{
   union()
   {
      cylinder(33,14,14,center=true,$fn=60);
      cylinder(37,5,5,center=true,$fn=60);
      translate([0,0,-10]) cylinder(60,1,1,center=true,$fn=60);
   }
}
//--------------------------------------------------------//
module motor_holder()
{
   union()
   {
      difference()
      {
         translate([0,0,0]) 
            cylinder(25,17,17,center=true,$fn=60);
         translate([0,0,0]) 
            cylinder(25.2,14,14,center=true,$fn=60);
         translate([0,0,0]) 
            cube([40,5,25.2],center=true);
      }
      difference()
      {
         translate([0,0,-10]) 
            cylinder(5,10,10,center=true,$fn=60);
         translate([0,0,-10]) 
            cylinder(5.2,6,6,center=true,$fn=60);
      }
   }
}
//--------------------------------------------------------//
