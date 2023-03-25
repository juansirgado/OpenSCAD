/*---------------------------------------------------------\
|    From: Ekobots Innovation Ltda - www.ekobots.com.br    |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|             Program Rack Parts - 2019/05/09              |
|                All rights reserved 2019                  |
|---------------------------------------------------------*/
// Common values:
ac=0.2;    // adjust for cuts;
fn=360;   // object resolution;
part_001();
//---------------------------------------------------------|
module part_001()
{
   difference()
   {
      translate([0,0,0])
         cylinder(h=20,d1=50,d2=40,center=true,$fn=fn);
      translate([0,0,0])
         cylinder(h=20+ac,d=6,center=true,$fn=fn);
      translate([0,0,7.5])
         cylinder(h=10+ac,d=15,center=true,$fn=fn);
   }
}
//---------------------------------------------------------|
module part_002()
{
      translate([0,0,0])
         cube([(nx*15)+20,(ny*15)+20,5],center=true,fn=fn);
      for(x=[-(nx*15)/2:15:(nx*15)/2])
         for(y=[-(ny/2)*15:15:(ny/2)*15])
            translate([x,y,2.5])
               sphere(d=10+ac,center=true,$fn=fn);
}
//---------------------------------------------------------|