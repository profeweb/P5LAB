Button b1, b2;

// Dimensions dels botons
float buttonW = 300;
float buttonH = 100;

void setup(){
  size(800, 800);
  
  // Creació dels botons
  b1 = new Button("IES MANACOR", width/3, height/5, buttonW, buttonH);
  b2 = new Button("GOOGLE", width/3, 3*height/5, buttonW, buttonH);
  
  // Creació de
  desktop = Desktop.getDesktop();
}

void draw(){
  // Fons de la finestra
  background(255);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

void mousePressed(){
  
  if(b1.mouseOverButton() && b1.enabled){
    openWebPage("http://www.iesmanacor.cat");
  }
  else if(b2.mouseOverButton() && b2.enabled){
    openWebPage("http://www.google.com");
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled) ||
     (b2.mouseOverButton() && b2.enabled) ){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
