// Elements GUI
// Diagrama de Barres

// Variable
BarsDiagram s;

// Dades del Diagrama (textos, valors i colors)
String[] textos = {"WATER", "AIR", "FIRE", "EARTH"};
float[] values = {400, 600, 100, 300};
color[] colors = {color(0,0,255), color(50,50,200), 
                  color(255,0,0), color(0,255,0)};

void setup(){
  size(800,800);
  
  // Creació del Diagrama de Barres
  s = new BarsDiagram(50, 50, width/1.2, height/1.2);
  
  // Configuració de Dades (textos, valors, colors)
  s.setTexts(textos);
  s.setValues(values);
  s.setColors(colors);
}

void draw(){
  background(255);
  // Dibuix del Diagrama de Barres
  s.display();
}
