
void setup() {
  size(800,800,P3D);
}

void draw() {
  background(255);
  translate(width/2,height/2,-100);
  box(150);
  translate(200,0,0);
  box(150);
  translate(-400,0,0);
  box(150);
}
