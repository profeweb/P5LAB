void setup(){
  size(800,800);
}

void draw(){
  background(200, 100, 100);
  drawRing(width/2, height/2, 300);
}

void drawRing(float x, float y, float s){
  noFill(); strokeWeight(3);
  circle(x, y, s);
  if(s>50){
    drawRing(x + s/2, y, s/2);
    drawRing(x - s/2, y, s/2);
    drawRing(x, y + s/2, s/2);
    drawRing(x, y - s/2, s/2);
  }
}
