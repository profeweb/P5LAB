
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

// Elements Interfície Gràfica
PShape panell; // Panell de dades (SVG)
PFont font1, font2; // Fonts (TTF o OTF)

void setup(){
 
  // Pantalla completa
  fullScreen(P3D);  
  smooth(10);
  
  // Instanciació d'una Estrella
  sol = new Estrella("Sol", "2609", 'G', -26.8f );
  sol.setImage("sun.svg");
  sol.setPosicio(width/2, height/2, -10);
  sol.setPropsFisiques(1, 2, 3, 4, 5);
  sol.setPropsOrbitals(6, 7, 8, 9);
  
  // Instanciació d'un Planeta
  terra = new Planeta("Terra", "2641", TipusPlaneta.ROCOS, sol);
  terra.setImage("earth.svg");
  terra.setPosicio(2*width/3, height/2, -500);
  terra.setPropsFisiques(1, 2, 3, 4, 5);
  terra.setPropsOrbitals(6, 7, 8, 9);
  
  // Instanciació d'un Satèl·lit
  lluna = new Satelit("Lluna", "2600", TipusSatelit.NATURAL, terra);
  lluna.setImage("moon.svg");
  lluna.setPosicio(2*width/3, 1*height/3, -1000);
  lluna.setPropsFisiques(1, 2, 3, 4, 5);
  lluna.setPropsOrbitals(6, 7, 8, 9);
  

  // Carrega la imatge SVG del panell informatiu
  panell = loadShape("panel.svg");
  
  // Carrega les fonts TTF dels textos panell informatiu
  font1 = createFont("Starge.ttf", 40);
  font2 = createFont("Nasa.ttf", 24);
}


void draw(){
  // Fons 
  background(50);
  
  // Dibuixar els cossos astronòmics
  sol.display();
  terra.display();
  lluna.display();
  
  // Mostra el panell informatiu del cos astronòmic
  displayInfo(50, 50, lluna);
}

// Dibuixa el panell de dades del Cos Astronòmic c a la posició (x, y) 
void displayInfo(float x, float y, CosAstronomic c){
  
  // Dibuixa el fons del panell informatiu
  shapeMode(CORNER);
  shape(panell, x, y);
  
  // Dibuixa la imatge del planeta
  shapeMode(CENTER);
  shape(c.img, x + 60, y+55, 80, 80);
  
  // Variables per definir el marge esquerre i l'altura entre línies.
  float marginLeft = 80, lineHeight = 45;
  
  // Font pel nom del Cos Astronòmic
  fill(20, 96, 88); textSize(40); textAlign(LEFT); textFont(font1);
  
  // Dibuixa el NOM del cos astronòmic
  text(c.nom, x + 140, y + 80);
  
  // Font per al TIPUS de cos astronòmic
  fill(50); textSize(24); textAlign(LEFT); textFont(font2);
  
  // Dibuixa el TIPUS del cos astronòmic
  text(c.tipus.toString(), x + 140, y + 120);
  
  // Font per la resta de textos
  fill(255,20,20); textSize(24); textAlign(LEFT); textFont(font2);
  
  // Dibuixa les dades del cos astronòmic (bloc 1)
  text("dada 1", x + marginLeft, y + 210 +  lineHeight*0);
  text("dada 2", x + marginLeft, y + 210 +  lineHeight*1);
  text("dada 3", x + marginLeft, y + 210 +  lineHeight*2);
  text("dada 4", x + marginLeft, y + 210 +  lineHeight*3);
  
  // Dibuixa les dades del cos astronòmic (bloc 2)
  text(String.valueOf(c.masa), x + marginLeft, y + 440 + lineHeight*0);
  text("dada 2", x + marginLeft, y + 440 + lineHeight*1);
  text("dada 3", x + marginLeft, y + 440 + lineHeight*2);
  text("dada 4", x + marginLeft, y + 440 + lineHeight*3);
  
  // Dibuixa les dades del cos astronòmic (bloc 3)
  text(String.valueOf(c.radiOrbita), x + marginLeft, y + 655 + lineHeight*0);
  text("dada 2", x + marginLeft, y + 655 + lineHeight*1);
  text("dada 3", x + marginLeft, y + 655 + lineHeight*2);
  text("dada 4", x + marginLeft, y + 655 + lineHeight*3);
}
