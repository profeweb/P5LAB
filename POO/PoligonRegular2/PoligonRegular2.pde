String[] lletres = {"A", "B", "C", "D", "E", "F", "G"};
// Declaració de variable Poligon
Poligon p, p2;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  int num = 6;
  p = new Poligon(num);
  p2 = new Poligon(3);
}

void draw(){
  background(255);
  
  // Visualitzar el poligon
  p.display();
  p2.display();
}
