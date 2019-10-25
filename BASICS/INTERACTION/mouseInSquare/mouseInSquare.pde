void setup(){
  size(800,800);
  strokeWeight(5);
}

void draw(){
  
  background(255);
  
  float side = 300;
  float cx = 250;
  float cy = 250;
  
  if((mouseX > cx) && (mouseX<cx + side) && (mouseY>cy) && (mouseY<cy+side)){
    fill(0,255,0);
  }
  else {
    fill(255,0,0);
  }
  rect(cx, cy, side, side);
}
