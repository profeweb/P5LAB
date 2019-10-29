
int num = 15;

void setup(){
  
  size(800,800);
  smooth(16);
  background(255);
  strokeWeight(6);
  rectMode(CENTER);
  noLoop();
}


void draw(){
  
  translate(50, height/2);
  
  for(float i=0; i<num; i++){
    rect(0,0, 20,200);
    translate(50,0);
  }
  
}
