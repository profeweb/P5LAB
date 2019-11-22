
float x, y;

float cx, cy;
float angle = 0.0;
float radius = 10;
float step = 0.5;

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
  
  drawSpiral(cx, cy, step);
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 30, 30);
  
  angle += step;
  radius += step;
  
}

void drawSpiral(float cx, float cy, float s){
  
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
    
    a+= s;
    r+= s;
  }
}
