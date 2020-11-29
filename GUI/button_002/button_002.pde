// Components de la GUI
// Botons forma de Cercle

// Botons de la GUI
RoundButton rb1, rb2;

// Icones dels botons
PImage icona1, icona2;

// Dimensions dels botons
float buttonR = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Carregar de les imatges (icones);
  icona1 = loadImage("bulbOff.png");
  icona2 = loadImage("bulbOn.png");
  
  // Creació dels botons
  rb1 = new RoundButton(icona1, width/2, height/3, buttonR);
  rb2 = new RoundButton(icona2, width/2, 2*height/3, buttonR);
  
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  rb1.display();
  rb2.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(rb1.mouseOverButton() && rb1.enabled){
    bgColor = color(0);
    rb1.setEnabled(false);
    rb2.setEnabled(true);
  }
  else if(rb2.mouseOverButton() && rb2.enabled){
    bgColor = color(255);
    rb2.setEnabled(false);
    rb1.setEnabled(true);
  }
}


// Modifica el cursor
void updateCursor(){
  
  if((rb1.mouseOverButton() && rb1.enabled)||
     (rb2.mouseOverButton() && rb2.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
