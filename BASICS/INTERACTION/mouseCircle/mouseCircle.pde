void setup(){
  size(800,800);
  strokeWeight(5);
}

void draw(){
  
  background(255);
  
  float r = dist(width/2, height/2, mouseX, mouseY);
  
  fill(255,0,0);
  ellipse(width/2, height/2, 2*r, 2*r);
  
  line(width/2, height/2, mouseX, mouseY);
  
  fill(0);
  ellipse(width/2, height/2, 20,20);
  ellipse(mouseX, mouseY, 20, 20);
}
