
String[] csv;
String[][] myData;

int numItems;
int numColumns = 4;

String country, capital, latitude, longitude;

PShape baseMap;

void setup(){
  size(1800,900);
  
  csv = loadStrings("capitals.csv");
  
  numItems = csv.length;
  
  myData = new String[numItems][numColumns];
  
  for(int i=0; i<csv.length; i++){
    myData[i] = csv[i].split(",");
  }
  
  baseMap = loadShape("WorldMap.svg");
  
}


void draw(){
  
  shape(baseMap, 0, 0, width, height);
  
  for(int i=1; i<numItems; i++){
    drawCountryInfo(i);
  }
  
}

void drawCountryInfo(int n){
  
  float mapLong = map(float(myData[n][3]), -180,180,0, width);
  float mapLat  = map(float(myData[n][2]), 90,-90,0, height);
  
  ellipse(mapLong, mapLat, 5, 5);
  fill(0); textAlign(CENTER);
  text(myData[n][1], mapLong, mapLat + 10);
}
