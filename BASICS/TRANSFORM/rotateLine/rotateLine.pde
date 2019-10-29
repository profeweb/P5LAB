
int num = 16;

void setup(){
  
  size(800,800);
  smooth(16);
  background(255);
  strokeWeight(6);
  strokeCap(ROUND);
  
  noLoop();
}


void draw(){
  
  translate(width/2, height/2);
  
  for(float i=0; i<num; i++){
    line(0,0, 0, height/4);
    rotate(TWO_PI/num);
  }
  
}
