
float x, y;

float stepY = 5.0;

void setup(){
  size(800,800);
  frameRate(30);
  
  y = 0;
  x = width/2;
}


void draw(){
  
  background(255);
  
  y += stepY;
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
  if(y>height){
    y = 0;
  }
}
