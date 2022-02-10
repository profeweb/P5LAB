void setup(){
   size(800, 800); 
}

void draw(){
  
  color c = color(0);
  
  if(mouseX < width/2 && mouseY<height/2){
    c = color(255, 0, 0);
  }
  if(mouseX > width/2 && mouseY<height/2){
    c = color(0, 255, 0);
  }
  if(mouseX < width/2 && mouseY>height/2){
    c = color(0, 0, 255);
  }
  if(mouseX > width/2 && mouseY>height/2){
    c = color(255, 255, 0);
  }
  background(c);
  strokeWeight(3);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}
