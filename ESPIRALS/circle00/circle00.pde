
void setup(){
  size(800, 800, P2D);
}


void draw(){
  
  background(255);
  
  // Salts de l'angle
  float angleStep = 0.1;
  
  // Radi del cercle
  float radius = 300.0;
  
  for(float angle = 0.0; angle< TWO_PI; angle+=angleStep){
    
    // Càlcul de les coordenades polars de l'espiral
    float x = width/2 + radius*cos(angle);
    float y = height/2 + radius*sin(angle);
    
    // Dibuixar la coordenada actual
    stroke(0); strokeWeight(5);
    ellipse(x, y, 5,5);
   
    
  }
}
