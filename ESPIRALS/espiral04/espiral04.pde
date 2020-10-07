
// Espiral Arquímedes
// https://en.wikipedia.org/wiki/Archimedean_spiral

float a = 1;

void setup(){
  size(800, 800, P2D);
  colorMode(HSB, 255);
}


void draw(){
  
  background(255);
  
  // Mapeja el valor de a entre 0 i 10
  a = map(mouseX, 0, width, 0, 10);
  
  // Salts de l'angle i el radi
  float angleStep = 0.01;
  
  // Número de voltes de l'espiral
  int numLaps = 5;
  
  //Coordenada anterior
  Punt anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Càlcul de les coordenades polars de l'espiral
    float r = a * angle;
    Punt actual = new Punt( width/2 + r*cos(angle), height/2 + r*sin(angle));
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior);
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
  }
}
