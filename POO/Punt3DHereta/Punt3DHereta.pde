Punt3D p1, p2;
color c1, c2;

void setup(){
  
  size(800,800, P3D);
  
  p1 = new Punt3D("A", 400, 250, 0);
  p1.setX(350);
  p1.setNom("A");
  p1.print();

  p2 = new Punt3D("B", 500, 650, -400);
  p2.print();
  
  c1 = color(255, 0, 0);
  c2 = color(0, 0, 255);
}


void draw(){
  
  background(255);
  p1.display(c1);
  p2.display(c2);
}
