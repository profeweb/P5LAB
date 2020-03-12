
// Declaració de variables Punt
Punt p1, p2, p3;

// Declaració de variables Linia
Linia l1, l2;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els Punts que usaran les línies
  p1 = new Punt("A", 200, 200, 0);
  p2 = new Punt("B", 400, 300, 0);
  p3 = new Punt("C", 500, 100, 0);
  
  
  // Instanciant els objectes Línia
  l1 = new Linia(p1, p2);
  l2 = new Linia(p2, p3);
}

void draw(){
  
  background(255);
  
  // Visualitzar les línies
  l1.display();
  l2.display();
}
