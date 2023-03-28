Poliedre p;
Punt a, b, c, d, e, f, g, h;
Poligon p1, p2, p3, p4, p5, p6;

void setup() {
  size(1400, 800, P3D);
  
  a = new Punt("A", -100, 100, -100);
  b = new Punt("B",  100, 100, -100);
  c = new Punt("C",  100, 100,  100);
  d = new Punt("D", -100, 100,  100);
  
  e = new Punt("E", -100, -100, -100);
  f = new Punt("F",  100, -100, -100);
  g = new Punt("G",  100, -100, 100);
  h = new Punt("H", -100, -100,  100);
  
  p1 = new Poligon(a, b, c, d);
  p2 = new Poligon(e, f, g, h);
  p3 = new Poligon(a, b, f, e);
  p4 = new Poligon(b, c, g, f);
  p5 = new Poligon(d, c, g, h);
  p6 = new Poligon(a, d, h, e);

  p = new Poliedre(6);
  p.setPoligon(0,p1);
  p.setPoligon(1,p2);
  p.setPoligon(2,p3);
  p.setPoligon(3,p4);
  p.setPoligon(4,p5);
  p.setPoligon(5,p6);

}

void draw() {
  background(255);
  translate(width/2, height/2, 100);
  rotateX(map(mouseX, 0, width, 0, TWO_PI));
  rotateY(map(mouseY, 0, height, 0, TWO_PI));
  p.display();
}
