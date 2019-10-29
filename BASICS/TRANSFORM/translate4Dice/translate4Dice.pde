
float border = 200;
float radius = 100;

void setup(){
  
  size(800,800);
  smooth(16);
  background(255);
  fill(0);
  rectMode(CENTER);
  noLoop();
}


void draw(){
  
  translate(border,border);
  ellipse(0,0,radius,radius);
  
  translate(width - 2*border, 0);
  ellipse(0,0,radius,radius);
  
  
  translate(0, height-2*border);
  ellipse(0,0,radius,radius);
  
  translate(-height + 2*border, 0);
  ellipse(0,0,radius,radius);
  
}
