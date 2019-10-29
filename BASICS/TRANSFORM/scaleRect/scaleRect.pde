
float side = 700;
int num = 10;

void setup(){
  
  size(800,800);
  background(255);
  noFill();
  strokeWeight(6);
  rectMode(CENTER);
  
  noLoop();
}


void draw(){
  
  translate(width/2, height/2);
  
  for(int i=0; i<num; i++){
    rect(0,0, side, side);
    scale(0.85);
    
  }
  
}
