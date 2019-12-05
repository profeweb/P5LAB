void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();
}

void draw() {
  
  background(0); 
  
  float concentration = map(mouseX, 0, width, 1, 10);

  spotLight(51, 102, 126, width/3, height/4, 400, 
          0, 0, -1, PI, concentration); 

  translate(width/2, height/2, 0);
  rotateY(PI/7);
  rotateX(PI/3);
  rotateZ(PI/8);
  box(250);
}
