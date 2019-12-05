float angle = 0.0;

void setup() {
   size(800, 800, P3D);
}

void draw() {
   background(255);
   translate(width/2,height/2,0);
   fill(0,0,255);
   rotateZ(angle);
   box(200);
   
   angle += 0.01;
  
}
