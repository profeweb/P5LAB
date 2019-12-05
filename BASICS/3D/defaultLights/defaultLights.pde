void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();
}

void draw() {

  lights();
  
  translate(width/2, height/2, 0);
  fill(255,255,0);
  sphere(100);
  
  translate(250, 0, 0);
  fill(255,0,255);
  sphere(100);
  
  translate(-500, 0, 0);
  fill(0,255,255);
  sphere(100);
}
