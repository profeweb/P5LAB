Punt p1, p2, p3, p4;
Linia l1, l2;
Poligon pol1, pol2;
Pentagon pe1;

Star star1, star2;
Engrenatge e1;

void setup() {
  size(1400, 800, P3D);

  p1 = new Punt();
  p2 = new Punt("A", 200, 150);
  p3 = new Punt("B", 300, 450);
  p4 = new Punt("C", 100, 250);

  l1 = new Linia(p1, p2);
  l2 = new Linia(p2, p4);
  
  pol1 = new Poligon(new Punt("C", width/3, height/2), 100, 3);
  pol2 = new Poligon(new Punt("C", 2*width/3, height/2), 300, 5);
  
  //pol1.punts[0].z = -2000;
  //pol1.punts[1].z = -2000;
  //pol1.punts[2].z = -2000;
  
  pe1 = new Pentagon(new Punt("C", 2*width/3, height/2), 300);
  
  star1 = new Star(new Punt("", width/2, height/2), 100, 300, 12, 2);
  star1.displayPoints = false;
  star2 = new Star(new Punt("", 2*width/3, height/2), 50, 300, 24, 3);
  star2.displayPoints = false;
  
  e1 = new Engrenatge(new Punt("", 2*width/3, height/2), 150, 300, 24, 4);
  e1.displayPoints = false;
}

void draw() {
  background(255);
  //pol1.display(color(255, 255, 0, 100));
  //pe1.display(color(255, 0, 255, 100));
  //star2.display(color(255, 55, 55, 100));
  //e1.display(color(255, 55, 55, 100));
  
  int np = (int)map(mouseX, 0, width, 4, 40);
  float r1 = map(mouseY, 0, height, 10, 150);
  
  star1 = new Star(new Punt("", width/2, height/2), r1, 300, np, 2);
  star1.displayPoints = false;
  star1.display(color(55, 55, 255, 100));
  
}
