// Components de la GUI

// Botons
Button b1, b2;

// Dimensions dels botons
float buttonW = 60;
float buttonH = 60;

// Taula Paginada
PagedTable t;

// Dimensions de la taula
float tableW = 800, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 5, columnes = 5;

// Títols de les columnes 
String[] headers = {"Id", "Nom", "Llinatges", "Edat", "Sexe"};

// Amplades de les columnes
float[] colWidths = {10, 20, 40, 10, 20};

// Dades de la taula
String[][] info = {
                     {"1", "Pere", "Soler Miralles", "33", "Home"},
                     {"2", "Maria", "Garcia Lopez", "25", "Dona"},
                     {"3", "Joan", "Melis Cabrer", "47", "Home"},
                     {"4", "Bel", "Riera Mates", "52", "Dona"},
                     {"5", "Jose", "Perez Galdós", "37", "Home"},
                     {"6", "Pere", "Soler Miralles", "33", "Home"},
                     {"7", "Maria", "Garcia Lopez", "25", "Dona"},
                     {"8", "Joan", "Melis Cabrer", "47", "Home"},
                     {"9", "Bel", "Riera Mates", "52", "Dona"},
                     {"10", "Jose", "Perez Galdós", "37", "Home"},
                     {"11", "Pere", "Soler Miralles", "33", "Home"},
                     {"12", "Maria", "Garcia Lopez", "25", "Dona"},
                     {"13", "Joan", "Melis Cabrer", "47", "Home"},
                     {"14", "Bel", "Riera Mates", "52", "Dona"},
                     {"15", "Jose", "Perez Galdós", "37", "Home"},
                     {"16", "Pepe", "Viyuela Lopez", "42", "Home"},
                  };

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Creació de la taula
  t = new PagedTable(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
  // Creació dels botons
  b1 = new Button("NEXT", 25 + tableW/2 + buttonW/1.5, tableH + 80, buttonW, buttonH);
  b2 = new Button("PREV", 25 + tableW/2 - buttonW/1.5, tableH + 80, buttonW, buttonH);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa la taula
  t.display(50, 50, tableW, tableH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza forma del cursor
  updateCursor();
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  if(b1.mouseOverButton() && b1.enabled){
    t.nextPage();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    t.prevPage();
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}

void keyPressed(){
  if(keyCode==LEFT){
    t.prevPage();
  }
  else if(keyCode==RIGHT){
    t.nextPage();
  }
}
