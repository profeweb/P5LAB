void setup(){
  size(600,600);
  strokeWeight(3);
  
}

void draw(){
  background(255);
  for(int r=width-10; r>0; r-=20){
    ellipse(width/2, height/2, r, r); 
  }
}
