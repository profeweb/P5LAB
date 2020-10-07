
// Espiral Poligonal

int numSides = 5;
float angleStep = TWO_PI / numSides;
float a = 5;

void setup(){
  size(800, 800, P2D);
  colorMode(HSB, 255);
}


void draw(){
  
  background(255);
  
  // Número de voltes de l'espiral
  int numLaps = 15;
  
  //Coordenada anterior
  Punt anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    float r = a*angle;
    Punt actual = new Punt( width/2 + r*cos(angle), height/2 + r*sin(angle));
    
    // Dibuixar lel punt actual
    //actual.display();
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior);
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
  }
}
