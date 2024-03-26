// Components de la GUI
// Llista de Botons

// Botons de la GUI
ButtonList botons;
Button bAdd, bRemove;
boolean cursorHand = false;

// Dimensions dels botons
float buttonW = 300;
float buttonH = 100;

// Color de fons de l'App
color bgColor = color(255);

void setup() {

  size(800, 800);      // Dimensions de la Pantalla

  // Creació de la Llista de Botons
  botons = new ButtonList(100, 100, buttonW, buttonH);

  // Creació dels botons
  botons.addButton("RED");
  botons.addButton("GREEN");
  botons.addButton("BLUE");
  
  bAdd = new Button("+", 500, 100, buttonH, buttonH);
  bRemove = new Button("-", 610, 100, buttonH, buttonH);
}

void draw() {

  // Fons de la finestra
  background(bgColor);

  // Dibuixa els botons
  botons.display();
  bAdd.display();
  bRemove.display();

  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed() {

  if (botons.checkButtons()!= -1) {
    if (botons.checkButtonsText().equals("RED")) {
      bgColor = color(255, 0, 0);
    } else if (botons.checkButtonsText().equals("GREEN")) {
      bgColor = color(0, 255, 0);
    } else if (botons.checkButtonsText().equals("BLUE")) {
      bgColor = color(0, 0, 255);
    }
    else {
      bgColor = color(random(255), random(255), random(255));
    }
  }
  else if(bAdd.mouseOverButton()){
    botons.addButton("RAND COLOR");
  }
  else if(bRemove.mouseOverButton()){
    botons.deleteLastButton();
  }
}


// Modifica el cursor
void updateCursor() {

  cursorHand = false;
  for (Button b : botons.buttons) {
    // Si estic sobre algun botó
    if (b.mouseOverButton() && b.enabled) {
      cursorHand = true;
      break;
    }
  }

  if (cursorHand || bAdd.mouseOverButton()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
