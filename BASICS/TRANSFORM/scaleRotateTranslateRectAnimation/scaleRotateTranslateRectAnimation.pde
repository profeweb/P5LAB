
float side = 100;

float scaleFactor = 1.0;
float rotateAngle = 0.0;
float stepX = 0.0;
float stepY = 0.0;

void setup(){
  size(800,800);
  frameRate(12);
  background(255);
  noFill();
  strokeWeight(6);
  rectMode(CENTER);
}


void draw(){
  
  translate(stepX, stepY);
  scale(scaleFactor);
  rotate(rotateAngle);
  rect(0,0, side, side);
  
  scaleFactor -= 0.05;
  rotateAngle += 0.5;
  stepX += 10;
  stepY += 10;
  
}
