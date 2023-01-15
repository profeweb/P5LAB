// Components de la GUI
// Array de Botons

// Botons de la GUI
ArrayButtons buttons;
boolean cursorHand = false;

// Dimensions dels botons
float buttonW = 50;
// Espai entre els botons
float buttonS = 5;

// Color de fons de l'App
color bgColor = color(255);

void setup() {

  size(800, 800);      // Dimensions de la Pantalla

  // Creació de l'Array de 10 Botons
  buttons = new ArrayButtons(10, 100, height/2, buttonW, buttonS);
}

void draw() {

  // Fons de la finestra
  background(bgColor);

  // Dibuixa els botons
  buttons.display();
  
  // Indica la pàgina actual
  fill(0); textAlign(CENTER); textSize(28);
  text("PÀGINA: "+ buttons.getCurrentButton(), width/2, 200);

  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed() {
  buttons.checkMousePressed();
}


// Modifica el cursor
void updateCursor() {
  if (buttons.checkMouseOver()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
