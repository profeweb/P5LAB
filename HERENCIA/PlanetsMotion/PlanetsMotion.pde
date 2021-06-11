/*
  Planets Motion v1.0
  Moviment orbital de cossos astronòmics
*/

// Declaració de variables Cos
Cos sol, terra, lluna;

void setup(){
  size(800,800); 
  
  // Instàncies dels objectes Cos
  sol   = new Cos(100, 0, 0, color(255, 255, 0)); 
  terra = new Cos(40, 300, 0.001, color(0, 0, 255));
  lluna = new Cos(10, 70, 0.01, color(100));
}


void draw(){
  
  background(255);
  
  // Orbitar la terra al voltant del sol
  terra.orbit(sol);
  // Orbitar la lluna al voltant de la terra
  lluna.orbit(terra);
  
  // Dibuixar els astres
  sol.display();
  terra.display();
  lluna.display();
  
}
