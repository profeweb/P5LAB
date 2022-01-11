// Components de la GUI
// Botons

// Botons de la GUI
SwitchButton b1, b2;

// Dimensions dels botons
float buttonW = 300;
float buttonH = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació dels botons de switch
  b1 = new SwitchButton(width/3, height/4, buttonW, buttonH);
  b2 = new SwitchButton(width/3, 3*height/4, buttonW/2, buttonH);
  
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(b1.mouseOverButton()){
    b1.toggle();
    if(b1.enabled){
      bgColor = color(255);
    }
    else {
      bgColor = color(0);
    }
  }
  else if(b2.mouseOverButton()){
    b2.toggle();
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
