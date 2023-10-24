import peasy.*;

PeasyCam cam;

Xemeneia x;

void setup(){
  
  size(800, 800, P3D);
  cam = new PeasyCam(this, 450);
  x = new Xemeneia(100, 100, 200, 50, 250);
}

void draw(){
  background(200);
  x.display(0, 0, -0);
}

void keyPressed(){
  
  float ampB = random(50, 200);
  float altB = random(50, 200);
  float ampM = random(50, 200);
  float ampT = random(50, 200);
  float altT = random(50, 200);
  x = new Xemeneia(ampB, altB, ampM, ampT, altT);
}
