/*---------------------------------------------------------\
|    From: Ekobots Innovation Ltda - www.ekobots.com.br    |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|            Program Snake Charger - 2015/08/07            |
|                All rights reserved 2015                  |
|---------------------------------------------------------*/
// Common values:
ch=15;   // central hole radius;
wh=2;    // wire radius holes;
ac=0.2;  // adjust for cuts;
fn=36;   // object resolution;
//---------------------------------------------------------|
// Balljoin values:
jh=22.5; // ball joint height;
js=45;   // ball joint size;
jr=30;   // ball joint radius;
// ball joint type(circular or triangular);
jt=0;    // 0=triangular, 1=circular;
jc=0.5;  // ball joint cut adjust(gap);
//---------------------------------------------------------|
// Head(tip) values:
th=30;   // tip height;
t1=22.5; // tip bottom radius;
t2=22.5; // tip top radius;
tb=2;    // tip border radius;
//---------------------------------------------------------|
// Body(centers) values:
n1=30;   // body neck bottom radius;  
n2=20;   // body neck top radius;  
nh=30;   // body neck heigth;  
//---------------------------------------------------------|
// Tail(base) values:
bh=10;   // base height;
bs=100;  // base size;
//---------------------------------------------------------|
// Snake pieces to draw:
sp=0;    // 0=all; 1=head; 2=body; 3=tail;
// Size of the snake body:
sb=1;    // number of snakebody to draw;
// Distance between pieces:
ds=56;   // milimeters for pieces displacement;
// Draw the object:
snakecharger();
// Draw the object cuted:
// snakecharger_half();
//---------------------------------------------------------|
module snakecharger()
{
   if((sp==0)||(sp==1))
      translate([0,0,ds*sb]) 
         snakehead();
   if((sp==0)||(sp==2))
      for(z=[1:ds:ds*sb])
         translate([0,0,z-1]) 
            snakebody();
   if((sp==0)||(sp==3))
      translate([0,0,-ds]) 
         snaketail();
}
//---------------------------------------------------------|
module snakecharger_half()
{
   difference()
   {
      // snake charger
      translate([0,0,0]) 
         snakecharger();
      // half cut snake charger
      translate([100,0,100]) 
         cube([200,200,2000],center=true);
   }
}
//---------------------------------------------------------|
module snakehead()
{
   union()
   {
      difference()
      {
         // tip cylinder
         translate([0,0,((th+jh)/2)-(10+tb)]) 
            cylind8r(h=th+tb,d1=t1*2,d2=t2*2,r=2,center=true,fn=fn);   
         // tip base cut
         translate([0,0,-jh/2]) 
            cylinder(h=jh,r=t1+ac,center=true,$fn=fn);   
         // center hole
         translate([0,0,((th+jh)/2)-(10+tb)]) 
            cylinder(h=th+tb+ac,r=ch,center=true,$fn=fn);   
      }
      // snake body joint(triangue)
      translate([0,0,-jh/2]) 
         snakejoint();
   }
}
//---------------------------------------------------------|
module snakebody()
{
   difference()
   {
      union()
      {
         // ball joint
         translate([0,0,jr]) 
            snakeball();
         // body neck
         translate([0,0,nh/2]) 
            cylinder(h=nh,r1=n1,r2=n2,center=true,$fn=fn);   
         // snake body joint(triangue)
         translate([0,0,-jh/2]) 
            snakejoint();
      }
      // center hole
      translate([0,0,nh/2]) 
         cylinder(h=nh+ac,r=ch,center=true,$fn=fn);   
   }
}
//---------------------------------------------------------|
module snaketail()
{
   difference()
   {
      union()
      {
         // base cube
         translate([bs/15,0,-bh/2]) 
            cub8([bs-5,bs,bh],r=1,center=true,fn=fn);
         // base neck
         translate([0,0,jr/2]) 
            cylinder(h=jr,r=jr,center=true,$fn=fn);   
         // ball joint
         translate([0,0,jr]) 
            snakeball();
      }
      // center hole
      translate([0,0,(jr/2)-(bh/2)]) 
         cylinder(h=bh+jr+ac,r=ch,center=true,$fn=fn);   
      // 3x wires holes
      for(r=[120:120:360])
         rotate([0,0,r])
            translate([js,0,-bh/2]) 
               cylinder(h=bh+ac,r=wh,center=true,$fn=fn);   
      // 4x screw fix holes
      for(x=[((bs/2)+(bs/15))-7.5,((-bs/2)-(bs/15))+21])
         for(y=[(bs/2)-5,(-bs/2)+5])
            translate([x,y,-bh/2]) 
               cylinder(h=bh+ac,r=1.5,center=true,$fn=fn);   
   }
}
//---------------------------------------------------------|
module snakeball()
{
   difference()
   {
      // ball joint sphere 
      translate([0,0,0]) 
         sphere(r=jr,center=true,$fn=fn);
      // ball joint border hole 
      translate([0,0,jr/1.5]) 
         cylinder(h=jr/2,r1=jr/2,r2=jr,center=true,$fn=fn);   
      // center hole
      translate([0,0,0]) 
         cylinder(h=(jr*2)+ac,r=ch,center=true,$fn=fn);   
   }
}
//---------------------------------------------------------|
module snakejoint()
{
   difference()
   {
      union()
      {
         // center base
         translate([0,0,0]) 
            cylinder(h=jh,r=js/1.5,center=true,$fn=fn);
         // base type circular or trianglular
         if(jt==0)
         {
            // 3x base walls
            for(r=[120:120:360])
               rotate([0,0,r+60])
                  translate([sqrt(js*js)-(js/2),0,0]) 
                     cub8([js/2,js*1.75,jh],r=1,center=true,fn=fn);
         }
         else
         {
            // circular base 
            translate([0,0,0]) 
                cylind8r(h=jh,d1=js*2,d2=js*2,r=1,center=true,fn=fn); 
         }
         // 3x corner cylinder
         for(r=[120:120:360])
            rotate([0,0,r])
               translate([js,0,0]) 
                  cylind8r(h=jh,d1=js/2,d2=js/2,r=1,center=true,fn=fn); 
      }
      // center hole
      translate([0,0,10]) 
         cylinder(h=jh+ac,r=ch,center=true,$fn=fn);   
      // body ball joint hole
      translate([0,0,-jr/2]) 
         sphere(r=jr+jc,center=true,$fn=fn);   
      // 3x wires holes
      for(r=[120:120:360])
         rotate([0,0,r])
            translate([js,0,0])
            {      
               translate([0,4,0])
                  cylinder(h=jh+ac,r=wh,center=true,$fn=fn);
               translate([0,-4,0])
                  cylinder(h=jh+ac,r=wh,center=true,$fn=fn);
            }

   }
}
//---------------------------------------------------------|
module cylind8r(h,d1,d2,r,center,fn)
{
   // rounded corners cylinder
   pi = 3.1415926535897932384626433832795028841971693993751;
   c1 = pi*d1;
   c2 = pi*d2;
   h1 = c1/fn;
   h2 = c2/fn;
   union() 
   {
      cylinder(h=h,d1=d1-(r*2),d2=d2-(r*2),center=center,$fn=fn);
      cylinder(h=h-(r*2),d1=d1,d2=d2,center=center,$fn=fn);
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d1/2)-r,0,(-h/2)+r]) 
               rotate([90,0,0])
                  cylinder(h=h1,r1=r,r2=r,
                           center=center,$fn=fn);
      }
      for(z=[0:360/fn:360-(360/fn)]) 
      {
         rotate([0,0,z+(360/fn)/2]) 
            translate([(d2/2)-r,0,(h/2)-r]) 
               rotate([90,0,0]) 
                  cylinder(h=h2,r1=r,r2=r,
                           center=center,$fn=fn);
      }
   }
}
//---------------------------------------------------------|
module cub8(xyz,r,center,fn)
{
   // original cube
   //%cube(xyz,center=true);
   // rounded corners cube
   union() 
   {
      cube([xyz[0]-(r*2),xyz[1]-(r*2),xyz[2]],center=center);
      cube([xyz[0]-(r*2),xyz[1],xyz[2]-(r*2)],center=center);
      cube([xyz[0],xyz[1]-(r*2),xyz[2]-(r*2)],center=center);
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
      {
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
         {
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
            translate([x,y,z])
               sphere(r=r,center=center,$fn=fn);
            }
         }
      }
      for(x=[0]) 
      {
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
         {
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
            translate([x,y,z]) rotate([0,90,0])
               cylinder(h=xyz[0]-(r*2),
                        r1=r,r2=r,center=center,$fn=fn);
            }
         }
      }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
      {
         for(y=[0]) 
         {
            for(z=[(xyz[2]/-2)+r,(xyz[2]/2)-r]) 
            {
            translate([x,y,z]) rotate([90,0,0])
               cylinder(h=xyz[1]-(r*2),
                        r1=r,r2=r,center=center,$fn=fn);
            }
         }
      }
      for(x=[(xyz[0]/-2)+r,(xyz[0]/2)-r]) 
      {
         for(y=[(xyz[1]/-2)+r,(xyz[1]/2)-r]) 
         {
            for(z=[0]) 
            {
            translate([x,y,z]) rotate([0,0,0])
               cylinder(h=xyz[2]-(r*2),
                        r1=r,r2=r,center=center,$fn=fn);
            }
         }
      }
   }
}
//---------------------------------------------------------|
