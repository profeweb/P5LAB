
String[] csvEmissions;
String[][] emissionsData;

int year;

void setup(){
  size(1800,900);
  
  csvEmissions  = loadStrings("EU CO2 emissions.csv");
  emissionsData =  new String[csvEmissions.length][4];
  
  for(int i=0; i<csvEmissions.length; i++){
    emissionsData[i] = csvEmissions[i].split(",");
  }
  
}


void draw(){
  
  background(255);
  
  year = (int) map(mouseX, 0, width, 1, emissionsData.length);
  
  drawEmissionsInfo(year);
  
  drawTimeLine();
  
  textSize(40); textAlign(LEFT);
  text("EU - CO2 Emissions", 100, height-100);
  text(emissionsData[year][2], 100, height-50);
  
}

void drawEmissionsInfo(int y){
  
  float emissions = float(emissionsData[y][3]);
  float w = map(emissions/10, 0, 1000000000, 0, width-100);
  fill(255,0,0,50); noStroke();
  rect(100, height/2, w, 100);
  
  fill(0); textAlign(LEFT); textSize(18);
  text(emissionsData[y][3],100, height/2 + 100);
}

void drawTimeLine(){
  
  stroke(0);
  line(100, height-200, width-100, height-200);
  float step = (width - 200) / (float)emissionsData.length;
  for(int i=1; i<emissionsData.length; i+=2){
    String y = emissionsData[i][2];
    textSize(8);
    pushMatrix();
      translate(100 + i*step, height-180);
      rotate(PI/2);
      text(y,0,0);
    popMatrix();
  }
}
