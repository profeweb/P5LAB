
void setup(){
  size(800,800);
  rectMode(CENTER);
  noFill();
}

void draw(){
  background(255);
  drawRing(width/2, height/2, 200);
}


void drawRing(float x, float y, float s) {
      strokeWeight(s/50.0);
      ellipse(x, y, s, s);
      s -= 50;
      if(s>10){
          drawRing(x-s/2, y, s);
          drawRing(x+s/2, y, s);
      }
 }
