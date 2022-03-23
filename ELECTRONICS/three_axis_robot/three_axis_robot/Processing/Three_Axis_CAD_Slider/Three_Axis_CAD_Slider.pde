import processing.serial.*;
import cc.arduino.*;
import controlP5.*;

float rotX, rotY, transX, transY, scaleFactor; 

float offset = PI/24.0;

PShape base, body,shouldercylinder,arm; 

ControlP5 controlP5;
ControlP5 MyController;
Arduino arduino;

int Base = 0;
int Shoulder= 0;
int Arm= 0;

void setup() 

{ 
size(1300,700, P3D); 

  smooth();
  frameRate(30);  
  
  MyController = new ControlP5(this);
    
  MyController.addSlider("X_Rotation",0,6.28,20,700,20,200,30);
  MyController.addSlider("Y_Rotation",0,6.28,20,700,70,200,30);
  MyController.addSlider("Z_Rotation",0,6.28,20,700,120,200,30);

body = loadShape("body.obj");
base = loadShape("base.obj");
shouldercylinder = loadShape("shouldercylinder.obj");
arm = loadShape("arm.obj");

  arduino = new Arduino(this, "/dev/ttyACM0", 57600);
for (int i = 0; i <= 13; i++)
arduino.pinMode(i, Arduino.OUTPUT);
controlP5 = new ControlP5(this);
    controlP5.addSlider("Base")
     .setPosition(10,10)
     .setSize(200,40)
     .setRange(0,180)
               .setColorValue(color(0))
               .setColorLabel(0)
            .setColorActive(color(219,217,60))
              .setColorForeground(color(200,200,200))
                .setColorBackground(color(255, 255, 0))
                
     ; 
     
    controlP5.addSlider("Shoulder")
     .setPosition(10,70)
     .setSize(200,40)
     .setRange(0,180)
                    .setColorValue(color(0))
               .setColorLabel(0)
            .setColorActive(color(113,211,58))
              .setColorForeground(color(200,200,200))
                .setColorBackground(color(0, 255, 0))
     ; 
     
    controlP5.addSlider("Arm")
     .setPosition(10,130)
     .setSize(200,40)
     .setRange(0,180)
                         .setColorValue(color(0))
               .setColorLabel(0)
            .setColorActive(color(252,149,84))
              .setColorForeground(color(200,200,200))
                .setColorBackground(color(255,100, 0))
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
  translate(320, 550); 
  rotateY(X_Rotation);  
  rotateX(Y_Rotation);
  rotateZ(Z_Rotation);
  drawBaseFixed(); 
  popMatrix();
      
  arduino.analogWrite(8, Base);  
  arduino.analogWrite(9, Shoulder);  
  arduino.analogWrite(10, Arm);  
  delay(0); 
}

void drawBaseFixed()
{

  drawLinkBase();
}


  void drawLinkBase()
{ 
  pushMatrix(); 
    translate(0,0,0);  
        scale(0.12);
       shape(base);       
  popMatrix();   
  
     pushMatrix();   
     
     rotateY(radians(Base)); 
     translate(0,0,0);   
     scale(0.12);
     shape(body);    
     
     translate(0,-500,0);
     rotateZ(radians(-Shoulder)+radians(-90));      
     shape(shouldercylinder);     
   
     translate(0,825,200);
     rotateZ(radians(-Arm));      
     shape(arm);   
     
     popMatrix();         
}