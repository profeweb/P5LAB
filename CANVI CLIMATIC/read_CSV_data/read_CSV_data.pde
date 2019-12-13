
String[] csv;
String[][] myData;

int numItems;
int numColumns;

String country, capital, latitude, longitude;

void setup(){
  size(800,800);
  
  csv = loadStrings("capitals.csv");
  
  numItems = csv.length;
  numColumns = 4;
  
  myData = new String[numItems][numColumns];
  for(int i=0; i<csv.length; i++){
    myData[i] = csv[i].split(",");
  }
  
  printArray(myData[10]);
  getCountryInfo(10);
  
}


void draw(){
  
  background(255);
  
  if(frameCount%30==0){
    int randomItem = (int)random(numItems);
    getCountryInfo(randomItem);
  }
  
  fill(0); textSize(50); textAlign(CENTER);
  text(country, width/2,height/3);
  text(capital, width/2, height/2);
  text(latitude+" / "+longitude, width/2, 2*height/3);
}


void getCountryInfo(int n){
  country   = myData[n][0];
  capital   = myData[n][1];
  latitude  = myData[n][2];
  longitude = myData[n][3];
}
