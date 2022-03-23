import processing.serial.*;
import controlP5.*;

float rotX, rotY, transX, transY, scaleFactor; 

float offset = PI/24.0;

PShape L1, L2,L3,L4,base; 

ControlP5 controlP5;
int front_right_link = 0;
int front_left_link= 0;
int back_right_link = 0;
int back_left_link= 0;


void setup() 
{ 
  
size(1300,700, P3D); 

  smooth();
  frameRate(30);  
for (int i = 0; i <= 13; i++)
  controlP5 = new ControlP5(this);

              controlP5.addSlider("front_right_link")
               .setPosition(10,10)
               .setSize(200,40)
               .setRange(0,50)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(57,173,56))
               .setColorForeground(color(200,200,200))  
               .setColorBackground(color(0,255,0))               
               ; 
               
              controlP5.addSlider("front_left_link")
               .setPosition(10,70)
               .setSize(200,40)
               .setRange(0,50)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(73,175,175))
               .setColorForeground(color(200,200,200))
               .setColorBackground(color(0,255,255))
               ;
               
                controlP5.addSlider("back_right_link")
               .setPosition(300,10)
               .setSize(200,40)
               .setRange(0,50)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(57,173,56))
               .setColorForeground(color(200,200,200))  
               .setColorBackground(color(0,255,0))               
               ; 
               
              controlP5.addSlider("back_left_link")
               .setPosition(300,70)
               .setSize(200,40)
               .setRange(0,50)
               .setColorValue(color(0))
               .setColorLabel(0)
               .setColorActive(color(73,175,175))
               .setColorForeground(color(200,200,200))
               .setColorBackground(color(0,255,255))
               ;
     
} 

void draw() 
{ 
  
lights(); 
background(255,255,255);
              pushMatrix();    
            translate(700, 300); 
            drawBaseFixed(); 
              popMatrix(); 
  delay(0); 
               
}

void drawBaseFixed()
{
  //tail starts here
  pushMatrix();
        rotateZ(radians(-back_right_link));
        fill(210,72,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,100,20);
        translate(100,10,0);
        ellipse(0,0,20,20);
        
        rotateZ(radians((back_left_link)*0.625));
        rotateZ(radians((back_right_link)));
        rotateZ(radians(11.5));
        fill(210,72,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,150,20);
        translate(150,10,0);
        ellipse(0,0,20,20);
        
  popMatrix();
  
    pushMatrix();
        translate(0,60,0);
        rotateZ(radians(back_left_link));
        fill(210,72,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,100,20);
        translate(100,10,0);
        ellipse(0,0,20,20);
        
        rotateZ(radians((-back_right_link)*0.625));  
        rotateZ(radians(-back_left_link));
        rotateZ(radians(-11.5));
        fill(210,72,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,150,20);
        translate(150,10,0);
        ellipse(0,0,20,20);      
   
  popMatrix();
  
  //final tail begins
  pushMatrix();
        rotateZ(radians((-back_right_link)/2));  
        rotateZ(radians((back_left_link)/2));
        rotateZ(radians(5));
        translate(150,-10,0);
        fill(255,0,255);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,250,20);
        translate(250,10,0);
        ellipse(0,0,20,20);  
  popMatrix();
  
    pushMatrix();
        rotateZ(radians((back_left_link)/2));  
        rotateZ(radians((-back_right_link)/2));
        rotateZ(radians(-5));
        translate(150,65,0);
        fill(255,0,255);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,250,20);
        translate(250,10,0);
        ellipse(0,0,20,20);  
    popMatrix();
  //tail ends here
  
  //head starts here
pushMatrix();
    translate(-350,0,0);
    pushMatrix();
        rotateZ(radians(front_right_link));
        fill(255,255,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,-100,20);
        translate(-100,10,0);
        ellipse(0,0,20,20);
        
        rotateZ(radians((-front_left_link)*0.75));
        rotateZ(radians((-front_right_link)));
        rotateZ(radians(-14));
        fill(255,255,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,-125,20);
        translate(-125,10,0);
        ellipse(0,0,20,20);
        
  popMatrix();
  
    pushMatrix();
        translate(0,60,0);
        rotateZ(radians(-front_left_link));
        fill(255,255,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,-100,20);
        translate(-100,10,0);
        ellipse(0,0,20,20);
        
        rotateZ(radians((front_right_link)*0.75));  
        rotateZ(radians(front_left_link));
        rotateZ(radians(14));
        fill(255,255,0);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,-125,20);
        translate(-125,10,0);
        ellipse(0,0,20,20);
    popMatrix();
popMatrix();
  //head ends here
  
  //body begins here
  //left body
  pushMatrix();
        translate(-350,0,0);
        rotateZ(radians((front_right_link)/2));  
        rotateZ(radians((back_right_link)/2));
        rotateZ(radians(166));
        fill(0,255,255);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,-175,20);
        translate(-175,10,0);
        ellipse(0,0,20,20);
        translate(87.5,10,0);
        rotateZ(radians(-90));
        rect(0,0,-87.5,20);
        translate(-87.5,0,0);
        rotateZ(radians(-45));
        rect(0,0,-87.5,20);
  popMatrix();
  
    pushMatrix();
        translate(-350,60,0);
        rotateZ(radians((-back_left_link)/2));  
        rotateZ(radians((-front_left_link)/2));
        rotateZ(radians(194));
        fill(0,255,255);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,-175,20);
        translate(-175,10,0);
        ellipse(0,0,20,20);
        translate(87.5,10,0);
        rotateZ(radians(90));
        rect(0,0,-107.5,20);
        translate(-87.5,7,0);
        rotateZ(radians(45));
        rect(0,0,-87.5,20);
  popMatrix();
  
  //right body
    pushMatrix();
        rotateZ(radians((-back_right_link/2)));  
        rotateZ(radians(-front_right_link/2));
        rotateZ(radians(194));
        fill(0,0,255);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,175,20);
        translate(175,10,0);
        ellipse(0,0,20,20); 
        translate(-87.5,0,0);
        rotateZ(radians(-90));
        rect(0,0,-87.5,20);
        translate(-75,7,0);
        rotateZ(radians(45));
        rect(0,0,-87.5,20);
    popMatrix(); 
    
    pushMatrix();   
        translate(0,60,0);
        rotateZ(radians((front_left_link/2)));  
        rotateZ(radians(back_left_link/2));
        rotateZ(radians(166));
        fill(0,0,255);
        ellipse(0,0,20,20);
        translate(-3,-10,0);
        rect(0,0,175,20);
        translate(175,10,0);
        ellipse(0,0,20,20);   
        translate(-87.5,10,0);
        rotateZ(radians(90));
        rect(0,0,-107.5,20);
        translate(-100,0,0);
        rotateZ(radians(-45));
        rect(0,0,-87.5,20);
     popMatrix();
}