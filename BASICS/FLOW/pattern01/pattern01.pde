void setup(){
  size(600,600);
  fill(0);
}

void draw(){
  background(255, 200, 0);
  for(int i=20; i<width; i+=50){
    for(int j=20; j<height; j+=50){
      ellipse(i, j, 20, 20);
    }
  }
}
