
float side = 700;
int num = 10;
float scaleFactor = 1.0;

void setup(){
  size(800,800);
  frameRate(12);
  background(255);
  noFill();
  strokeWeight(6);
  rectMode(CENTER);
}


void draw(){
  
  translate(width/2, height/2);
  scale(scaleFactor);
  rect(0,0, side, side);
  
  scaleFactor -= 0.05;
  
  if(scaleFactor<=0){
    scaleFactor = 1.0;
    stroke(random(255), random(255), random(255));
    background(255);
  }
  
}
