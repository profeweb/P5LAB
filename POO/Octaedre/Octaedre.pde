// Declaració de variable Poliedre (octaedre)
Poliedre octaedre;

// Declaració de les variables Poligon (8 triangles)
Poligon[] triangles;

// Angles de rotació per animar el Poliedre
float angleX=0.0, angleY=0.0;

void setup() {

  size(800, 800, P3D);
  textMode(SHAPE);
  smooth(10);

  // Instanciant els objectes Punt
  Punt a = new Punt("A", -100,    0, 100);
  Punt b = new Punt("B",  100,    0, 100);
  Punt c = new Punt("C",  100,    0, -100);
  Punt d = new Punt("D", -100,    0, -100);
  Punt e = new Punt("E",    0, -200,    0);
  Punt f = new Punt("F",    0, +200,    0);

  // Instanciant l'array de poligons
  triangles = new Poligon[8];

  // Instanciant l'objecte Poligon (triangle ABE)
  triangles[0] = new Poligon(a, b, e);
  triangles[0].setColor(color(0, 255, 0));

  // Instanciant l'objecte Poligon (triangle BCE)
  triangles[1] = new Poligon(b, c, e);
  triangles[1].setColor(color(0, 0, 255));

  // Instanciant l'objecte Poligon (triangle CDE)
  triangles[2] = new Poligon(c, d, e);
  triangles[2].setColor(color(255, 255, 0));

  // Instanciant l'objecte Poligon (triangle ADE)
  triangles[3] = new Poligon(a, d, e);
  triangles[3].setColor(color(0, 255, 255));
  
  // Instanciant l'objecte Poligon (triangle ABF)
  triangles[4] = new Poligon(a, b, f);
  triangles[4].setColor(color(0, 155, 0));

  // Instanciant l'objecte Poligon (triangle BCF)
  triangles[5] = new Poligon(b, c, f);
  triangles[5].setColor(color(0, 0, 255));

  // Instanciant l'objecte Poligon (triangle CDF)
  triangles[6] = new Poligon(c, d, f);
  triangles[6].setColor(color(255, 255, 0));

  // Instanciant l'objecte Poligon (triangle ADF)
  triangles[7] = new Poligon(a, d, f);
  triangles[7].setColor(color(0, 255, 255));

  // Instancia l'objecte Poliedre (piramide)
  octaedre = new Poliedre(8);

  // Li afegim al poliedre, les seves cares (poligons)
  for (int i=0; i<8; i++) {
    octaedre.setPoligon(i, triangles[i]);
  }
}

void draw() {
  background(255);

  // Traslladam al centre i rotam els angles X i Y.
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateY(angleY);

  // Visualitzar el poligon
  octaedre.display();

  // Actualitzam els angles
  angleX+=0.01;
  angleY+=0.005;
}
