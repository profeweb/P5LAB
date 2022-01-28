// Exemple de component CheckBoxList

// Variable checkboxlist
CheckBoxList cbl;

// Textos de les opcions del checkboxlist
String[] info = {"Almond", "Apple", "Avocado", "Banana", "Blackberry"};

void setup() {

  size(800, 800);

  // Construcció del checkboxlist
  cbl= new CheckBoxList(info, width/3, height/4, 50, 50);
}

void draw() {

  background(255);

  // Dibuixam el checkboxlist
  cbl.display();

  //Actualitza cursor
  updateCursor();
}

// Si pitjam el ratolí, miram si ho fem sobre un checkbox
void mousePressed() {
  cbl.checkMouse();
}

// Acualitza el cursor
void updateCursor() {
  if (cbl.checkCursor()) {
    cursor(HAND);
  } 
  else {
    cursor(ARROW);
  }
}
