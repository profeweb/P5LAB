void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();
}

void draw() {
  
  directionalLight(51, 102, 126, 0, -1, 0);
  
  translate(width/2, height/2, 0);
  sphere(250);
}
