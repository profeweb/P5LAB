
float x, y;

float startX, startY;
float stopX, stopY;

float step = 0.01;
float p = 0.0;

void setup(){
  size(800,800);
  frameRate(30);
  
  startX = 100; startY = 100;
  stopX  = 700; stopY  = 700;
}


void draw(){
  
  background(255);
  
  fill(0);
  ellipse(startX, startY, 10, 10);
  ellipse(stopX, stopY, 10, 10);
  line(startX, startY, stopX, stopY);
  
  x = startX + (stopX - startX)*p;
  y = startY + (stopY - startY)*p;
  
  fill(255,0,0); strokeWeight(4);
  ellipse(x, y, 80, 80);
  
  if(p<=1){
    p+=step;
  }
  
}
