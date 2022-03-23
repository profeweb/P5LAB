import processing.serial.*;
import cc.arduino.*;
import controlP5.*;

float rotX, rotY, transX, transY, scaleFactor; 

float offset = PI/24.0;

PShape L1, L2,L3,L4,base; 

ControlP5 controlP5;
ControlP5 MyController;
Arduino arduino;

int right_link = 90;
int left_link= 0;

void setup() 

{ 
  
size(1300,700, P3D); 

  smooth();
  frameRate(30);  
  
  MyController = new ControlP5(this);
    
  MyController.addSlider("X_Rotation",0,6.28,20,700,20,200,30);
  MyController.addSlider("Y_Rotation",0,6.28,20,700,70,200,30);
  MyController.addSlider("Z_Rotation",0,6.28,20,700,120,200,30);

        L1 = loadShape("linkone.obj");
        L2= loadShape("linktwo.obj");
        L3= loadShape("linkthree.obj");
        L4= loadShape("linkfour.obj");
        base =loadShape("base.obj");

  arduino = new Arduino(this, "/dev/ttyACM0", 57600);
  for (int i = 0; i <= 13; i++)
  arduino.pinMode(i, Arduino.OUTPUT);
  controlP5 = new ControlP5(this);

              controlP5.addSlider("right_link")
               .setPosition(10,10)
               .setSize(200,40)
               .setRange(0,180)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(57,173,56))
               .setColorForeground(color(200,200,200))  
               .setColorBackground(color(0,255,0))               
               ; 
               
              controlP5.addSlider("left_link")
               .setPosition(10,70)
               .setSize(200,40)
               .setRange(0,180)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(73,175,175))
               .setColorForeground(color(200,200,200))
               .setColorBackground(color(0,255,255))
               ;
     
} 

float X_Rotation = 0;
float Y_Rotation = 0;
float Z_Rotation = 0;

void draw() 
{ 
  
lights(); 
background(255,255,255);

              pushMatrix();    
            translate(420, 550);
            rotateY(X_Rotation);  
            rotateX(Y_Rotation);
            rotateZ(Z_Rotation);
            drawBaseFixed();             
              popMatrix();
      
 arduino.analogWrite(8, right_link);  
 arduino.analogWrite(9, left_link);
  delay(0); 
  
}

void drawBaseFixed()
{
  drawLinkBase();
}

  void drawLinkBase()
{ 
              pushMatrix(); 
          translate(0,110,0);
          rotateX(radians(90));
          scale(0.75);
          shape(base);  
              popMatrix();    
         
             pushMatrix();             
         rotateX(radians(-90));
         rotateY(radians(right_link));      
         translate(0,0,0);   
         scale(0.75);
         shape(L1);  
         translate(300,0,0);
         rotateY(radians(-90));
         rotateY(radians(left_link)+radians(0));  
         rotateY(radians(-right_link)+radians(90));       
         shape(L3);     
             popMatrix();          
      
              pushMatrix();             
         translate(0,0,0);   
         rotateX(radians(270));
         rotateY(radians(left_link));      
         scale(0.75);
         shape(L2);   
         translate(300,0,0);
         rotateY(radians(90));
         rotateY(radians(-left_link));  
         rotateY(radians(right_link)+radians(-90));
         shape(L4);     
              popMatrix(); 
}