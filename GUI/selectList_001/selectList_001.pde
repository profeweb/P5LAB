// Components de la GUI
// Select Desplegable

// Selects de la GUI
SelectList sList;

// Valors dels Selects
String[] sValues = {"PATATA", "PA", "OLI", "SUCRE", "LLET"};

// Dimensions del select
float sW = 300;
float sH = 50;

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació del select
  sList = new SelectList(sValues, width/4, height/5, sW, sH);
}

void draw(){
  
  // Fons de la finestra
  background(255);
  
  // Dibuixa el select
  sList.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  // Si pitjam sobre el select
  sList.checkMouse();
}

 // Modifica el cursor
void updateCursor(){
  if(sList.checkCursor()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
}
