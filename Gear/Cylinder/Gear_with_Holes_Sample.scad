/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Gear External - 2014/10/20              |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
include <Gear_Cylinder_Tooth.scad>;
include <Gear_Grub.scad>;
gearwithholes();
//---------------------------------------------------------|
module gearwithholes() // base gear
{
   
   hole_size = 5;      // Diameter for hole 
   hole_angle = 45;    // Angle between holes
   hole_distance = 18; // Distance from gear center

   difference()
   {
      // Gear double helical
      translate([0,0,0]) gear_external(num_teeth=23,
                                       tooth_diameter=4,
                                       tooth_clear=0.15,
                                       tooth_deep=0.15,
                                       gear_height=10,
                                       hole_diameter=8);

      // Gear side holes
      for (r = [0:hole_angle:360-hole_angle]) // From 0 to 360 angle between holes
         rotate(r,0,0) 
            translate([0,hole_distance,0]) // Distance from gear center   
               cylinder(10.2,hole_size,hole_size,center=true,$fn=60); // Diameter for hole 

      // Gear side groove 
      translate([0,0,5]) // Up Z (gear_height / 2)
         difference()
         {
             cylinder(10,25,25,center=true,$fn=60);
             cylinder(10,11,11,center=true,$fn=60);
         }

      // Gear screw head 
      translate([0,0,3]) // Up Z ((gear size - screw head height) / 2)
             cylinder(4.2,7,7,center=true,$fn=6); // FN = Faces of head screw
   }
}
//---------------------------------------------------------|