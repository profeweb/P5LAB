
//Spiral variables
float a=0;
float aStep = 1.5;
float s = 10;

// Rects variables
float r=1;
int rStep=1;

// Stairs variables
float ss=1;
float sStep=0.1;

// Triangles Variables
float ts=1;
float tStep=0.5;

// SPIRAL, RECT, STAIRS, TRIANGLES, ...
String drawMode = "SPIRAL";

void setup() { 
 size(1000, 1000);
 colorMode(HSB, 500, 1, 1);
 rectMode(CENTER);
 background(0,0,1);
}

void draw() { 
 if(drawMode=="SPIRAL"){
   drawSpiral();
 } else if(drawMode=="RECT"){
   drawRect();
 } else if(drawMode=="STAIRS"){
   drawStairs();
 }
 else if(drawMode=="TRIANGLES"){
   drawTriangles();
 }
}

void drawTriangles(){
 translate(width/2,height/2);
 ts+=tStep;
 scale(ts, ts);
 strokeWeight(1.0/ts);
 noFill();
 triangle(0,-10, -10, 10, 10, 10);
}

void drawSpiral(){
 noStroke();
 translate(width/2,height/2);
 a+= aStep;
 rotate(a);
 translate(a%width, 1);
 fill(a%width,1,1,100);
 ellipse(0,0,s,s);
}

void drawRect(){
 a+=aStep; r+= rStep;
 strokeWeight(1);
 translate(width/2,height/2);
 scale(r, r);
 rotate(a);
 noFill();
 stroke(a%255,1,1,100);
 strokeWeight(1/r);
 rect(0,0,10,10);
}

void drawStairs(){
 translate(width/2,height/2);
 ss-= sStep;
 scale(ss,ss);
 noFill();
 stroke(0);
 rect(0,0,width,height);
}

void keyPressed(){
  setShape();
}

void setShape(){
 if(key=='E' || key=='e'){
   drawMode="SPIRAL";
   a=0;
   background(0,0,1);
 }
 else if(key=='R' || key=='r'){
   drawMode="RECT";
   r=1;
   background(0,0,1);
 }
 else if(key=='S' || key=='s'){
   drawMode="STAIRS";
   ss=1; strokeWeight(25);
   background(0,0,1);
 }
 else if(key=='T' || key=='t'){
   drawMode="TRIANGLES";
   ts=1; strokeWeight(1); stroke(0);
   background(0,0,1);
 }
}
