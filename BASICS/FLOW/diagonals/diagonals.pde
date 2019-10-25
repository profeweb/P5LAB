void setup(){
  size(600,600);
  strokeWeight(3);
  
}

void draw(){
  background(255);
  for(int i=0; i<2*width; i+=10){
    line(i, 0, 0, i); 
  }
}
