// Declaració de variable Poligon
Poligon p1, p2;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);

  // Construir els polígons
  p1 = new Poligon(6, 200, 300, 150);
  p1.setColor(color(100, 100, 200));
  p2 = new Poligon(3, 500, 600, 200);
}

void draw(){
  background(255);
  // Visualitzar els poligons
  p1.display();
  p2.display(color(0, 255, 0));
}
