
// Tipus de Cosos Astronòmics (enumerat)
enum Tipus {ESTRELLA, PLANETA, SATELIT, COMETA, COSMENOR};

// Tipus de Planetes (enumerat)
enum TipusPlaneta { ROCOS, GASOS, NAN};

// Tipus de Satèl·lits (enumerat)
enum TipusSatelit {NATURAL, PASTOR,  TROIA, COORBITAL, ASTEROIDAL};

// Array de cossos astronòmics
CosAstronomic[] astres;

// Número de Cossos Astronòmics
int numTotalAstres = 11;

// Número de l'Astre seleccionat
int numAstre = 0;

// Imatge SVG del panell informatiu
PShape panell;

// Fonts per mostrar textos
PFont font1, font2;

void setup(){
  
  //size(1800, 600, P3D);
  fullScreen(P3D);
  smooth(10);
  
  // Creació de l'Array de Cossos Astronòmics
  astres = new CosAstronomic[numTotalAstres];
  
  // Instanciació del Sol (Estrella)
  Estrella sol = new Estrella("Sol", "2609", 'G', -26.8f );
  sol.setImage("sun.svg");
  sol.setPosicio(width/2, height/2, -10);
  // Guardar el Sol a l'array d'astres
  astres[0] = sol;
  
  // Instanciació de Mercuri (Planeta)
  Planeta mercuri = new Planeta("Mercuri", "2641", TipusPlaneta.ROCOS, sol);
  mercuri.setImage("mercury.svg");
  mercuri.setPosicio(1*width/3, height/3, 0);
  // Guardar Mercuri a l'array d'astres
  astres[1] = mercuri;
  
  // Instanciació de Venus (Planeta)
  Planeta venus = new Planeta("Venus", "2641", TipusPlaneta.ROCOS, sol);
  venus.setImage("venus.svg");
  venus.setPosicio(1*width/3, 1*height/2, 0);
  // Guardar Venus a l'array d'astres
  astres[2] = venus;
  
  // Instanciació de la Terra (Planeta)
  Planeta terra = new Planeta("Terra", "2641", TipusPlaneta.ROCOS, sol);
  terra.setImage("earth.svg");
  terra.setPosicio(1*width/3, 2*height/3, 0);
  // Guardar la Terra a l'array d'astres
  astres[3] = terra;
  
  // Instanciació d'un Satèl·lit
  Satelit lluna = new Satelit("Lluna", "2600", TipusSatelit.NATURAL, terra);
  lluna.setImage("moon.svg");
  lluna.setPosicio(1*width/3 -200, 2*height/3, 0);
  // Guardar la Lluna a l'array d'astres
  astres[4] = lluna;
  
  // Instanciació de Mart (Planeta)
  Planeta mart = new Planeta("Mart", "2641", TipusPlaneta.ROCOS, sol);
  mart.setImage("mars.svg");
  mart.setPosicio(width/2, 1*height/3, 0);
  // Guardar Mart a l'array d'astres
  astres[5] = mart;
  
  // Instanciació de Júpiter (Planeta)
  Planeta jupiter = new Planeta("Júpiter", "2641", TipusPlaneta.ROCOS, sol);
  jupiter.setImage("jupiter.svg");
  jupiter.setPosicio(width/2, 2*height/3, 0);
  // Guardar Júpiter a l'array d'astres
  astres[6] = jupiter;
  
  // Instanciació de Saturn (Planeta)
  Planeta saturn = new Planeta("Saturn", "2641", TipusPlaneta.ROCOS, sol);
  saturn.setImage("saturn.svg");
  saturn.setPosicio(2*width/3, 1*height/3, 0);
  // Guardar Saturn a l'array d'astres
  astres[7] = saturn;
  
  // Instanciació de Urà (Planeta)
  Planeta ura = new Planeta("Urà", "2641", TipusPlaneta.ROCOS, sol);
  ura.setImage("uranus.svg");
  ura.setPosicio(2*width/3, 1*height/2, 0);
  // Guardar Urà a l'array d'astres
  astres[8] = ura;
  
  // Instanciació de Neptú (Planeta)
  Planeta neptu = new Planeta("Neptú", "2641", TipusPlaneta.ROCOS, sol);
  neptu.setImage("neptun.svg");
  neptu.setPosicio(2*width/3, 2*height/3, 0);
  // Guardar Neptú a l'array d'astres
  astres[9] = neptu;
  
  // Instanciació de Plutó (Planeta)
  Planeta pluto = new Planeta("Plutó", "2641", TipusPlaneta.ROCOS, sol);
  pluto.setImage("pluto.svg");
  pluto.setPosicio(2*width/3 + 200, 1*height/2, 0);
  // Guardar Plutó a l'array d'astres
  astres[10] = pluto;
  
  // Imatges SVG de la interfície gràfica
  panell = loadShape("panel.svg");
  
  // Fonts per als textos informatius
  font1 = createFont("Starge.ttf", 40);
  font2 = createFont("Nasa.ttf", 24);
    
}


void draw(){
  
  // Fons 
  background(50);
  
  // Dibuixar els cossos astronòmics
  for(CosAstronomic c : astres){
    c.display();
  }
  
  // Mostra el panell informatiu del cos astronòmic
  displayInfo(50, 50, astres[numAstre]);
}


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
  
  // Dibuixa les dades del cos astronòmic (bloc 2 - propietats físiques)
  text(String.valueOf(c.masa), x + marginLeft, y + 440 + lineHeight*0);
  text(String.valueOf(c.volum), x + marginLeft, y + 440 + lineHeight*1);
  text(String.valueOf(c.densitat), x + marginLeft, y + 440 + lineHeight*2);
  text(String.valueOf(c.gravetat), x + marginLeft, y + 440 + lineHeight*3);
  
  // Dibuixa les dades del cos astronòmic (bloc 3 - propietats orbitals)
  text(String.valueOf(c.radiOrbita), x + marginLeft, y + 655 + lineHeight*0);
  text(String.valueOf(c.periodeOrbita), x + marginLeft, y + 655 + lineHeight*1);
  text(String.valueOf(c.periodeRotacio), x + marginLeft, y + 655 + lineHeight*2);
  text(String.valueOf(c.excentricitat), x + marginLeft, y + 655 + lineHeight*3);
}

void keyPressed(){
  if((keyCode==RIGHT || keyCode==UP) && (numAstre<numTotalAstres-1)){
    numAstre++;
  }
  else if((keyCode==LEFT || keyCode==DOWN) && (numAstre>0)){
    numAstre--;
  }
}
