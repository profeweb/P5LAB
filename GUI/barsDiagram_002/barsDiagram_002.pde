// Elements GUI
// Diagrama de Barres

// Variable
BarsDiagramMonth s;

// Dades del Diagrama (valors)
float[] values  = {400, 600, 100, 300, 55, 100, 90, 220, 186, 400, 
                   600, 100, 300, 55, 400, 600, 100, 300, 55, 220,
                   400, 600, 100, 300, 55, 100, 90, 220, 186, 400 };

// Color de les barres
color colorBars = color(150,50,200);

void setup(){
  size(1400,800);
  
  // Creació del Diagrama de Barres
  s = new BarsDiagramMonth(50, 50, width-100, height - 150);
  
  // Configuració de Dades (textos, valors, colors)
  s.setTexts(30);
  s.setValues(values);
  s.setColors(colorBars);
}

void draw(){
  background(255);
  // Dibuix del Diagrama de Barres
  s.display();
}
