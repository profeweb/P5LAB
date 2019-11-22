
float x, y;
float step = 5.0;

void setup(){
  size(800,800);
  frameRate(30);
  
  x = width/2;
  y = height/2;
  
}


void draw(){
  
  background(255);
  
  x += random(-step, step);
  y += random(-step, step);
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
}
