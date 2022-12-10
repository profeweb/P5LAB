// Copia un fitxer dins una carpeta predeterminada

// Botó
Button b1;


void setup(){
  
  size(800,800);
  
  // Creació dels Botó
  b1 = new Button("COPY FILE", width/2 - 125, height/2 -40, 250, 80);
  
}

void draw(){
  
  background(200);
  
  // Dibuixa el botó
  b1.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b1.mouseOverButton()){
    // Obrim el dialeg
    selectInput("Selecciona un fitxer ...", "fileSelected");
  }
}

// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
