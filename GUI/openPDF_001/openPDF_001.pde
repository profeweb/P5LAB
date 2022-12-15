// Obri un fitxer PDF amb l'app predeterminada

// Botons
Button b1, b2;

void setup(){
  
  size(800,800);
  
  // Creació dels Botó
  b1 = new Button("PDF 1", width/2 - 125, height/2 -100, 250, 80);
  b2 = new Button("PDF 2", width/2 - 125, height/2 +100, 250, 80);

}

void draw(){
  
  background(200);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b1.mouseOverButton()){
    println("obrint "+titol1);
    launch(ruta+titol1);
  }
  else if(b2.mouseOverButton()){
    println("obrint "+titol2);
    launch(ruta+titol2);
  }
}

// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
