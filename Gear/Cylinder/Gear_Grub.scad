/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|            Program Gear Grub - 2014/10/20                |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
// gear_grub();
//---------------------------------------------------------|
module gear_grub
(
  // grub parameters
  grub_height=15,    // height of gear
  grub_diameter=20, // diameter of grub
  hole_diameter=5,  // diameter of hole
  screw_diameter=3, // diameter of screw
  nut_height=2,     // height of nut 
  nut_diameter=6,   // diameter of nut
  nut_sides=6,      // sides of nut
  nut_channel=1     // nut channel 0=no, 1=yes
)
{
  grub_radius=grub_diameter/2;   // radius of grub
  hole_radius=hole_diameter/2;   // radius of hole
  nut_radius=nut_diameter/2;     // radius of nut
  screw_radius=screw_diameter/2; // radius of screw
   difference()
   {
      // grub base
      cylinder(grub_height,
               grub_radius,
               grub_radius,center=true,$fn=36);
      // shaft hole
      cylinder(grub_height+0.2,
               hole_radius,
               hole_radius,center=true,$fn=36);
      // screw hole
      translate([0,grub_radius,0]) rotate([90,0,0])
         cylinder(grub_radius+nut_height,
                  screw_radius,
                  screw_radius,center=true,$fn=36);
      // nut house
      translate([0,hole_radius,0]) rotate([90,0,0])
         cylinder((nut_height*2),
                  nut_radius,
                  nut_radius,center=true,$fn=6);
      // nut channel
      if(nut_channel)
         translate([0,hole_radius+nut_height/2,-grub_height/4])
            cube([nut_diameter,
                  nut_height,
                 (grub_height+0.2)/2],center=true);
   }
}
//---------------------------------------------------------|
