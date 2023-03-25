/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|        Program Sanguinololu Case - 2015/08/03            |
|               All rights reserved 2015                   |
|---------------------------------------------------------*/
sanguinololu_case();
//---------------------------------------------------------|
// Sanguinololu board size in milimeters
b = [[0,0],[0,50],[100,0],[100,50]];
// Sanguinololu holes position
h = [[46.5,21.5],[46.5,-21.5],[-46.5,21.5],[-46.5,-21.5]]; 
// Sanguinololu cover/box parameters
r1 = 1.5; // Hole cover/board screw radius
r2 = 2;   // Hole fan/fix screw radius
w = 5;    // Box walls thickness
t = 40;   // Box height without cover and cable fix
f = 1;    // Fan size(0=40mm or 1=60mm)
p = 1;    // Cover lateral protection
l = 2.5;  // Lateral hole position
//---------------------------------------------------------|
module sanguinololu_case()
{
   translate([0,0, 30]) 
      rotate([180,0,0]) sanguinololu_case_cover();
//   translate([0,0,  0]) sanguinololu_board_sample();
   translate([0,0,  0]) sanguinololu_case_house();
   translate([0,0,-30]) sanguinololu_cable_fix();
}
//---------------------------------------------------------|

module sanguinololu_case_cover()
{
   difference()
   {
      union()
      {
         // case cover
         translate([0,0,0]) 
            cube([120,70,w],center=true);
         if(p==1)
         {
            // 12v power + hot end power + bed power hole
//          translate([-57.5,-2.5,w+5]) 
//             cube([w,37.5,t-20],center=true);
            // hot end termistor + bed termistor
//          translate([57.5,-1.5,w+5]) 
//             cube([w,30,t-20],center=true);
            // motors + motors power
            translate([2.5,-32.5,w+5]) 
               cube([72.5,w,t-20],center=true);
            // USB + motors end stops
            translate([-15,32.5,w+5]) 
               cube([47.5,w,t-20],center=true);
         }
      }
      // p4 hole
      translate([-47.5,10,0]) 
         cube([15,12,w+0.2],center=true);
      // panel hole
      translate([35,20,0]) 
         cube([25,8.,w+0.2],center=true);
      // p2 hole
      translate([45,-10,0]) 
         cube([7.5,25,w+0.2],center=true);
      // cover screw holes
      for(x=[55,-55])
         for(y=[30,-30])
            translate([x,y,0]) 
               cylinder(h=w+0.2,r=r1,center=true,$fn=60);
      if(f==0)
      {
         // fan central hole
         translate([-7.5,0,0])
            cylinder(h=w+0.2,r=18.75,center=true,$fn=60);
         // fan screw holes
         for(x=[16.25,-16.25])
            for(y=[16.25,-16.25])
               translate([x-7.5,y,0])
                  cylinder(h=w+0.2,r=r2,center=true,$fn=60);
      }
      else if(f==1)
      { 
         // fan central hole
         translate([-7.5,0,0])
            cylinder(h=w+0.2,r=27.5,center=true,$fn=60);
         // fan screw holes
         for(x=[25,-25])
            for(y=[25,-25])
               translate([x-7.5,y,0])
                  cylinder(h=w+0.2,r=r2,center=true,$fn=60);
      }
   }
}
//---------------------------------------------------------|
module sanguinololu_case_house()
{   
   difference()
   {
      union()
      {
         difference()
         {
            translate([0,0,0]) cube([120,70,t],center=true);
            translate([0,0,w]) cube([120-w*2,70-w*2,t],center=true);
         }
         // cover screw supports
         for(x=[55,-55])
            for(y=[30,-30])
               translate([x,y,0]) 
                  cylinder(h=t,r=4,center=true,$fn=60);
         // board supports
         for(x=[46.5,-46.5])
            for(y=[21.5,-21.5])
               translate([x,y,(w/2)+5-(t/2)])
                  cylinder(h=5,r=5,center=true,$fn=60);
         // lateral box fix support
         for(x=[50,-50])
            for(y=[w-33.5,33.5-w])
               translate([x,y,0])
                  cube([10,w,t],center=true);
      }
      // cover screw holes
      for(x=[55,-55])
         for(y=[30,-30])
            translate([x,y,0]) 
               cylinder(h=t+0.2,r=r1,center=true,$fn=60);
      // board holes
      for(x=[46.5,-46.5])
         for(y=[21.5,-21.5])
            translate([x,y,((w+5)/2)-(t/2)])
               cylinder(h=w+5.2,r=r1,center=true,$fn=60);
      // lateral box fix screw holes
      for(x=[50,-50])
         for(y=[w-35,35-w])
            translate([x,y,l])
               rotate([90,0,0])
                  cylinder(h=(w*2)+0.2,r=r2,center=true,$fn=60);
      // 12v power + hot end power + bed power hole
      translate([-57.5,2.5,w+5]) 
         cube([w+0.2,40,t+0.2],center=true);
      // hot end termistor + bed termistor
      translate([57.5,1.5,w+5]) 
         cube([w+0.2,32.5,t+0.2],center=true);
      // motors + motors power
      translate([2.5,32.5,w+5]) 
         cube([75,w+0.2,t+0.2],center=true);
      // USB + motors end stops
      translate([-15,-32.5,w+5]) 
         cube([50,w+0.2,t+0.2],center=true);
   }
}
//---------------------------------------------------------|
module sanguinololu_cable_fix()
{   
   difference()
   {
      translate([0,0,0]) 
         cube([120,70,5],center=true);
      translate([0,0,0]) 
         cube([100,50,5.2],center=true);
      // cover screw holes
      for(x=[55,-55])
         for(y=[30,-30])
            translate([x,y,0]) 
               cylinder(h=t+0.2,r=r1,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module sanguinololu_board_sample()
{
   difference()
   {
      union()
      {
         // board
         translate([0,0,0]) cube([100,50,12.5],center=true);
      }
      // board holes
      for(x=[46.5,-46.5])
         for(y=[21.5,-21.5])
            translate([x,y,0])
               cylinder(h=12.7,r=1.5,center=true,$fn=60);
   }
}
//---------------------------------------------------------|