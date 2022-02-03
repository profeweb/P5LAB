// TextArea
TextArea areaText;

// Botó
Button b;

// Nom del fitxer de text
String titol="fitxer.txt";

// Carpeta on guardar el fitxer
String ruta = "C:\\Users\\tonim\\Documents\\CODE\\P5LAB\\GUI\\textfileSave_001\\data\\";

void setup(){
  
  size(800,800);
  
    // Creació dels camps de text
   areaText = new TextArea(100, 100, 600, 450, 40, 15);

  // Creació del Botó
  b = new Button("SAVE", 300, height-120, 200, 80);
  
}

void draw(){
  
  background(200);
  
  // Dibuixa l'àrea de text
   areaText.display();
  // Dibuixa els botons
  b.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b.mouseOverButton()){
    // Guardam el text en un fitxer
    String txt = areaText.getAllText();
    guardarText(txt, ruta, titol);
  }
  
  // Mira si pitjam sobre l'àrea de text
  areaText.isPressed();
}

// Quan pitjam tecla
void keyPressed() {
   areaText.keyPressed(key, (int)keyCode);
}

// Modifica el cursor
void updateCursor(){
  
  if(b.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
