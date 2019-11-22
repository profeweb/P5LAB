
float x, y;
float xBase, yBase;

float amplitude = 200;
float angle = 0.0;
float stepA = 0.05;

void setup(){
  size(800,800);
  frameRate(30);
  
  xBase = width/2;
  yBase = height/2;
  
  x = xBase;
  y = yBase;
}


void draw(){
  
  background(255);
  
  y = yBase + sin(angle)*amplitude;
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
  angle += stepA;
  
}
