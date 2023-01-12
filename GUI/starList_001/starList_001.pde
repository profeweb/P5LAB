// Exemple de component CheckBoxStarList

// Variable checkboxlist
CheckBoxStarList cbl;

// Imatges de les opcions del checkboxstarlist
String[] imgs = {"starON.png", "starOFF.png"};

void setup() {

  size(800, 800);

  // Construcció del checkboxstarlist
  cbl = new CheckBoxStarList(5, imgs, 100, height/2 - 100, 100, 100);
  
}

void draw() {

  background(255);

  // Dibuixam el checkboxlist
  cbl.display();

  //Actualitza cursor
  updateCursor();

  // Mostra el número d'elements seleccionats
  fill(0); textAlign(CENTER); textSize(24);
  text("Num Stars: "+ cbl.getNumSelected(), width/2, 100);

}

// Si pitjam el ratolí, miram si ho fem sobre un checkbox
void mousePressed() {
  cbl.checkMouse();
}

// Acualitza el cursor
void updateCursor() {
  if (cbl.checkCursor()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
