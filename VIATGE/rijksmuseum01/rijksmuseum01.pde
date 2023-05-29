String imgName = "SK-A-3262.jpg";
PImage img;

void setup() {
  size(900, 1000);
  img = loadImage(imgName);
}

void draw() {
  background(255);
  image(img, 0, 0, width, height);
}
