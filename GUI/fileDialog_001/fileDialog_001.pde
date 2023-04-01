// Informació del Fitxer
String titolFitxer="";
String rutaFitxer="";

// Botó
Button b;

void setup(){
  
  size(1400,300);
  
  // Creació del Botó
  b = new Button("FILE", 50, height-120, 200, 80);
  
}

void draw(){
  
  background(200);
  
  // Sense fitxer seleccionat
  if(!titolFitxer.equals("")){
    textSize(34); textAlign(LEFT);
    text(titolFitxer, 50, 50);
    text(rutaFitxer, 50, 100);
  }
  else{
    textSize(34); textAlign(LEFT);
    text("Sense fitxer seleccionat", 50, 50);
  }
  
  // Dibuixa el botó
  b.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b.mouseOverButton()){
    // Obrim el dialeg de tria del fitxer
    selectInput("Selecciona un fitxer ...", "fileSelected");
  }
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
