
float x, y;

float cx, cy;
float angle = 0.0;
float radiusH = 200;
float radiusV = 100;
float stepA = 0.05;

void setup(){
  size(800,800);
  frameRate(30);
  
  cx = width/2;
  cy = height/2;
  
}


void draw(){
  
  background(255);
  
  x = cx + cos(angle)*radiusH;
  y = cy + sin(angle)*radiusV;
  
  fill(255); strokeWeight(1);
  ellipse(cx, cy, 2*radiusH, 2*radiusV);
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
  angle += stepA;
  
}
