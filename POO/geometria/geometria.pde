Punt p1, p2, p3, p4;
Linia l1, l2;
Poligon pol1, pol2;

void setup() {
  size(1400, 800);

  p1 = new Punt();
  p2 = new Punt("A", 200, 150);
  p3 = new Punt("B", 300, 450);
  p4 = new Punt("C", 100, 250);

  l1 = new Linia(p1, p2);
  l2 = new Linia(p2, p4);
  
  pol1 = new Poligon(new Punt("C", width/3, height/2), 100, 3);
  pol2 = new Poligon(new Punt("C", 2*width/3, height/2), 300, 5);
}

void draw() {
  background(255);
  pol1.display(color(255, 255, 0, 100));
  pol2.display(color(255, 0, 255, 100));
}
