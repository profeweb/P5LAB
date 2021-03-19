// Variables Globals
PShape baseMap;
String csv[];
String myData[][];

void setup() {
  size(1800, 900);
  
  // Carregam imatge del mapa
  baseMap = loadShape("WorldMap.svg");
  
  // Llegim les linies del fitxer
  csv = loadStrings("MeteorStrikes.csv");
  
  // Cream un array de 6 columnes
  myData = new String[csv.length][6];
  
  // Emplenam l'array amb les dades
  for(int i=1; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}


void draw() {
  
  // Dibuixa el mapa
  shape(baseMap, 0, 0, width, height);
  noStroke();
  
  // Per cada dada, dibuixa ellipse
  for(int i=0; i<myData.length; i++){
    fill(255, 0, 0, 50);
    
    // Mapeig de latiutd i longitud
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    
    ellipse(graphLong, graphLat, 5, 5);
  }
}
