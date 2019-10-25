void setup(){
  size(800,800);
  background(255);
  strokeWeight(5);
}

void draw(){
  background(255);
  
  // Sector 1
  fill(255,0,0);
  rect(0,0, mouseX, mouseY);
  
  // Sector 2
  fill(0,0,255);
  rect(mouseX, 0, width-mouseX, mouseY);
  
  // Sector 3
  fill(255,255,0);
  rect(0, mouseY, mouseX, height-mouseY);
  
  //Sector 4
  fill(0,255,0);
  rect(mouseX, mouseY, width-mouseX, height-mouseY);
  
  line(0,mouseY,width, mouseY);
  line(mouseX, 0, mouseX, height);
}
