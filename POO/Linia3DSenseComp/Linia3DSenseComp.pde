
// Declaració de variables Linia
Linia l1, l2;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els objectes Línia
  l1 = new Linia("AB", 200, 200, 0, 400, 300, 0);
  l2 = new Linia("BC", 400, 300, 0, 500, 100, 0);
}

void draw(){
  
  background(255);
  
  // Visualitzar les línies
  l1.display();
  l2.display();
}
