float angleX = PI/3;
float angleY = PI/4;
float angleZ = PI/5;


void setup() {
   size(800, 800, P3D);
}

void draw() {
   background(255);
   
   translate(width/2,height/2,0);
   rotateX(angleX);
   rotateY(angleY);
   rotateZ(angleZ);
   
   box(200);
   
   angleX += 0.01;
   angleY += 0.01;
   angleZ += 0.01;
}
