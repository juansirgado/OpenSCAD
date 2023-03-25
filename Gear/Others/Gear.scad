/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|               Program Gear - 2014/04/10                  |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
gear();
//---------------------------------------------------------|
module gear
(
   // Gear parameters
   num_teeth = 45,  // Number of teeth
   gearHeight = 5, //Height of the gear    

   // Central Hole
   holes_num = 1,   // Central hole (1-Hole 0-No hole)
   hole_radius = 2, // Radius of central hole

   // Tooth parameters
   circ_pitch = false, // Circular pitch
   diam_pitch = .8,    // Diametral pitch
   pres_angle = 86,    // Pressure angle
   tooth_clear = .1    // Clearance
)
{
   difference() 
	{
   	linear_extrude(height = gearHeight, 
							center = false, 
							convexity = 10, 
							twist = 0) 
		{
         // Make the gear
      	make_gear(number_of_teeth = num_teeth,
        	          circular_pitch = circ_pitch,
        			    diametral_pitch = diam_pitch, 
        			    pressure_angle = pres_angle, 
        			    clearance = tooth_clear);
		}
		if (holes_num > 0) 
 	   {
      // Cut the central hole
      translate([0, 0, -.1]) 
         cylinder(r=hole_radius, h=gearHeight+.2, $fs=0.1);
   	}
   }
}
//---------------------------------------------------------|
module make_gear(number_of_teeth=20,
                 circular_pitch=false, 
                 diametral_pitch=false,
                 pressure_angle=20, 
                 clearance = 1)
{
  if (circular_pitch == false && diametral_pitch == false) 
     echo("ERROR: diametral_pitch and circular_pitch not valid");
  
  //Convert diametrial pitch to our native circular pitch
  circular_pitch = (circular_pitch != false ? circular_pitch : 180 / diametral_pitch);
  
  // Pitch diameter: Diameter of pitch circle.
  pitch_diameter  =  number_of_teeth * circular_pitch / 180;
  pitch_radius = pitch_diameter / 2;
  
  // Base Circle
  base_diameter = pitch_diameter * cos(pressure_angle);
  base_radius = base_diameter / 2;

  // Diametrial pitch: Number of teeth per unit length.
  pitch_diametrial = number_of_teeth / pitch_diameter;

  // Addendum: Radial distance from pitch circle to outside circle.
  addendum = 1.4 / pitch_diametrial;
  
  //Outer Circle
  outer_radius = pitch_radius + addendum;
  outer_diameter = outer_radius * 2;
  
  // Dedendum: Radial distance from pitch circle to root diameter
  dedendum = addendum + clearance;

  // Root diameter: Diameter of bottom of tooth spaces.
  root_radius = pitch_radius - dedendum;
  root_diameter = root_radius * 2;
  
  half_thick_angle = 360 / (4 * number_of_teeth);
  
  union() {
    rotate(half_thick_angle)
      circle($fn=number_of_teeth * 2, r=root_radius * 1.001);
    
    for (i = [1 : number_of_teeth]) 
    {  //for (i = [0])
      rotate([0,0, i * 360 / number_of_teeth]) 
      {
        involute_gear_tooth(pitch_radius = pitch_radius,
                            root_radius = root_radius,
                            base_radius = base_radius,
                            outer_radius = outer_radius,
                            half_thick_angle = half_thick_angle);
      } // end of rotate
    } // end of for
  } // end of union
}
//---------------------------------------------------------|
module involute_gear_tooth(pitch_radius,
                           root_radius,
                           base_radius,
                           outer_radius,
                           half_thick_angle)
{
   pitch_to_base_angle  = involute_intersect_angle( base_radius, pitch_radius );
   outer_to_base_angle = involute_intersect_angle( base_radius, outer_radius );
   
   base1 = 0 - pitch_to_base_angle - half_thick_angle;
   pitch1 = 0 - half_thick_angle;
   outer1 = outer_to_base_angle - pitch_to_base_angle - half_thick_angle;
   
   b1 = polar_to_cartesian([ base1, base_radius ]);
   p1 = polar_to_cartesian([ pitch1, pitch_radius ]);
   o1 = polar_to_cartesian([ outer1, outer_radius ]);
   
   b2 = polar_to_cartesian([ -base1, base_radius ]);
   p2 = polar_to_cartesian([ -pitch1, pitch_radius ]);
   o2 = polar_to_cartesian([ -outer1, outer_radius ]);
   
   pitch_to_root_angle = pitch_to_base_angle - 
                         involute_intersect_angle(base_radius, root_radius );

   // set up values for ( root_radius > base_radius ) case
   root1 = pitch1 - pitch_to_root_angle;   

   r1_t =  polar_to_cartesian([ root1, root_radius ]);
   r2_t =  polar_to_cartesian([ -root1, root_radius ]);
  
   // set up values for ( else ) case
   r1_f =  polar_to_cartesian([ base1, root_radius ]);
   r2_f =  polar_to_cartesian([ -base1, root_radius ]);
  
   if (root_radius > base_radius) 
   {
      polygon( points = [b1, r1_t, p1, o1, o2, p2, r2_t, b2], convexity = 3);
   } 
   else 
   {
      polygon( points = [r1_f, b1, p1, o1, o2, p2, b2, r2_f], convexity = 3);
   }
}
//---------------------------------------------------------|
// Finds the angle of the involute about the base radius 
// at the given distance (radius) from its center
function involute_intersect_angle(base_radius, radius) = 
   sqrt( pow(radius/base_radius,2) - 1);
//---------------------------------------------------------|
// Polar coord [angle, radius] to cartesian coord [x,y]
function polar_to_cartesian(polar) =
   [polar[1]*cos(polar[0]),polar[1]*sin(polar[0])];
//---------------------------------------------------------|
