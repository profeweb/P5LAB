void setup(){
  size(800, 800);
  stroke(0); noFill();
  rectMode(CENTER);
}

void draw(){
  background(255);
  rectApilat(width/2, height-100, 500, 100);
}

void rectApilat(int x, int y, int w, int h){
  rect(x, y, w, h);
  if(w>100){
    rectApilat(x, y -h, w-70, h);
  }
}
