
// Declaració de variable de tipus Poligon
Poligon star;

// Número de vertexos del Poligon
int num = 32;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant l'objecte Poligon (de n vertexos)
  star = new Poligon(num);
  
  // Angle inicial per calcular la posició dels vertexs del poligon
  float angle = 0.0;
  
  // Salt de l'angle entre els vertexs del poligon
  float angleStep = TWO_PI / num;
  
  // Radis interior i exteriors del cercles que inscriuen els vertexs del poligon
  float radiExterior = 300;
  float radiInterior = 150;
  
  // Per als vertexs del poligon farem:
  
  for(int i=0; i<num; i++){
    
    // Calcular la posició del vertex (i) de l'hexagon
    
    // Alternar el radi entre interior i exterior
    float radi;
    if(i%3>=1){
      radi = radiInterior;
    }
    else {
      radi = radiExterior;
    }
    
    // calcular x i y amb la formula de coordenades polars
    float x = width/2 + radi*cos(angle);
    float y = height/2 + radi*sin(angle);
    
    // Actualitzar l'angle per al proper vertex
    angle += angleStep;
    
    // Instanciar l'objecte Punt.
    Punt p = new Punt("", x, y, 0);
    
    // Afegir el punt (i) al Poligon
    star.setPunt(i, p);
    
  }
}

void draw(){
  
  background(255);
  
  // Visualitzar el poligon
  star.display();
}
