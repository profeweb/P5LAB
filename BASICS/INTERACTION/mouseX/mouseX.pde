void setup(){
  size(800,800);
  background(255);
  noStroke();
}

void draw(){
  fill(255);
  rect(0,0,mouseX, height);
  fill(0);
  rect(mouseX,0, width-mouseX, height);
}
