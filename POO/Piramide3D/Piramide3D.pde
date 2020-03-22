
// Declaració de variable Poliedre (piramide)
Poliedre piramide;

// Declaració de les variables Poligon (3 triangles i 1 quadrat)
Poligon triangle1, triangle2, triangle3, triangle4, quadrat;

// Angles de rotació per animar el Poliedre
float angleX=0.0, angleY=0.0;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els objectes Punt
  Punt p1 = new Punt("A", -100, 0,  100);
  Punt p2 = new Punt("B",  100, 0,  100);
  Punt p3 = new Punt("C",  100, 0, -100);
  Punt p4 = new Punt("D", -100, 0, -100);
  Punt p5 = new Punt("E",    0, -200,  0);
  
  // Instanciant l'objecte Poligon (quadrat de la base)
  quadrat = new Poligon(4);
  quadrat.setPunt(0, p1);
  quadrat.setPunt(1, p2);
  quadrat.setPunt(2, p3);
  quadrat.setPunt(3, p4);
  quadrat.setColor(color(255,0,0));
  
  // Instanciant l'objecte Poligon (triangle ABE)
  triangle1 = new Poligon(3);
  triangle1.setPunt(0, p1);
  triangle1.setPunt(1, p2);
  triangle1.setPunt(2, p5);
  triangle1.setColor(color(0,255,0));
  
  // Instanciant l'objecte Poligon (triangle BCE)
  triangle2 = new Poligon(3);
  triangle2.setPunt(0, p2);
  triangle2.setPunt(1, p3);
  triangle2.setPunt(2, p5);
  triangle2.setColor(color(0, 0,255));
  
  // Instanciant l'objecte Poligon (triangle CDE)
  triangle3 = new Poligon(3);
  triangle3.setPunt(0, p3);
  triangle3.setPunt(1, p4);
  triangle3.setPunt(2, p5);
  triangle3.setColor(color(255,255,0));
  
  // Instanciant l'objecte Poligon (triangle ADE)
  triangle4 = new Poligon(3);
  triangle4.setPunt(0, p1);
  triangle4.setPunt(1, p4);
  triangle4.setPunt(2, p5);
  triangle4.setColor(color(0,255,255));
  
  // Instancia l'objecte Poliedre (piramide)
  piramide = new Poliedre(5);
  
  // Li afegim al poliedre, les seves cares (poligons)
  piramide.setPoligon(0, quadrat); 
  piramide.setPoligon(1, triangle1); 
  piramide.setPoligon(2, triangle2); 
  piramide.setPoligon(3, triangle3); 
  piramide.setPoligon(4, triangle4); 
}

void draw(){
  background(255);
  
  // Traslladam al centre i rotam els angles X i Y.
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateY(angleY);
  
  // Visualitzar el poligon
  piramide.display();
  
  // Actualitzam els angles
  angleX+=0.01;
  angleY+=0.005;
}
