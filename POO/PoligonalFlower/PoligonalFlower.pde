
// Declaració de variable de tipus Poligon
Poligon cog;

// Número de vertexos del Poligon
int num = 32;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant l'objecte Poligon (de n vertexos)
  cog = new Poligon(num);
  
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
    if(i%8==0){
      radi = radiInterior;
    }
    else {
      radi = radiExterior;
    }
    
    // calcular x i y amb la formula de coordenades polars
    float x = width/2 + radi*cos(angle);
    float y = height/2 + radi*sin(angle);
    
    // Instanciar l'objecte Punt.
    Punt p = new Punt(String.valueOf(i), x, y, 0);
    
    // Afegir el punt (i) al Poligon
    cog.setPunt(i, p);
    
    // Actualitzar l'angle per al següent punt
    angle += angleStep;
    
  }
}

void draw(){
  
  background(255);
  
  // Visualitzar el poligon
  cog.display();
}
