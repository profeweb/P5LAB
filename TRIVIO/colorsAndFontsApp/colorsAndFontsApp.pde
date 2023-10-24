
void setup(){
  // Dimensions de l'App
  size(800, 800);
  
  // Inicialitza els colors de l'App
  setColors();
  
  // Inicialitza les fonts de l'App
  setFonts();
  
}


void draw(){
  
  // Dibuixa el fons (blanc)
  background(255);
  
  // Dibuixa rectangle amb 5è color (exemple d'emprar els colors directament).
  fill(getColorAt(4)); noStroke();
  rect(0, 3*height/4, width, height/4);
  
  // Mostra la paleta de colors
  displayColors(100,100,width-200);
  
  // Mostra les fonts
  displayFonts(100, 400, 40);
  
}
