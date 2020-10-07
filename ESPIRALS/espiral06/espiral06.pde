
// Espiral Poligonal

int numSides = 3;
float a = 5;

void setup(){
  size(800, 800, P2D);
}


void draw(){
  
  background(255);
  
  // Número de voltes de l'espiral
  int numLaps = 15;
  
  float angleStep = TWO_PI / numSides;
  
  //Coordenada anterior
  Punt anterior = new Punt(width/2, height/2);
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Calcular coordenades polars del punt
    float r = a*angle;
    Punt actual = new Punt( width/2 + r*cos(angle), height/2 + r*sin(angle));
    
    // Dibuixar la línia entre el punt actual i l'anterior
    actual.displayLine(anterior);
    
    // Actualitzar coordenada anterior
    anterior = actual;
    
  }
}

void mousePressed(){
  
   if (mouseButton == LEFT) {
      numSides --;
      if(numSides<3){
        numSides = 3;
      }
   }
   else  if (mouseButton == RIGHT) {
     numSides ++;
      if(numSides>12){
        numSides = 12;
      }
   }
  
}
