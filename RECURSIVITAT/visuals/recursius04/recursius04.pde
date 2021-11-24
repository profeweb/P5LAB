void setup(){
  size(800, 800);
  stroke(0); noFill();
  rectMode(CENTER);
}

void draw(){
  background(255);
  rectDividit(width/2, height/2, 500, 500);
}

void rectDividit(int x, int y, int w, int h){
  rect(x, y, w, h);
  if(w>100){
    rectDividit(x - w/4, y - h/4, w/2, h/2);
    rectDividit(x + w/4, y - h/4, w/2, h/2);
    rectDividit(x - w/4, y + h/4, w/2, h/2);
    rectDividit(x + w/4, y + h/4, w/2, h/2);
  }
}
