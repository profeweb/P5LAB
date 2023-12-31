class Location {
  
  PImage foto;
  String nom;
  String pais;
  float lat, lng;
  
  float r = 30;
  
  Location(String n, String p, float lat, float lng, String f){
    this.nom = n;
    this.pais = p;
    this.lat = lat;
    this.lng = lng;
    this.foto = loadImage(f);
  }
  
  Location(String[] info){
    this.nom = info[0];
    this.pais = info[1];
    this.lng = Float.parseFloat(info[2]);
    this.lat = Float.parseFloat(info[3]);
    this.foto = loadImage(info[4]);
  }
  
  void displayMark(float x, float y, float w, float h){
    
    pushStyle();
    
    // Adaptació a mapa de Balears
    float longMin = 0.49761425, longMax= 4.89452897;
    float latMax = 40.167229, latMin = 38.54582099;

    float posLong = map(this.lng, longMin, longMax, x, x+w);
    float posLat  = map(this.lat, latMax, latMin, y, y+h);
        
    stroke(200, 100, 100); strokeWeight(8);
    fill(255);    
    if(this.mouseOver(x, y, w, h)){
      fill(100, 100, 200);
    }
    ellipse(posLong, posLat, r, r);
    
    fill(0); textSize(24); textAlign(CENTER);
    text(this.nom, posLong , posLat - r);
    
    popStyle();
    
  }
  
  void displayInfo(float x, float y, float w, float h){
    pushStyle();
    fill(250);
    rect(x, y, w, h, 5);
    image(this.foto, x+5, y+5, w-10, w-10);
    
    fill(0); textAlign(CENTER); textSize(28);
    text(this.nom+ " ("+this.pais+")", x + w/2, y + w + 50);
    popStyle();
  }
  
  boolean mouseOver(float x, float y, float w, float h){
    
    // Adaptació a mapa de Balears
    float longMin = 0.49761425, longMax= 4.89452897;
    float latMax = 40.167229, latMin = 38.54582099;

    float posLong = map(this.lng, longMin, longMax, x, x+w);
    float posLat  = map(this.lat, latMax, latMin, y, y+h);

    return dist(mouseX, mouseY, posLong, posLat) < r/2;
  }
  
}
  
