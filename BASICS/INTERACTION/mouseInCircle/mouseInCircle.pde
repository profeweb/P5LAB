void setup(){
  size(800,800);
  strokeWeight(5);
}

void draw(){
  
  background(255);
  
  float radius = 300;
  if(dist(width/2, height/2, mouseX, mouseY)>radius){
    fill(255,0,0);
  }
  else {
    fill(0,255,0);
  }
  ellipse(width/2, height/2, 2*radius, 2*radius);
}
