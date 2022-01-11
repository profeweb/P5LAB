// Elements GUI
// Diagrama de Barres

// Variable
LinesDiagram s;

// Dades del Diagrama (etiquetes)
String[] textos  = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

// Dades del Diagrama (valors)
float[] values  = {400, 600, 100, 300, 55, 100, 90, 220, 186, 400, 600, 10 };

// Color de la línia
color colorLine = color(150,50,200);

void setup(){
  size(1400,800);
  
  // Creació del Diagrama de Barres
  s = new LinesDiagram(50, 50, width-100, height - 200);
  
  // Configuració de Dades (textos, valors, colors)
  s.setTexts(textos);
  s.setValues(values);
  s.setColors(colorLine);
}

void draw(){
  background(255);
  // Dibuix del Diagrama de Barres
  s.display();
}
