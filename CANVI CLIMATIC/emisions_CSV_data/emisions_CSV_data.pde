
String[] csvCapitals;
String[][] capitalsData;

String country, capital, latitude, longitude;



String[] csvEmissions;
String[][] emissionsData;
String country2, emissions;

PShape baseMap;

void setup(){
  size(1800,900);
  
  csvCapitals = loadStrings("capitals.csv");
  
  capitalsData= new String[csvCapitals.length][4];
  
  for(int i=0; i<csvCapitals.length; i++){
    capitalsData[i] = csvCapitals[i].split(",");
  }
  
  
  csvEmissions  = loadStrings("emissions2017.csv");
  emissionsData =  new String[csvEmissions.length][4];
  
  for(int i=0; i<csvEmissions.length; i++){
    emissionsData[i] = csvEmissions[i].split(",");
  }
  
  baseMap = loadShape("WorldMap.svg");
  shape(baseMap, 0, 0, width, height);
  drawEmissionsInfo();
  noLoop();
  
  
}


void draw(){
   
}

void drawEmissionsInfo(){
  for(int i=1;i<capitalsData.length; i++){
    for(int j=0; j<emissionsData.length;j++){
      String country1 = capitalsData[i][0];
      String country2 = emissionsData[j][0];
      if(country1.equals(country2)){
        println(country1);
        drawCountryInfo(i, j);
      }
    }
  }
}
  

void drawCountryInfo(int k, int n){
  
  float mapLong = map(float(capitalsData[k][3]), -180,180,0, width);
  float mapLat  = map(float(capitalsData[k][2]), 90,-90,0, height);
  
  float emissions = Float.valueOf(emissionsData[n][3]);
  float r = 0.025*sqrt(emissions)/PI;
  
  fill(255,0,0,50); noStroke();
  ellipse(mapLong, mapLat, r, r);
  fill(0); textAlign(CENTER);
  text(capitalsData[k][1], mapLong, mapLat);
}
