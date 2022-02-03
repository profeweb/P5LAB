// TextArea
TextArea areaText;

// Botó
Button b;

// Nom del fitxer de text
String titol=null;

void setup(){
  
  size(800,800);
  
  // Creació del camp de text
  areaText = new TextArea(100, 100, 600, 450, 40, 15);

  // Creació del Botó
  b = new Button("LOAD", 300, height-120, 200, 80);
  
}

void draw(){
  
  background(200);
  
  // Dibuixa l'àrea de text
   areaText.display();
   
  // Dibuixa els botons
  b.display();
  
  // Actualitza el cursor
  updateCursor();
  
  // Dibuixa el nom del fitxer
  textSize(34); textAlign(CENTER);
  if(titol!=null){
    text(titol, width/2, 650);
  }
  else{
    text("Sense fitxer", width/2, 650);
  }
  
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b.mouseOverButton()){
    // Llegir el text del fitxer
    selectInput("Selecciona un fitxer...", "readSelectedTextFile");
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
