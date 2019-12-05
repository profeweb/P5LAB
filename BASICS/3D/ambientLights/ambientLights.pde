void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();
}

void draw() {
  
  ambientLight(255, 102, 102);
  
  translate(width/2, height/2, 0);
  rotateY(PI/5);
  box(200);
  
  translate(400, 0, 0);
  sphere(100);
}
