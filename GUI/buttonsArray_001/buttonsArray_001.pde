// Components de la GUI
// Botons

// Botons de la GUI
Button b1, b2, b3, b4;

// Dimensions dels botons
float buttonW = 300;
float buttonH = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació dels botons
  b1 = new Button("RED", width/3, height/5, buttonW, buttonH);
  b2 = new Button("GREEN", width/3, 2*height/5, buttonW, buttonH);
  b3 = new Button("BLUE", width/3, 3*height/5, buttonW, buttonH);
  b4 = new Button("DISABLED", width/3, 4*height/5, buttonW, buttonH);
  
  // Desactiva el botó b4
  b4.setEnabled(false);
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  b3.display();
  b4.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(b1.mouseOverButton() && b1.enabled){
    bgColor = color(255, 0, 0);
  }
  else if(b2.mouseOverButton() && b2.enabled){
    bgColor = color(0, 255, 0);
  }
  else if(b3.mouseOverButton() && b3.enabled){
    bgColor = color(0, 0, 255);
  }
}


// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)||
     (b3.mouseOverButton() && b3.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
