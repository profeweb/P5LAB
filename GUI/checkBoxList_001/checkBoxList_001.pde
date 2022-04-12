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

  // Mostra el número d'elements seleccionats
  text("Num Checked: "+ cbl.getNumSelected(), 10, 50);
  
  // Mostra els elements seleccionats
  text("Checked: "+ getWhereInFormat(cbl.getSelectedItems()), 10, 90);
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


String getWhereInFormat(String[] items) {
  String txt="";
  for (int i=0; i<items.length; i++) {
    txt+="'"+items[i]+"'";
    if (i!=items.length-1) {
      txt+=",";
    }
  }
  return txt;
}
