
float x, y;
float xBase, yBase;

float amplitude = 200;
float angle = 0.0;
float stepA = 0.05;
float stepX = 1;

void setup(){
  size(800,800);
  frameRate(30);
  
  xBase = 0;
  yBase = height/2;
  
  x = xBase;
  y = yBase;
}


void draw(){
  
  background(255);
  
  drawWave(yBase, amplitude, stepA, stepX);
  
  x += stepX;
  y = yBase + sin(angle)*amplitude;
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
  angle += stepA;
  
}

void drawWave(float yB, float amp, float sa, float sx){
  
  float x0 = xBase;
  float y0 = yBase;
  float a = 0;
  
  for(int x = 0; x <width; x+= sx){
    float y = yB + sin(a)*amp;
    strokeWeight(1);
    line(x0, y0, x, y);
    a += sa;
    
    x0 =x; y0 = y;
  }
}
