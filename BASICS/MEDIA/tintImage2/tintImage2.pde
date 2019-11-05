
PImage img;

void setup(){
  size(800,800);
  img = loadImage("poster.jpg");
}


void draw(){
  
  background(255);
  
  float value = map(mouseY, 0, height, 0, 255);
  
  noTint();  // Original (no tinted) image.
  image(img, 0, 0, width/2, height/2);
  
  tint(255, 0, 0, value);  // Tint red and change transparency.
  image(img, width/2, 0, width/2, height/2);
  
  tint(0, 255, 0, value);  // Tint green and change transparency.
  image(img, 0, height/2, width/2, height/2);
  
  tint(0, 0, 255, value);  // Tint blue and change transparency.
  image(img, width/2, height/2, width/2, height/2);
}
