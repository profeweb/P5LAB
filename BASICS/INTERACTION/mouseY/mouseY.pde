void setup(){
  size(800,800);
  background(255);
  noStroke();
}

void draw(){
  fill(255);
  rect(0,0,width, mouseY);
  fill(0);
  rect(0,mouseY, width, height-mouseY);
}
