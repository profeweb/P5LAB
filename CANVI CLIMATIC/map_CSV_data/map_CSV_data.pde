
// Array on emmagatzemar les línies del fitxer CSV
String[] csv;

// Array bidimensional on emmagatzemar les dades del CSV
String[][] myData;

// Número de files/paisos del fitxer csv
int numItems;

// Número de columnes/dades del fitxer csv
int numColumns = 4;

// Dades a llegir del fitxer CSV
String country, capital, latitude, longitude;

// Mapa de base
PShape baseMap;

void setup(){
  size(1800,900);
  
  // Carregar les dades dins l'array csv
  csv = loadStrings("capitals.csv");
  
  // Quantes dades (línies) té el fitxer csv
  numItems = csv.length;
  
  // Crea l'array bidimensional myData
  myData = new String[numItems][numColumns];
  
  // Emplena l'array myData amb les dades de l'array csv
  for(int i=0; i<csv.length; i++){
    myData[i] = csv[i].split(",");
  }
  
  // Carrega la imatge del mapa
  baseMap = loadShape("WorldMap.svg");
  
}


void draw(){
  
  // Dibuixa la imatge del mapa
  shape(baseMap, 0, 0, width, height);
  
  // Dibuixa la informació dels paisos
  for(int i=1; i<numItems; i++){
    drawCountryInfo(i);
  }
  
}


// Dibuixa la informació del pais número n dins l'array myData
void drawCountryInfo(int n){
  
  // Mapeja les coordenades de latitud i longitud en funció de les mides de l'app
  float mapLong = map(float(myData[n][3]), -180,180,0, width);
  float mapLat  = map(float(myData[n][2]), 90,-90,0, height);
  
  // Dibuixa una ellipse
  ellipse(mapLong, mapLat, 5, 5);
  fill(0); textAlign(CENTER);
  // Dibuixa el text corresponent amb el nom de la capital del pais (columna 1 de l'array myData)
  text(myData[n][1], mapLong, mapLat + 10);
}
