
void setup(){
  size(800, 800, P2D);
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
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Càlcul de les coordenades polars de l'espiral
    float x = width/2 + radius*cos(angle);
    float y = height/2 + radius*sin(angle);
    
    // Dibuixar la coordenada
    fill(0);
    ellipse(x, y, 5,5);
    
    // Actualitzar el radi
    radius += radiusStep;
    
  }
}
