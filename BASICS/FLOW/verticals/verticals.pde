void setup(){
  size(800,800);
  strokeWeight(3);
  background(255);
}

void draw(){
  for(int i=0; i<width; i+=10){
    line(i, 0, i, height); 
  }
}
