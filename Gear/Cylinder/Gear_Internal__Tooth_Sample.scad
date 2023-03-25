/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Gear_internal - 2014/10/20              |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
include <Gear_Cylinder_Tooth.scad>;
include <Gear_Grub.scad>;
gearwithholes();
//---------------------------------------------------------|
module gearwithholes() // base gear
{
   // Gear internal tooth
   translate([0,0,0]) gear_internal(num_teeth=40,
                                    tooth_diameter=2,  
                                    tooth_clear=0.15,
                                    tooth_deep=0.15, 
                                    gear_height=5,   
                                    gear_diameter=10,      
                                    num_hole=4,       
                                    hole_diameter=2);
}
//---------------------------------------------------------|