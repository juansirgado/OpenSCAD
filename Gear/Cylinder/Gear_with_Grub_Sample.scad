/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Gear external - 2014/10/20              |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
include <Gear_Cylinder_Tooth.scad>;
include <Gear_Grub.scad>;
rotate([0,0,0]) gearwithgrub();
//---------------------------------------------------------|
module gearwithgrub() // motor gear
{
   union()
   {
      // Translate gear_external Z = (gear_height / 2) Up
      translate([0,0,5]) gear_external(num_teeth=12,
                                       tooth_diameter=2,
                                       tooth_clear=0.15,
                                       tooth_deep=0.15,
                                       gear_height=10,
                                       hole_diameter=5);
      // Translate gear_grub Z = (grub_height / 2)*(-1) Down
      translate([0,0,-5]) gear_grub(grub_height=10,
                                    grub_diameter=20,
                                    hole_diameter=5,
                                    screw_diameter=3,
                                    nut_height=2,
                                    nut_diameter=6,
                                    nut_sides=6,
                                    nut_channel=1);
   }
}
//---------------------------------------------------------|
