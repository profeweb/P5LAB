
// Imatge JPG fons espai
PImage fons;

void setup(){
  
  //size(1800, 800, P3D);
  fullScreen(P3D);
  background(0);
  smooth(10);

  // Carrega fitxers multimèdia de la Interfície (Imatges, fonts, ...)
  loadMedia();
    
}


void draw(){
  
  // Fons 
  dibuixaFons();
}

// Dibuixa la imatge de fons
void dibuixaFons(){
  background(0);
  pushMatrix();
    translate(width/2, height/2, -1000);
    imageMode(CENTER);
    image(fons, 0, 0);
  popMatrix();
}


// Carrega els fitxers multimèdia (imatges, fonts, ...)
void loadMedia(){
  
  // Imatge de fons
  fons = loadImage("nebula.jpg");
}
