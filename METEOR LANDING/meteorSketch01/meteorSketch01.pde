
// Variables Globals
PShape baseMap;
String csv[];
String myData[][];

// SETUP
void setup() {
  size(1800, 900);
  
  // Carregam imatge del mapa
  baseMap = loadShape("WorldMap.svg");
  
  // Llegim les linies del fitxer
  csv = loadStrings("MeteorStrikes.csv");
  
  // Cream un array de 6 columnes
  myData = new String[csv.length][6];
  
  // Emplenam l'array amb les dades
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
  
  // Imprimeix les dades de la fila 4
  printArray(myData[4]);
}

// DRAW
void draw() {
  shape(baseMap, 0, 0, width, height);
}
