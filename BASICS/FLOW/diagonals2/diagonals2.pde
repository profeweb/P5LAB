void setup(){
  size(600,600);
  strokeWeight(3);
  
}

void draw(){
  background(255);
  for(int i=width, j=0; i>-width; i-=10, j+=10){
    line(i, 0, width, j); 
  }
}
