
String[] csv, csv2;
String[][] myData, myData2;

Country[] countries;
int numCountries = 0;

PShape mapa;

void setup(){
  size(1800,900);
  
  // Load the map image fiile
  mapa = loadShape("WorldMap.svg");
  
  // Read CSV file lines
  csv = loadStrings("capitals.csv");
  
  // Read CSV file columns
  myData = new String[csv.length][4];
  for(int i=0; i<csv.length; i++){
    myData[i] = csv[i].split(",");
  }
  
  // Read CSV file lines
  csv2 = loadStrings("emissions2017.csv");
  
  // Read CSV file columns
  myData2 = new String[csv2.length][4];
  for(int i=0; i<csv2.length; i++){
    myData2[i] = csv2[i].split(",");
  }
  
  // Create Array
  countries = new Country[csv.length];
  
  // Fill in Array of Countries with Information
  matchData();
  
}

// Match the data between CSV 1 & CSV 2 files
void matchData(){
  
  for(int i=0; i<csv.length; i++){
    for(int j=0; j<csv2.length; j++){
      
      // Get information from CSV 1
      String pais     = myData[i][0];
      String capital  = myData[i][1];
      float latitud  = float(myData[i][2]);
      float longitud = float(myData[i][3]);
      
      // Get information from CSV 2
      String pais2 = myData2[j][0];
      float emissions = float(myData2[j][3]);
      
      // If there is a matching
      if(pais.equals(pais2)){
        // Add the Country information to the Array
        countries[numCountries] = new Country(pais, capital, latitud, longitud, emissions);
        numCountries++;
      }
    }
  }
}

// Display all Countries Information
void displayCountries(){
  for(int i=0; i<numCountries; i++){
    countries[i].display();
  }
}

// Draw the Countries CO2 Emissions Map
void draw(){
  background(255); 
  shape(mapa, 0, 0, width, height);
  displayCountries();
}
