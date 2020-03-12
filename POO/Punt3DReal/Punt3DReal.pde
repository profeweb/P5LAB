
Punt p1, p2;

void setup(){
  
  size(800,800, P3D);
  
  p1 = new Punt("A", 200, 200, 0);
  p2 = new Punt("B", 400, 300, 0);
}

void draw(){
  background(255);
  p1.display();
  p2.display();
}
