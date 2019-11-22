
float x, y;

float cx, cy;
float angle = 0.0;
float radius = 200;
float stepA = 0.05;

void setup(){
  size(800,800);
  frameRate(30);
  
  cx = width/2;
  cy = height/2;
  
}


void draw(){
  
  background(255);
  
  x = cx + cos(angle)*radius;
  y = cy + sin(angle)*radius;
  
  fill(255); strokeWeight(1);
  ellipse(cx, cy, 2*radius, 2*radius);
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
  angle += stepA;
  
}
