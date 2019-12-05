
void setup() {
   size(800, 800, P3D);
}

void draw() {
   background(255);
   translate(width/2,height/2,0);
   rotateX(PI*1.5);
   rotateY(PI/4.0);
   rotateZ(PI*2.5);
   box(200);
}
