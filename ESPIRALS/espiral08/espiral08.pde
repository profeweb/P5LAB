
// Espiral Àuria (Golden Spiral)
// https://en.wikipedia.org/wiki/Golden_spiral

float PHI = (1 + sqrt(5)) / 2;

void setup(){
  size(800, 800, P2D);
}


void draw(){
  
  background(255);
  
  // Número de voltes de l'espiral
  int numLaps = 5;
  
  float angleStep = 0.001;
  
  //Coordenada anterior
  Punt anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Calcular coordenades polars del punt
    float r = pow(PHI, 2*angle/PI);
    Punt actual = new Punt( width/2 + r*cos(angle), height/2 + r*sin(angle));
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior, color(0,0,0));
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
  }
 
}
