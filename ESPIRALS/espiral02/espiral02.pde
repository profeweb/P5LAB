
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
  float x0 = width/2;
  float y0 = height/2;
  
  for(float angle = 0.0; angle< numLaps*TWO_PI; angle+=angleStep){
    
    // Càlcul de les coordenades polars de l'espiral
    float x = width/2 + radius*cos(angle);
    float y = height/2 + radius*sin(angle);
    
    // Dibuixar la línia entre la coordenada actual i l'anterior
    float h = map(angle, 0, TWO_PI*numLaps, 0, 255); 
    stroke(h, 255, 255); strokeWeight(5);
    line(x, y, x0, y0);
    
    // Actualitzar coordenada anterior
    x0 = x;
    y0 = y;
    
    // Actualitzar el radi
    radius += radiusStep;
    
  }
}
