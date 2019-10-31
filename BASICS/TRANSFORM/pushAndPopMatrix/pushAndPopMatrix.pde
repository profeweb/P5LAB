
float w = 300;
float h = 300;
int num = 3;

void setup(){
  
  size(800,800);
  background(255);
  noFill();
  strokeWeight(6);
  strokeJoin(ROUND);
  rectMode(CENTER);
  
}


void draw(){
  
  background(255);
  
  translate(width/2, height/2);
  
  fill(255,100,30);
  triangle(0, -h, -w, 0, w,0);
  
  float mirrorY = map(mouseY, 0, height, 0.001, 1);
  
  scale(1, -mirrorY);
  
  fill(100, 255, 30);
  triangle(0, -h, -w, 0, w,0);
  
  
}
