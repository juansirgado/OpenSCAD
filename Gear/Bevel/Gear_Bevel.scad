/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|      Program Gear Bevel Cylinder Tooth - 2014/10/08      |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
gears_sample();
//---------------------------------------------------------|
module gears_sample()
{

   // Sample for bevel gear external with 16 teeth
   translate([0,0,-10]) rotate([0,0,0]) 
      gear_bevel_ext(
                     num_teeth=10,         // number of teeth
                     tooth_diameter=3,     //tooth diameter
                     angle_inclination=45, //angle of inclination
                     tooth_clear=0.15,     // tooth clear
                     tooth_deep=0.15,      // tooth deep
                     gear_height=10,       // gear height
                     hole_diameter=2       // diameter of central hole
   );
//---------------------------------------------------------|
   // Sample for bevel gear internal with 16 teeth
   translate([30,0,0]) rotate([0,-90,0]) 
      gear_bevel_int(
                     num_teeth=30,         // number of teeth
                     tooth_diameter=2,     // tooth diameter
                     angle_inclination=45, //angle of inclination
                     tooth_clear=0.15,     // tooth clear
                     tooth_deep=0.15,      // tooth deep
                     gear_height=10,       // gear height
                     gear_diameter=10,     // gear diameter
                     num_hole=4,           // number fix holes
                     hole_diameter=2       // fix hole diameter
   );
}
//---------------------------------------------------------|
module gear_bevel_ext
(
  // gear parameters
  num_teeth=15,         // number of teeth
  tooth_diameter=3,     //tooth diameter
  angle_inclination=45, //angle of inclination
  tooth_clear=0.15,     // tooth clear
  tooth_deep=0.15,      // tooth deep
  gear_height=10,        // gear height
  // fix hole parameters
  hole_diameter=2       // diameter of central hole
)
{
   // gear values
   tooth_radius = tooth_diameter/2;                 // tooth radius
   hole_radius = hole_diameter/2;                   // hole radius
   tooth_distance = tooth_diameter+tooth_clear;     // tooth distance
   gear_radius=(tooth_distance*num_teeth)/3.141592; // gear ray
   tooth_angle=360/num_teeth;                       // tooth rotation
   tooth_end=361-tooth_angle;   // (+1 round error) // tooth end
   cylinder_faces=60;                               // cylinder faces
   // bevel values
   angle_inclination=angle_inclination*(-1);           //angle of inclination
   gear_base = (gear_height/2)*tan(angle_inclination);
	gear_radius_top = gear_radius-gear_base;
	gear_radius_bottom = gear_radius+gear_base;
   tooth_base = (gear_base/num_teeth)*2.5;
   tooth_radius_top = tooth_radius-tooth_base;         // tooth radius
   tooth_radius_bottom = tooth_radius+tooth_base;      // tooth radius
   // gear rendering
   difference()
   {
      union()
      {
         cylinder(gear_height,
                  gear_radius_top,
                  gear_radius_bottom,center=true,$fn=cylinder_faces);
         for(gear_angle=[0:tooth_angle:tooth_end])
         {
            rotate([0,0,gear_angle]) translate([gear_radius,0,0])
            {
               rotate([0,angle_inclination,0])
               cylinder(gear_height*2.5,
                        tooth_radius_top,
                        tooth_radius_bottom,center=true,$fn=cylinder_faces);
            }
         }
      }
      for(gear_angle=[0:tooth_angle:tooth_end])
      {
         rotate([0,0,gear_angle+(tooth_angle/2)]) 
            {
            translate([gear_radius-tooth_deep,0,0])
               rotate([0,angle_inclination,0])
               cylinder(gear_height*2,
                        tooth_radius_top+tooth_clear,
                        tooth_radius_bottom+tooth_clear,center=true,$fn=cylinder_faces);
            }
      }
      // central hole 
      cylinder(gear_height+0.2,
               hole_radius, 
               hole_radius,center=true,$fn=cylinder_faces);
      // top cut 
      translate([0,0,gear_height])
         cylinder(gear_height,
               gear_radius*2, 
               gear_radius*2,center=true,$fn=6);
      // bottom cut 
      translate([0,0,-gear_height])
         cylinder(gear_height,
               gear_radius*3, 
               gear_radius*3,center=true,$fn=6);

      // bottom cut 
      difference()
      {
      translate([0,0,])
         cylinder(gear_height+0.2,
                  gear_radius*2, 
                  gear_radius*2,center=true,$fn=60);
      translate([0,0,])
         cylinder(gear_height+0.4,
                  gear_radius*1.1, 
                  gear_radius*1.1,center=true,$fn=60);
      }
   }
}
//---------------------------------------------------------|
module gear_bevel_int
(
  // gear parameters
  num_teeth=60,         // number of teeth
  tooth_diameter=2,     // tooth diameter
  angle_inclination=45, //angle of inclination
  tooth_clear=0.15,     // tooth clear
  tooth_deep=0.15,      // tooth deep
  gear_height=10,        // gear height
  gear_diameter=12,     // gear diameter
  // fix hole parameters
  num_hole=4,           // number of holes
  hole_diameter=2       // hole diameter
)
{
   // gear values
   tooth_distance = tooth_diameter+tooth_clear;     // tooth distance
   gear_radius=(tooth_distance*num_teeth)/3.141592; // gear ray
   tooth_angle=360/num_teeth;                       // tooth rotation
   tooth_end=361-tooth_angle;   // (+1 round error) // tooth end
   tooth_radius=tooth_diameter/2;                   // tooth ray
   hole_angle=360/num_hole;                         // hole rotation
   hole_end=361-hole_angle;     // (+1 round error) // hole end
   cylinder_faces=60;                               // cylinder faces
   // bevel values
   angle_inclination=angle_inclination*(1);            //angle of inclination
   gear_base = (gear_height/2)*tan(angle_inclination);
	gear_radius_top = gear_radius-gear_base;
	gear_radius_bottom = gear_radius+gear_base;
   tooth_base = (gear_base/num_teeth)*2.225;
   tooth_radius_top = tooth_radius-tooth_base;         // tooth radius
   tooth_radius_bottom = tooth_radius+tooth_base;      // tooth radius
   // gear rendering
   difference()
   {
      union()
      {
         difference()
         {
            cylinder(gear_height,
                     gear_radius+gear_diameter,
                     gear_radius+gear_diameter,center=true,$fn=cylinder_faces);
            cylinder(gear_height+0.2,
                     gear_radius_top,
                     gear_radius_bottom,center=true,$fn=cylinder_faces);
         } 
         for(gear_angle=[0:tooth_angle:tooth_end])
         {
            rotate([0,0,gear_angle]) translate([gear_radius,0,0])
            {
               rotate([0,angle_inclination,0])
               cylinder(gear_height*2,
                        tooth_radius_top,
                        tooth_radius_bottom,center=true,$fn=cylinder_faces);
            }
         }
      }
      for(gear_angle=[0:tooth_angle:tooth_end])
      {
         rotate([0,0,gear_angle+(tooth_angle/2)]) 
            {
            translate([gear_radius+tooth_deep,0,0])
               rotate([0,angle_inclination,0])
               cylinder(gear_height*2,
                        tooth_radius_top+tooth_clear,
                        tooth_radius_bottom+tooth_clear,center=true,$fn=cylinder_faces);
            }
      }
      // lateral holes 
      for(gear_angle=[0:hole_angle:hole_end]) // holes
      {
         rotate([0,0,gear_angle]) 
         {
            translate([gear_radius_bottom+(gear_diameter/2),0,0]) 
            cylinder(gear_height+0.2,
                     hole_diameter, 
                     hole_diameter,center=true,$fn=cylinder_faces);
         }
      }
      // top cut 
      translate([0,0,gear_height])
         cylinder(gear_height,
                  gear_radius+gear_diameter+0.2, 
                  gear_radius+gear_diameter+0.2,center=true,$fn=cylinder_faces);
      // top cut 
      translate([0,0,-gear_height])
         cylinder(gear_height,
                  gear_radius+gear_diameter+0.2, 
                  gear_radius+gear_diameter+0.2,center=true,$fn=cylinder_faces);
   }
}
//---------------------------------------------------------|
