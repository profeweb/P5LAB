void setup(){
  size(600,600);
  fill(0);
}

void draw(){
  background(255, 200, 0);
  rectMode(CENTER);  // CORNER
  for(int c=0; c<12; c++){
    for(int f=0; f<12; f++){
      int x = 20 + c*50;
      int y = 20 + f*50;
      ellipse(x, y, 20, 20);
    }
  }
}
