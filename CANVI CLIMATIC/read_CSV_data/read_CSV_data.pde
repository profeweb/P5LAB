

// Array on emmagatzemar les línies del fitxer CSV
String[] csv;

// Array bidimensional on emmagatzemar les dades del CSV
String[][] myData;

// Número de files/paisos del fitxer csv
int numItems;

// Número de columnes/dades del fitxer csv
int numColumns= 4;

// Dades a llegir del fitxer CSV
String country, capital, latitude, longitude;

void setup(){
  size(800,800);
  
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
  
  // Imprimeix el contingut de la casella 10 de l'array myData
  printArray(myData[10]);
  getCountryInfo(10);
  
}


void draw(){
  
  background(255);
  
  // Canvia de pais cada 30 fotogrames
  if(frameCount%30==0){
    int randomItem = (int)random(numItems);
    getCountryInfo(randomItem);
  }
  
  // Mostra la informació del pais
  fill(0); textSize(50); textAlign(CENTER);
  text(country, width/2,height/3);
  text(capital, width/2, height/2);
  text(latitude+" / "+longitude, width/2, 2*height/3);
}


// Carrega la informació del pais n
void getCountryInfo(int n){
  country   = myData[n][0];
  capital   = myData[n][1];
  latitude  = myData[n][2];
  longitude = myData[n][3];
}
