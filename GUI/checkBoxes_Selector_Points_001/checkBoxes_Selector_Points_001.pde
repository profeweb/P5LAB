// Exemple de CheckBoxSelector a partir d'un array de Punts

// Variable checkboxselector
CheckBoxSelector cbl;

// Textos de les opcions del checkboxselector
String[] info;

// Array de Punts
Punt[] punts;

void setup() {

  size(800, 800);
  
  // Crea l'array de Punts
  punts = new Punt[5];
  
  // Emplena l'array de Punts
  punts[0] = new Punt("A", 5, -3, 0);
  punts[1] = new Punt("B", 15, 30, 10);
  punts[2] = new Punt("C", -5, 3, 0);
  punts[3] = new Punt("D", 0, 13, 20);
  punts[4] = new Punt("E", 11, 4, -10);
  
  // Crea l'array d'informació a partir dels punts
  info = new String[punts.length];
  for(int i=0; i<punts.length; i++){
    info[i] = punts[i].getInfo();
  }

  // Construcció del checkboxselector
  cbl= new CheckBoxSelector(info, width/3, height/4, 50, 50);
}

void draw() {

  background(255);
  
  fill(0);
  text("Selecciona màxim 2 punts", 100, 100);

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
  } else {
    cursor(ARROW);
  }
}
