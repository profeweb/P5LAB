
void setup(){
  size(800, 800, P2D);
}


void draw(){
  
  background(255);
  
  // Salts de l'angle
  float angleStep = 0.1;
  
  // Radi del cercle
  float radius = 300.0;
  
  float x0 = width/2 + radius;
  float y0 = height/2;
  
  for(float angle = 0.0; angle <= TWO_PI + angleStep; angle+=angleStep){
    
    // Càlcul de les coordenades polars de l'espiral
    float x = width/2 + radius*cos(angle);
    float y = height/2 + radius*sin(angle);
    
    // Dibuixar la línia entre la coordenada actual i l'anterior
    stroke(0); strokeWeight(5);
    line(x, y, x0, y0);
    
    // Actualitzar la coordenada anterior
    x0 = x;
    y0 = y;
  }
}
