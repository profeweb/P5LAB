
float x, y;

float stepX = 1.0;

void setup(){
  size(800,800);
  frameRate(30);
  
  x = 0;
  y = height/2;
}


void draw(){
  
  background(255);
  
  x += stepX;
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
}
