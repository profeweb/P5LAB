void setup(){
  size(800,800);
  strokeWeight(5);
}

void draw(){
  
  background(255);
  
  float w = 300;
  float h = 200;
  float cx = 250;
  float cy = 300;
  
  if((mouseX > cx) && (mouseX<cx + w) && (mouseY>cy) && (mouseY<cy+h)){
    fill(0,255,0);
  }
  else {
    fill(255,0,0);
  }
  rect(cx, cy, w, h);
}
