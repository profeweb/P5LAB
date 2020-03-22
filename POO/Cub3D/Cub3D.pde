
// Declaració de variable Poliedre (cub)
Poliedre cub;

// Declaració de les variables Poligon (array de 6 quadrats)
Poligon[] quadrats;

// Angles de rotació per animar el Poliedre
float angleX=0.0, angleY=0.0;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els objectes Punt
  // Punts de cara inferior
  Punt p1 = new Punt("A", -100, 100,  100);
  Punt p2 = new Punt("B",  100, 100,  100);
  Punt p3 = new Punt("C",  100, 100, -100);
  Punt p4 = new Punt("D", -100, 100, -100);
  // Punts de cara superior
  Punt p5 = new Punt("E", -100, -100,  100);
  Punt p6 = new Punt("F",  100, -100,  100);
  Punt p7 = new Punt("G",  100, -100, -100);
  Punt p8 = new Punt("H", -100, -100, -100);
  
  // Instanciant l'array de Poligons (6 quadrats)
  quadrats = new Poligon[6];
  
  // quadrat 1 ABCD
  quadrats[0] = new Poligon(4);
  quadrats[0].setPunt(0, p1);
  quadrats[0].setPunt(1, p2);
  quadrats[0].setPunt(2, p3);
  quadrats[0].setPunt(3, p4);
  quadrats[0].setColor(color(255,0,0));
  
  // quadrat 2 EFGH
  quadrats[1] = new Poligon(4);
  quadrats[1].setPunt(0, p5);
  quadrats[1].setPunt(1, p6);
  quadrats[1].setPunt(2, p7);
  quadrats[1].setPunt(3, p8);
  quadrats[1].setColor(color(0,255,0));
  
  // quadrat 2 ABEF
  quadrats[2] = new Poligon(4);
  quadrats[2].setPunt(0, p1);
  quadrats[2].setPunt(1, p2);
  quadrats[2].setPunt(2, p6);
  quadrats[2].setPunt(3, p5);
  quadrats[2].setColor(color(0,0,255));
  

  
  // Instancia l'objecte Poliedre (piramide)
  cub = new Poliedre(3);
  
  // Li afegim al poliedre, les seves cares (poligons)
  cub.setPoligon(0, quadrats[0]); 
  cub.setPoligon(1, quadrats[1]);
  cub.setPoligon(2, quadrats[2]);
}

void draw(){
  background(255);
  
  // Traslladam al centre i rotam els angles X i Y.
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateY(angleY);
  
  // Visualitzar el poligon
  cub.display();
  
  // Actualitzam els angles
  angleX+=0.01;
  angleY+=0.005;
}
