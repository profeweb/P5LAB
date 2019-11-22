
float x, y;
float cx, cy;
float angle = 0.0;
float radius = 0;
float stepA = 0.05;
float stepR = 1;

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
  
  drawSpiral(cx, cy, stepA, stepR);
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 30, 30);
  
  angle += stepA;
  radius += stepR;
  
}

void drawSpiral(float cx, float cy, float sA, float sR){
  
  float r = 0;
  float a = 0;
  
  float x0 = cx;
  float y0 = cy;
  
  while(r<width){
  
    float x  = cx + r*cos(a);
    float y  = cy + r*sin(a);
    
    strokeWeight(1);
    line(x0, y0, x, y);
    
    x0 = x; y0 = y;
    
    a+= sA;
    r+= sR;
  }
}
