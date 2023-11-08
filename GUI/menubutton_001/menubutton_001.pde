// Components de la GUI
// Botons

// Botons de la GUI
MenuButton mb;
boolean menuOpened = false;

// Dimensions dels botons
float buttonW = 100;
float buttonH = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació dels botons
  mb = new MenuButton(100, 100, buttonW, buttonH);
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa el botó de menu
  mb.display();
  
  // Dibuixa el menú si està obert
  if(menuOpened){
     fill(200, 100, 100); stroke(0); strokeWeight(2);
     rect(205, 100, 400, 400, 5);
     fill(0); textSize(36);
     for(int i=0; i<4; i++) {
         text("Opció de Menú "+ (i+1), 220, 150 + i * 100);
     }
  }
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(mb.mouseOverButton() && mb.enabled){
    menuOpened = !menuOpened;
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(mb.mouseOverButton() && mb.enabled){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
