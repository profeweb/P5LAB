
// Espiral Fermat
// https://en.wikipedia.org/wiki/Fermat's_spiral


float a = 60;

void setup(){
  size(800, 800, P2D);
}


void draw(){
  
  background(255);
  
  // Número de voltes de l'espiral
  int numLaps = 5;
  
  float angleStep = 0.001;
  
  // Dibuix de branca positiva (+a)
  
  //Coordenada anterior
  Punt anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Calcular coordenades polars del punt
    float r = a*sqrt(angle);
    Punt actual = new Punt( width/2 + r*cos(angle), height/2 + r*sin(angle));
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior, color(255,0,0));
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
  }
  
  // Dibuix de branca negativa (-a)
  
  //Coordenada anterior
  anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Calcular coordenades polars del punt
    float r = -a*sqrt(angle);
    Punt actual = new Punt( width/2 + r*cos(angle), height/2 + r*sin(angle));
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior, color(0,255,0));
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
  }
}
