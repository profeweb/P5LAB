
// Declaració de variable Poligon
Poligon p;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els objectes Punt
  Punt p1 = new Punt("A", 100, 300, 0);
  Punt p2 = new Punt("B", 300, 600, 0);
  Punt p3 = new Punt("C", 500, 100, 0);
  
  // Instanciant l'objecte Poligon
  p = new Poligon(3);
  p.setPunt(0, p1);
  p.setPunt(1, p2);
  p.setPunt(2, p3);
}

void draw(){
  
  background(255);
  
  // Visualitzar el poligon
  p.display();
}
