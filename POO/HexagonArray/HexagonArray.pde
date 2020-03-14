
// Declaració de variable de tipus Poligon
Poligon hexagon;

// 6 Lletres per a anomenar els vertexs de l'hexagon
String[] lletra = {"A", "B", "C", "D", "E", "F"};

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant l'objecte Poligon (de 6 vertexs -> hexagon)
  hexagon = new Poligon(6);
  
  // Angle inicial per calcular la posició dels vertexs del poligon
  float angle = 0.0;
  
  // Salt de l'angle entre els vertexs del poligon
  float angleStep = TWO_PI / 6;
  
  // Radi del cercle que inscriu els vertexs del poligon
  float radi = 300;
  
  // Per als 6 vertexs del poligon farem:
  
  for(int i=0; i<6; i++){
    
    // Calcular la posició del vertex (i) de l'hexagon
    float x = width/2 + radi*cos(angle);
    float y = height/2 + radi*sin(angle);
    
    // Actualitzar l'angle per al proper vertex
    angle += angleStep;
    
    // Instanciar l'objecte Punt.
    Punt p = new Punt(lletra[i], x, y, 0);
    
    // Afegir el punt (i) al Poligon
    hexagon.setPunt(i, p);
    
  }
}

void draw(){
  
  background(255);
  
  // Visualitzar el poligon
  hexagon.display();
}
