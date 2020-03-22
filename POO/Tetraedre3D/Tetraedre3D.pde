
// Declaració de variable Poliedre (tetraedre)
Poliedre tetraedre;

// Declaració de les variables Poligon (4 triangles)
Poligon triangle1, triangle2, triangle3, triangle4;

// Angles de rotació per animar el Poliedre
float angleX=0.0, angleY=0.0;

float s = 150;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els objectes Punt
  float sqr2 = sqrt(2);
  Punt p1 = new Punt("A", -s*sqr2, 0,  s*sqr2);
  Punt p2 = new Punt("B",  s*sqr2, 0,  s*sqr2);
  Punt p3 = new Punt("C",  0,      0, -s*sqr2);
  Punt p4 = new Punt("D",  0,   -s*2,       0);
 
  // Instanciant l'objecte Poligon (triangle base ABC)
  triangle1 = new Poligon(3);
  triangle1.setPunt(0, p1);
  triangle1.setPunt(1, p2);
  triangle1.setPunt(2, p3);
  triangle1.setColor(color(0,255,0));
  
  // Instanciant l'objecte Poligon (triangle ABD)
  triangle2 = new Poligon(3);
  triangle2.setPunt(0, p1);
  triangle2.setPunt(1, p2);
  triangle2.setPunt(2, p4);
  triangle2.setColor(color(0, 0,255));
  
  // Instanciant l'objecte Poligon (triangle ACD)
  triangle3 = new Poligon(3);
  triangle3.setPunt(0, p1);
  triangle3.setPunt(1, p3);
  triangle3.setPunt(2, p4);
  triangle3.setColor(color(255,255,0));
  
  // Instanciant l'objecte Poligon (triangle BCD)
  triangle4 = new Poligon(3);
  triangle4.setPunt(0, p2);
  triangle4.setPunt(1, p3);
  triangle4.setPunt(2, p4);
  triangle4.setColor(color(255,0,0));
  
  // Instancia l'objecte Poliedre (tetraedre)
  tetraedre = new Poliedre(4);
  
  // Li afegim al poliedre, les seves cares (poligons)
  tetraedre.setPoligon(0, triangle1); 
  tetraedre.setPoligon(1, triangle2); 
  tetraedre.setPoligon(2, triangle3); 
  tetraedre.setPoligon(3, triangle4); 
}

void draw(){
  background(255);
  
  // Traslladam al centre i rotam els angles X i Y.
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateY(angleY);
  
  // Visualitzar el poligon
  tetraedre.display();
  
  // Actualitzam els angles
  angleX+=0.01;
  angleY+=0.005;
}
