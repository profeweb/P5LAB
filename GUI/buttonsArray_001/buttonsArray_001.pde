// Components de la GUI
// Array de Botons

// Botons de la GUI
Button[] botons;
boolean cursorHand = false;

// Dimensions dels botons
float buttonW = 300;
float buttonH = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació de l'Array de 4 Botons
  botons = new Button[4];
  
  // Creació dels botons
  botons[0] = new Button("RED", width/3, height/5, buttonW, buttonH);
  botons[1] = new Button("GREEN", width/3, 2*height/5, buttonW, buttonH);
  botons[2] = new Button("BLUE", width/3, 3*height/5, buttonW, buttonH);
  botons[3] = new Button("DISABLED", width/3, 4*height/5, buttonW, buttonH);
  
  // Desactiva el botó b4
  botons[3].setEnabled(false);
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  for(Button b :botons){
    b.display();
  }
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(botons[0].mouseOverButton() && botons[0].enabled){
    bgColor = color(255, 0, 0);
  }
  else if(botons[1].mouseOverButton() && botons[1].enabled){
    bgColor = color(0, 255, 0);
  }
  else if(botons[2].mouseOverButton() && botons[2].enabled){
    bgColor = color(0, 0, 255);
  }
}


// Modifica el cursor
void updateCursor(){
  
  cursorHand = false;
  for(Button b : botons){
    // Si estic sobre algun botó
    if(b.mouseOverButton() && b.enabled){
      cursorHand = true;
      break;
    }
  }
  
  if(cursorHand){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
