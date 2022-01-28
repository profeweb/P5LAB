// Exemple de component CheckBoxList

// Variable checkboxlist
CheckBoxList cbl;

// Textos de les opcions del checkboxlist
String[] info = {"Opció 1", "Opció 2", "Opció 3", "Opció 4"};

void setup(){
  
  size(800,800);
  
  // Construcció del checkboxlist
  cbl= new CheckBoxList(info, 160, 50, 50, 50);
  
}

void draw(){
  
  background(255);
  
  // Dibuixam el checkboxlist
  cbl.display();
  
}

// Si pitjam el ratolí, miram si ho fem sobre un checkbox
void mousePressed(){
   cbl.checkMouse();
}
