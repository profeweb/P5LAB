// Components de la GUI
// Taula
Table t;

// Dimensions de la taula
float tableW = 800, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 6, columnes = 5;

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
                  };

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa la taula
  t.display(50, 50, tableW, tableH);
  
}
