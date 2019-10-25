void setup(){
  size(600,600);
  strokeWeight(3);
  background(255);
}

void draw(){
  for(int i=0; i<height; i+=10){
    line(0, i, width, i); 
  }
}
