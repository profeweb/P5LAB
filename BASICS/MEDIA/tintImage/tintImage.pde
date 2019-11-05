
PImage img;

void setup(){
  size(800,800);
  img = loadImage("poster.jpg");
}


void draw(){
  background(255);
  float value = map(mouseY, 0, height, 0, 255);
  tint(255, value);  // Apply transparency without changing color.
  image(img, 0, 0, width, height);
}
