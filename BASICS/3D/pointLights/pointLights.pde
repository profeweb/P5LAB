void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();
}

void draw() {
  
  pointLight(102, 51, 126, width/3, height/2, 400);
  
  translate(width/2, height/2, 0);
  sphere(250);
}
