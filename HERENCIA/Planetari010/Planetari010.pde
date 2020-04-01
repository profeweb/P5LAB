
// Tipus de Cosos Astronòmics (enumerat)
enum Tipus {ESTRELLA, PLANETA, SATELIT, COMETA, COSMENOR};

// Tipus de Planetes (enumerat)
enum TipusPlaneta { ROCOS, GASOS, NAN};

// Tipus de Satèl·lits (enumerat)
enum TipusSatelit {NATURAL, PASTOR,  TROIA, COORBITAL, ASTEROIDAL};

// Variables Estrella, Planeta i Satelit
Estrella sol;
Planeta terra;
Satelit lluna;

void setup(){
  
  //size(1800, 600, P3D);
  fullScreen(P3D);
  smooth(10);
  
  // Instanciació d'una Estrella
  sol = new Estrella("Sol", "2609", 'G', -26.8f );
  sol.setImage("sun.svg");
  sol.setPosicio(width/2, height/2, 0);
  
  // Instanciació d'un Planeta
  terra = new Planeta("Terra", "2641", TipusPlaneta.ROCOS, sol);
  terra.setImage("earth.svg");
  terra.setPosicio(2*width/3, height/2, 0);
  
  // Instanciació d'un Satèl·lit
  lluna  = new Satelit("Lluna", "2600", TipusSatelit.NATURAL, terra);
  lluna.setImage("moon.svg");
  lluna.setPosicio(2*width/3, 1*height/3, 0);
    
}


void draw(){
  
  background(0);
  
  // Dibuixar els cossos astronòmics
  sol.display();
  terra.display();
  lluna.display();
  
  // Mostra el panell informatiu del cos astronòmic
  displayInfo(100, 100, sol);
}


void displayInfo(float x, float y, CosAstronomic c){
  
  // Dibuixa el fons del panell informatiu
  PShape p = loadShape("panel.svg");
  shapeMode(CORNER);
  shape(p, x, y);
  
  float marginLeft = 20;
  float lineSpace = 30;
  
  // Dibuixa el text de les dades del cos astronòmic
  fill(0); textSize(20);
  text(c.nom, x + marginLeft, y + lineSpace*1);
  
  text(c.tipus.toString(), x + marginLeft, y +  lineSpace*2);
  
  text(String.valueOf(c.masa)+ "e13", x + marginLeft, y + lineSpace*3);
}
