void setup(){
  size(600,600);
  strokeWeight(3);
  rectMode(CENTER);
}

void draw(){
  background(255);
  for(int r=width-10; r>0; r-=20){
    rect(width/2, height/2, r, r); 
  }
}
