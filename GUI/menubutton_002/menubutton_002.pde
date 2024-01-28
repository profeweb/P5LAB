// Components de la GUI
// Botons

// Botons de la GUI
MenuButton mb;
Button bOpcio1, bOpcio2, bOpcio3;

boolean menuOpened = false;

// Dimensions dels botons
float menuButtonW = 100, menuButtonH = 100;
float buttonW = 300, buttonH = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació dels botons
  mb = new MenuButton(100, 100, menuButtonW, menuButtonH);
  bOpcio1 = new Button("Opció 1 - Vermell-", mb.x, mb.y + mb.h + 5 , buttonW, buttonH);
  bOpcio2 = new Button("Opció 2 - Verd -", mb.x, mb.y + mb.h + 10 + buttonH , buttonW, buttonH);
  bOpcio3 = new Button("Opció 3 - Blau-", mb.x, mb.y + mb.h + 15 + 2*buttonH , buttonW, buttonH);
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa el botó de menu
  mb.display();
  
  // Dibuixa el menú si està obert
  if(menuOpened){
     bOpcio1.display();
     bOpcio2.display();
     bOpcio3.display();
  }
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(mb.mouseOverButton()){
    menuOpened = !menuOpened;
  }
  else if (menuOpened && bOpcio1.mouseOverButton()){
    println("Opció 1 clickada");
    bgColor = color(255, 0, 0);
    menuOpened = false;
  }
  else if (menuOpened && bOpcio2.mouseOverButton()){
    println("Opció 2 clickada");
    bgColor = color(0, 255, 0);
    menuOpened = false;
  }
  else if (menuOpened && bOpcio3.mouseOverButton()){
    println("Opció 3 clickada");
    bgColor = color(0, 0, 255);
    menuOpened = false;
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(mb.mouseOverButton() || bOpcio1.mouseOverButton() || bOpcio2.mouseOverButton() || bOpcio3.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
