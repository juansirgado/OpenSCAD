/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|          Program Gear External - 2019/05/08              |
|               All rights reserved 2019                   |
|---------------------------------------------------------*/
ac=0.2;
translate([-400,    0,0]) gear_01();
translate([-200,    0,0]) gear_02();
translate([   0,    0,0]) gear_03();
translate([ 200,    0,0]) gear_04();
translate([ 400,    0,0]) gear_05();
translate([-400,  200,0]) gear_06();
translate([-200,  200,0]) gear_07();
translate([   0,  200,0]) gear_08();
translate([ 200,  200,0]) gear_09();
translate([ 400,  200,0]) gear_10();
translate([-400,  400,0]) gear_11();
translate([-200,  400,0]) gear_12();
translate([   0,  400,0]) gear_13();
translate([ 200,  400,0]) gear_14();
translate([ 400,  400,0]) gear_15();
translate([-400,  600,0]) gear_16();
translate([-200,  600,0]) gear_17();
translate([   0,  600,0]) gear_18();
translate([ 200,  600,0]) gear_19();
translate([ 400,  600,0]) gear_20();
translate([-400,  800,0]) gear_21();
translate([-200,  800,0]) gear_22();
translate([   0,  800,0]) gear_23();
translate([ 200,  800,0]) gear_24();
translate([ 400,  800,0]) gear_25();
translate([-400, 1000,0]) gear_26();
translate([-200, 1000,0]) gear_27();
translate([   0, 1000,0]) gear_28();
translate([ 200, 1000,0]) gear_29();
translate([ 400, 1000,0]) gear_30();
translate([-400, 1200,0]) gear_31();
translate([-200, 1200,0]) gear_32();
translate([   0, 1200,0]) gear_33();
translate([ 200, 1200,0]) gear_34();
translate([ 400, 1200,0]) gear_35();
translate([-400, 1400,0]) gear_36();
translate([-200, 1400,0]) gear_37();
translate([   0, 1400,0]) gear_38();
translate([ 200, 1400,0]) gear_39();
translate([ 400, 1400,0]) gear_40();
translate([-400, 1600,0]) gear_41();
translate([-200, 1600,0]) gear_42();
translate([   0, 1600,0]) gear_43();
translate([ 200, 1600,0]) gear_44();
translate([ 400, 1600,0]) gear_45();
//---------------------------------------------------------|
module gear_01()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for(r=[0,120,240])
         rotate([0,0,r]) 
            translate([21.5,0,0])
               cylinder(h=10,d=50,center=true,$fn=60);
      for(r=[0,120,240])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=37.5,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_02()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for(r=[0:120:240])
         rotate([0,0,r]) 
            translate([21.5,0,0])
               cylinder(h=10,d=50,center=true,$fn=60);
      for(r=[0:120:240])
         rotate([0,0,r+30]) 
            translate([25.5,0,0])
               cylinder(h=10+ac,d=37.5,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_03()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:120:240])
            rotate([0,0,r]) 
               translate([21.5,0,0])
                  cube([50,10,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_04()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:90:270])
            rotate([0,0,r]) 
               translate([21.5,0,0])
                  cube([50,10,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_05()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:72:288])
            rotate([0,0,r]) 
               translate([21.5,0,0])
                  cube([50,10,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_06()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:120:240])
            rotate([0,0,r])
               translate([24,0,0])
                  rotate([0,0,20])
                     cube([50,10,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=30,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_07()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:90:270])
            rotate([0,0,r])
               translate([24,0,0])
                  rotate([0,0,20])
                     cube([50,10,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=30,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_08()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:72:288])
            rotate([0,0,r])
               translate([24,0,0])
                  rotate([0,0,20])
                     cube([50,10,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=30,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_09()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:90:270])
            rotate([0,0,r]) 
               translate([21.5,0,0])
                  cube([50,10,10],center=true);
         for(r=[0:90:270])
            rotate([0,0,r+10]) 
               translate([37.5,0,0])
                  cylinder(h=10,d=20,center=true,$fn=60);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_10()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:90:270])
            rotate([0,0,r]) 
               translate([21.5,0,0])
                  cube([50,10,10],center=true);
         for(r=[0:90:270])
            rotate([0,0,r+4]) 
               translate([40,0,0])
                  cylinder(h=10,d=15,center=true,$fn=60);
         for(r=[0:90:270])
            rotate([0,0,r-4]) 
               translate([40,0,0])
                  cylinder(h=10,d=15,center=true,$fn=60);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_11()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:45:315])
            rotate([0,0,r]) 
               translate([25,0,0])
                  cube([45,2.5,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_12()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      union()
      {
         for(r=[0:30:330])
            rotate([0,0,r]) 
               translate([25,0,0])
                  cube([45,2.5,10],center=true);
         translate([0,0,0])
            cylinder(h=10,d=20,center=true,$fn=60);
      }
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_13()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=80,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=70,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=60,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=50,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=40,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=30,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=20,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
   for(r=[0:90:270])
      rotate([0,0,r]) 
         translate([25,0,0])
            cube([45,5,10],center=true);
}
//---------------------------------------------------------|
module gear_14()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=80,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=70,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=60,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=50,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=40,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=30,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=20,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
   for(r=[0:180:180])
      rotate([0,0,r]) 
         translate([25,0,0])
            cube([45,5,10],center=true);
}
//---------------------------------------------------------|
module gear_15()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=60,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=50,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=20,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
   for(r=[0:120:240])
      rotate([0,0,r]) 
         translate([25,0,0])
            cube([45,5,10],center=true);
}
//---------------------------------------------------------|
module gear_16()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:180:180])
         rotate([0,0,r]) 
            translate([25,0,0])
               cylinder(h=10+ac,d=35,center=true,$fn=60);
      for(r=[0:180:180])
         rotate([0,0,r+90]) 
            translate([25,0,0])
               cylinder(h=10+ac,d=25,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_17()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:120:240])
         rotate([0,0,r]) 
            translate([25,0,0])
               cylinder(h=10+ac,d=35,center=true,$fn=60);
      for(r=[0:120:240])
         rotate([0,0,r+60]) 
            translate([35,0,0])
               cylinder(h=10+ac,d=15,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_18()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:90:270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=30,center=true,$fn=60);
      for(r=[0:90:270])
         rotate([0,0,r+45]) 
            translate([35,0,0])
               cylinder(h=10+ac,d=10,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_19()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:90:270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=30,center=true,$fn=6);
      for(r=[0:90:270])
         rotate([0,0,r+45]) 
            translate([35,0,0])
               cylinder(h=10+ac,d=10,center=true,$fn=6);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_20()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:90:270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=30,center=true,$fn=4);
      for(r=[0:90:270])
         rotate([0,0,r+45]) 
            translate([35,0,0])
               cylinder(h=10+ac,d=10,center=true,$fn=4);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_21()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:90:270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=30,center=true,$fn=3);
      for(r=[0:90:270])
         rotate([0,0,r+45]) 
            translate([35,0,0])
               cylinder(h=10+ac,d=10,center=true,$fn=3);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_22()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      for(r=[0:90:270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               rotate([0,0,180]) 
                  cylinder(h=10+ac,d=40,center=true,$fn=3);
      for(r=[0:90:270])
         rotate([0,0,r+45]) 
            translate([35,0,0])
               cylinder(h=10+ac,d=15,center=true,$fn=3);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_23()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
            cube([95,20,10],center=true);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_24()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cube([45,45,10],center=true);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
   for(r=[0:90:270])
      rotate([0,0,r]) 
         translate([30,0,0])
            cube([30,20,10],center=true);
}
//---------------------------------------------------------|
module gear_25()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      translate([0,0,0])
         cube([40,40,10],center=true);
      translate([0,0,0])
         cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
   for(r=[0:90:270])
      rotate([0,0,r+45]) 
         translate([35,0,0])
            rotate([0,0,45]) 
               cube([20,20,10],center=true);
}
//---------------------------------------------------------|
module gear_26()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1,0.9,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=29.5,center=true,$fn=60);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_27()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0-15,90-15,180-15,270-15])
         rotate([0,0,r])
            scale([1,0.9,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r]) 
            translate([27.5,0,0])
               cylinder(h=10+ac,d=31.5,center=true,$fn=60);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_28()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1,1.05,1])
                translate([21.5,10,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1.05,0.8,1])            
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=29.5,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1,1,1])            
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=29.5,center=true,$fn=60);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_29()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,45,90,135,180,225,270,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,45,90,135,180,225,270,315])
         rotate([0,0,r])
            scale([1.1,0.6,1])
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=26.5,center=true,$fn=60);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_30()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,45,90,135,180,225,270,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1.1,0.6,1])
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=26.5,center=true,$fn=60);
      for (r = [45,135,225,315])
         rotate([0,0,r])
            scale([1.5,1.1,1])
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=26.5,center=true,$fn=60);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_31()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,45,90,135,180,225,270,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1.1,0.6,1])
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=26.5,center=true,$fn=60);
      for (r = [45,135,225,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([27.5,0,0])
                   cube([30,7,10+ac],center=true);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_32()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,45,90,135,180,225,270,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1.1,0.6,1])
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=26.5,center=true,$fn=60);
      for (r = [45,135,225,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([36,0,0])
                   cube([9,15,10+ac],center=true);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_33()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   difference()
   {
      for (r = [0,45,90,135,180,225,270,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
      for (r = [0,90,180,270])
         rotate([0,0,r])
            scale([1.1,0.6,1])
                translate([27.5,0,0])
                   cylinder(h=10+ac,d=26.5,center=true,$fn=60);
      for (r = [45,135,225,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([36,0,0])
                   cube([9,15,10+ac],center=true);
      for (r = [45,135,225,315])
         rotate([0,0,r])
            scale([1,1,1])
                translate([27,0,0])
                   cube([27,3,10+ac],center=true);
      cylinder(h=10+ac,d=4,center=true,$fn=60);
   }
}
//---------------------------------------------------------|
module gear_34()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,90,180,270])
      rotate([0,0,r])
           difference()
           {
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10,d=50,center=true,$fn=60);
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10+ac,d=40,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_35()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,45,90,135,180,225,270,315])
      rotate([0,0,r])
           difference()
           {
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10,d=50,center=true,$fn=60);
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10+ac,d=40,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_36()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,22.5,45,67.5,90,110.5,135,157.5,180,202.5,225,247.5,270,292.5,315,337.5])
      rotate([0,0,r])
           difference()
           {
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10,d=50,center=true,$fn=60);
              scale([1,1,1])
                  translate([23,0,0])
                     cylinder(h=10+ac,d=45,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_37()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,22.5,45,67.5,90,110.5,135,157.5,180,202.5,225,247.5,270,292.5,315,337.5])
      rotate([0,0,r])
           difference()
           {
              scale([1,0.3,1])
                  translate([23,0,0])
                     cylinder(h=10,d=50,center=true,$fn=60);
              scale([1,0.3,1])
                  translate([23,0,0])
                     cylinder(h=10+ac,d=30,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_38()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,22.5,45,67.5,90,110.5,135,157.5,180,202.5,225,247.5,270,292.5,315,337.5])
      rotate([0,0,r])
           difference()
           {
              scale([1,0.3,1])
                  translate([23,0,0])
                     cylinder(h=10,d=50,center=true,$fn=60);
              scale([1,1,1])
                  translate([23,0,0])
                     cube([34,6,10+ac],center=true);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_39()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,22.5,45,67.5,90,110.5,135,157.5,180,202.5,225,247.5,270,292.5,315,337.5])
      rotate([0,0,r])
           difference()
           {
              scale([1,1,1])
                  translate([23,0,0])
                     cube([50,8,10],center=true);
              scale([1,0.1,1])
                  translate([25,0,0])
                     cylinder(h=10+ac,d=40,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_40()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,45,90,135,180,225,270,315])
      rotate([0,0,r])
           difference()
           {
              scale([1,1,1])
                  translate([23,0,0])
                     cube([50,22,10],center=true);
              scale([1,0.45,1])
                  translate([25,0,0])
                     cylinder(h=10+ac,d=40,center=true,$fn=60);
              cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_41()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,180])
      rotate([0,0,r])
           difference()
           {
             scale([1,1,1]) 
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
             scale([0.7,1,1]) 
                translate([29.5,0,0])
                   cylinder(h=10+ac,d=37.5,center=true,$fn=60);
             translate([0,0,0])
                cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_42()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,120,240])
      rotate([0,0,r])
           difference()
           {
             scale([1,1,1]) 
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
             scale([0.7,1,1]) 
                translate([29.5,0,0])
                   cylinder(h=10+ac,d=37.5,center=true,$fn=60);
             translate([0,0,0])
                cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_43()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,90,180,270])
      rotate([0,0,r])
           difference()
           {
             scale([1,1,1]) 
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
             scale([0.7,1,1]) 
                translate([29.5,0,0])
                   cylinder(h=10+ac,d=37.5,center=true,$fn=60);
             translate([0,0,0])
                cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_44()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,72,144,216,288])
      rotate([0,0,r])
           difference()
           {
             scale([1,1,1]) 
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
             scale([0.8,1,1]) 
                translate([29.5,0,0])
                   cylinder(h=10+ac,d=37.5,center=true,$fn=60);
             translate([0,0,0])
                cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
module gear_45()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=10,d=100,center=true,$fn=60);
      translate([0,0,0])
         cylinder(h=10+ac,d=90,center=true,$fn=60);
   }
   for (r = [0,90,135,180,270,315])
      rotate([0,0,r])
           difference()
           {
             scale([1,1,1]) 
                translate([21.5,0,0])
                   cylinder(h=10,d=50,center=true,$fn=60);
             scale([0.9,1,1]) 
                translate([29.5,0,0])
                   cylinder(h=10+ac,d=37.5,center=true,$fn=60);
             translate([0,0,0])
                cylinder(h=10+ac,d=4,center=true,$fn=60);
           }
}
//---------------------------------------------------------|
