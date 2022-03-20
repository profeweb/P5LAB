import processing.serial.*;
import cc.arduino.*;
import controlP5.*;

import processing.video.*;
Capture cam;

ControlP5 controlP5;
Arduino arduino;
int Servo_Motor_1 = 0;

PImage img;

void setup()
{
  size(1300,700);
  smooth();
  frameRate(30);    
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
  arduino = new Arduino(this, "/dev/ttyACM0", 57600);
for (int i = 0; i <= 13; i++)
arduino.pinMode(i, Arduino.OUTPUT);
controlP5 = new ControlP5(this);
    controlP5.addSlider("Servo_Motor_1")
     .setPosition(10,10)
     .setSize(200,40)
     .setRange(0,90)
                   .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(1,129,92))
               .setColorForeground(color(79,178,147))  
               .setColorBackground(color(0,255,180))    
               .setValue(90)
               //.setNumberOfTickMarks(5)
     ; 
}
void draw()
{
  background(255);  
  pushMatrix();    
  translate(300, 100); // place robot so arms are always on screen
  drawLinkOne();  
  drawLinkThree();
  popMatrix();
  arduino.analogWrite(9, Servo_Motor_1);   
  delay(0); 
}


void drawLinkOne()//green
{        
      if (cam.available() == true) {
    cam.read();
  }
  image(cam, 500, 100,500,350); 
  
  //firstlink
  noStroke();
  fill(0, 255, 180);//pale green
  pushMatrix();
  translate(0,0);
  rotate(radians(90));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,60);
  ellipse(0, 0, 20, 20);
  ellipse(0, 60, 20, 20);
  drawLinkTwo();
  popMatrix(); 
}

  void drawLinkTwo()//red
{   
  //secondlink  
 pushMatrix();
  noStroke();
  fill(255, 0, 0);//red
  translate(0,65);  
  rotate(radians(-180));
   rotate(radians(Servo_Motor_1));
  rect(-10,0,20,80);
  ellipse(0, 0, 20, 20);
  ellipse(0, 80, 20, 20);
  popMatrix();  
}

 void drawLinkThree()//blue
 
 {   
  //thirdlink  
   pushMatrix();
  noStroke();
  fill(0, 0, 255);//blue
  translate(70,0);  
  rotate(radians(90));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,60);
  ellipse(0, 0, 20, 20);
  ellipse(0, 60, 20, 20);  
  drawstepone();
    popMatrix(); 
       
    
      //fourthlink  
   pushMatrix();
  noStroke();
  fill(255,255,0);//yellow
  translate(120,0);  
  rotate(radians(90));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstepthree();
    popMatrix();    
    
}

void drawstepone()
{   
          //fifthlink

  fill(0,168,255);//skyblue
   pushMatrix(); 
  translate(0,65);  
  rotate(radians(180));
  rotate(radians(Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawsteptwo();
    popMatrix();  
}

void drawsteptwo()
{   
          //fifthlink  
     fill(2, 82 ,124);//grey blue
   pushMatrix();
  translate(0,100);  
  rotate(radians(180));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,80);
  ellipse(0, 0, 20, 20);
  ellipse(0, 80, 20, 20);  
  drawstepfourone();
    popMatrix();  
}

void drawstepthree()
{
           fill(255,94,0);//florezent orange       
   pushMatrix();
  translate(0,100);  
  rotate(radians(180));
  rotate(radians(Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstepthreetwo();
    popMatrix();
}

void drawstepthreetwo()
{
       fill(35,116,40);//dark grey green
   pushMatrix();
  translate(0,100);  
  rotate(radians(180));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstepfiveone();
    popMatrix();
}

void drawstepfourone()
{
fill(3,255,17);//florezent green
   pushMatrix();
  translate(0,80);  
  rotate(radians(-180));
  rotate(radians(Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstepfivetwo();
    popMatrix();
}

void drawstepfiveone()
{
  fill(84,0,103);//dark magenta
   pushMatrix();
  translate(0,100);  
  rotate(radians(-180));
  rotate(radians(Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
    drawstepsixone();
    popMatrix();
}

void drawstepfivetwo()
{
fill(207,0,255);//magenta
   pushMatrix();
  translate(0,100);  
  rotate(radians(180));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstepsixtwo();
    popMatrix();
}

void drawstepsixone()
{
  fill(18,85,33);//green
   pushMatrix();
  translate(0,100);  
  rotate(radians(180));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstep7one();
    popMatrix();
}

void drawstepsixtwo()
{
fill(15,191,54);//lighterthanabove
   pushMatrix();
  translate(0,100);  
  rotate(radians(-180));
  rotate(radians(Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
  drawstep7two();
    popMatrix();
}


void drawstep7one()
{
  fill(100,0,183);//pinkishblue
     pushMatrix();
  translate(0,100);  
  rotate(radians(-180));
  rotate(radians(Servo_Motor_1));
  rect(-10,0,20,100);
  ellipse(0, 0, 20, 20);
  ellipse(0, 100, 20, 20);  
    popMatrix();
}

void drawstep7two()
{
fill(151,97,196);//lighterthanabove
   pushMatrix();
  translate(0,100);  
  rotate(radians(180));
  rotate(radians(-Servo_Motor_1));
  rect(-10,0,20,50);
  ellipse(0, 0, 20, 20);
  ellipse(0, 50, 20, 20);  
    popMatrix();
}
