// Llibreria PDF
import processing.pdf.*;

// Variables Globals
PShape baseMap;
String csv[];
String myData[][];

void setup() {
  size(1800, 900);
  noLoop();
  
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
}


void draw() {
  // Guardam en PDF
  beginRecord(PDF, "meteorStrikes.pdf");
  
  // Dibuixa el mapa
  shape(baseMap, 0, 0, width, height);
  noStroke();
  
  // Per cada dada, dibuixa ellipse
  for(int i=1; i<myData.length; i++){
    fill(255, 0, 0, 50); noStroke();
    
    // Mapeig de latitud i longitud
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    
    // Mida de l'elipse en funció de dades
    float markerSize = 0.05*sqrt(float(myData[i][2]))/PI;
    
    ellipse(graphLong, graphLat, markerSize, markerSize);
  
    // Per als primers 20, posam texte
    if(i<20){
      fill(0);
      text(myData[i][0], graphLong + markerSize + 5, graphLat + 4);
      noFill(); stroke(0);
      line(graphLong+markerSize/2, graphLat, graphLong+markerSize, graphLat);
    }
  }
  endRecord();
  println("PDF Saved!");
}
