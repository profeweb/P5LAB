
void setup() {
  size(800,800,P3D);
}

void draw() {
  background(255);
  
  translate(width/2,height/2,0);
  rotateX(PI/4);
  rotateY(PI/3);
  rotateZ(PI/5);
  
  fill(200,0,200);
  box(250, 120, 50);
}
