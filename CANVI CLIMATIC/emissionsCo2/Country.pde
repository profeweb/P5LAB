
class Country {
  
  // Country data
  String pais;
  String capital;
  float latitud, longitud;
  float emissions;
  
  // Construtor
  Country (String pais, String capital, float lat, float lon, float emi){
    this.pais = pais;
    this.capital = capital;
    this.latitud = lat; 
    this.longitud = lon;
    this.emissions = emi;
  }
  
  
  // Display Country Information
  void display(){
    
    // Map coordinates and radius
    float lat = map(latitud, 90, -90, 0, height);
    float lon = map(longitud, -180, 180, 0, width);
    float r = 0.025*sqrt(this.emissions)/PI;
    
    fill(0);
    ellipse(lon, lat, 5, 5);
    
    textSize(10);
    text(pais, lon, lat);
    
    fill(255,0,0,20); noStroke();
    ellipse(lon, lat, r, r);
  }
}
