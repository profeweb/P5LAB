void setup(){
  size(800, 800);
  stroke(0); noFill();
}

void draw(){
  background(255);
  cercleAnidat(width/2, height/2, 500);
}

void cercleAnidat(int x, int y, int n){
  ellipse(x, y, n, n);
  if(n>10){
    cercleAnidat(x, y, n-10);
  }
}
