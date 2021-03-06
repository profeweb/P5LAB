
// Amb POO

void setup(){
  size(800, 800, P2D);
  colorMode(HSB, 255);
}


void draw(){
  
  background(255);
  
  // Salts de l'angle i el radi
  float angleStep = 0.1;
  float radiusStep = 1.0;
  
  // Radi de l'espiral
  float radius = 0.0;
  // Número de voltes de l'espiral
  int numLaps = 5;
  
  //Coordenada anterior
  Punt anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Càlcul de les coordenades polars de l'espiral
    Punt actual = new Punt( width/2 + radius*cos(angle), height/2 + radius*sin(angle));
    
    // Dibuixar lel punt actual
    actual.display();
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior);
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
    // Actualitzar el radi
    radius += radiusStep;
    
  }
}
