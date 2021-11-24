void setup(){
  size(1400, 800);
  stroke(0); noFill();
}

void draw(){
  background(255);
  cercleSatelit(width/2, height/2, 300);
}

void cercleSatelit(int x, int y, int n){
  ellipse(x, y, n, n);
  if(n>10){
    cercleSatelit(x - n, y, n/2);
    cercleSatelit(x + n, y, n/2);
    cercleSatelit(x, y-n, n/2);
    cercleSatelit(x, y+n, n/2);
  }
}
