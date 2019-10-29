
int num = 13;

void setup(){
  
  size(800,800);
  smooth(16);
  background(255);
  strokeWeight(6);
  rectMode(CENTER);
  noLoop();
}


void draw(){
  
  translate(100,100);
  
  for(float i=0; i<num; i++){
    fill(random(255), random(255), random(255));
    rect(0,0, 100,100);
    translate(50,50);
  }
  
}
