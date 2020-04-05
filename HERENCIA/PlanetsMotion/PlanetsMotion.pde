
Cos sol, terra, lluna;

void setup(){
  size(800,800); 
  
  sol   = new Cos(100, 0, 0, color(255, 255, 0)); 
  terra = new Cos(40, 300, 0.001, color(0, 0, 255));
  lluna = new Cos(10, 70, 0.01, color(100));
}


void draw(){
  
  background(255);
  
  // Orbitar
  terra.orbit(sol);
  lluna.orbit(terra);
  
  // Dibuixar els astres
  sol.display();
  terra.display();
  lluna.display();
  
}
