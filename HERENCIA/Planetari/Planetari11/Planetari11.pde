/*
  Planetari v11.0
  Array de cossos astronòmics.
  Instanciació amb dades reals.
  Dibuix de panell informatiu.
  Dibuix de tots els cossos astronòmics.
*/

// Array de cossos astronòmics
CosAstronomic[] astres;

// Número de Cossos Astronòmics
int numTotalAstres = 11;

// Número de l'Astre seleccionat
int numAstre = 0;

// Imatge SVG del panell informatiu
PShape panell;

// Imatge JPG fons espai
PImage fons;

// Fonts per mostrar textos
PFont font1, font2;

void setup(){
  
  //size(1800, 800, P3D);
  fullScreen(P3D);
  background(0);
  smooth(10);
  
  // Creació de l'Array de Cossos Astronòmics
  astres = new CosAstronomic[numTotalAstres];
  
  // Instanciació del Sol (Estrella)
  Estrella sol = new Estrella("Sol", "2609", 'G', -26.8f );
  sol.setImage("sun.svg");
  sol.setPosicio(width/2, height/2, -10);
  sol.setPropsFisiques(1.9891e30, 1.4123e18, 1.41, 274, 696340);
  sol.setPropsOrbitals(0.1628, 2.25e18, 27, 0);
  // Guardar el Sol a l'array d'astres
  astres[0] = sol;
  
  // Instanciació de Mercuri (Planeta)
  Planeta mercuri = new Planeta("Mercuri", "2641", TipusPlaneta.ROCOS, sol);
  mercuri.setImage("mercury.svg");
  mercuri.setPosicio(1*width/3, height/3, 0);
  mercuri.setPropsFisiques(1, 2, 3, 4, 5);
  mercuri.setPropsOrbitals(6, 7, 8, 9);
  // Guardar Mercuri a l'array d'astres
  astres[1] = mercuri;
  
  // Instanciació de Venus (Planeta)
  Planeta venus = new Planeta("Venus", "2640", TipusPlaneta.ROCOS, sol);
  venus.setImage("venus.svg");
  venus.setPosicio(1*width/3, 1*height/2, 0);
  venus.setPropsFisiques(4.867e24, 9.38e11, 5240, 8.87, 6051.8);
  venus.setPropsOrbitals(0.723, 225, 116.75, 0.007);
  // Guardar Venus a l'array d'astres
  astres[2] = venus;
  
  // Instanciació de la Terra (Planeta)
  Planeta terra = new Planeta("Terra", "2641", TipusPlaneta.ROCOS, sol);
  terra.setImage("earth.svg");
  terra.setPosicio(1*width/3, 2*height/3, 0);
  terra.setPropsFisiques(5.973e24, 1.0832e12, 5.515, 9.780327, 6378.1);
  terra.setPropsOrbitals(0.9998555, 365.25, 0.99726, 0.016711233);
  // Guardar la Terra a l'array d'astres
  astres[3] = terra;
  
  // Instanciació d'un Satèl·lit
  Satelit lluna = new Satelit("Lluna", "263E", TipusSatelit.NATURAL, terra);
  lluna.setImage("moon.svg");
  lluna.setPosicio(1*width/3 -200, 2*height/3, 0);
  lluna.setPropsFisiques(7.349e22, 2.1958e10, 3.34, 1.62, 1737.1);
  lluna.setPropsOrbitals(0.002573566, 27.321527, 0.99726, 0.044);
  // Guardar la Lluna a l'array d'astres
  astres[4] = lluna;
  
  // Instanciació de Mart (Planeta)
  Planeta mart = new Planeta("Mart", "2642", TipusPlaneta.ROCOS, sol);
  mart.setImage("mars.svg");
  mart.setPosicio(width/2, 1*height/3, 0);
  mart.setPropsFisiques(6.4185e23, 1.6318e11, 3.9335, 3.711, 3389.5);
  mart.setPropsOrbitals(1.523662, 686.971, 0.093315, 0.093315);
  // Guardar Mart a l'array d'astres
  astres[5] = mart;
  
  // Instanciació de Júpiter (Planeta)
  Planeta jupiter = new Planeta("Júpiter", "2643", TipusPlaneta.GASOS, sol);
  jupiter.setImage("jupiter.svg");
  jupiter.setPosicio(width/2, 2*height/3, 0);
  jupiter.setPropsFisiques(1, 2, 3, 4, 5);
  jupiter.setPropsOrbitals(6, 7, 8, 9);
  // Guardar Júpiter a l'array d'astres
  astres[6] = jupiter;
  
  // Instanciació de Saturn (Planeta)
  Planeta saturn = new Planeta("Saturn", "2644", TipusPlaneta.GASOS, sol);
  saturn.setImage("saturn.svg");
  saturn.setPosicio(2*width/3, 1*height/3, 0);
  saturn.setPropsFisiques(5.688e26, 8.27e23, 690, 10.44, 58.232);
  saturn.setPropsOrbitals(9.537, 378.1, 0.4400231, 0.05648);
  // Guardar Saturn a l'array d'astres
  astres[7] = saturn;
  
  // Instanciació de Urà (Planeta)
  Planeta ura = new Planeta("Urà", "2645", TipusPlaneta.GASOS, sol);
  ura.setImage("uranus.svg");
  ura.setPosicio(2*width/3, 1*height/2, 0);
  ura.setPropsFisiques(1, 2, 3, 4, 5);
  ura.setPropsOrbitals(6, 7, 8, 9);
  // Guardar Urà a l'array d'astres
  astres[8] = ura;
  
  // Instanciació de Neptú (Planeta)
  Planeta neptu = new Planeta("Neptú", "2646", TipusPlaneta.GASOS, sol);
  neptu.setImage("neptun.svg");
  neptu.setPosicio(2*width/3, 2*height/3, 0);
  neptu.setPropsFisiques(1.024e26, 6.254e23, 1.64, 11.15, 24624);
  neptu.setPropsOrbitals(30.1, 60190, 0.67152777, 0.011214269);
  // Guardar Neptú a l'array d'astres
  astres[9] = neptu;
  
  // Instanciació de Plutó (Planeta)
  Planeta pluto = new Planeta("Plutó", "2647", TipusPlaneta.NAN, sol);
  pluto.setImage("pluto.svg");
  pluto.setPosicio(2*width/3 + 200, 1*height/2, 0);
  pluto.setPropsFisiques(1.25e22, 8.27e23, 1750, 0.6, 1195);
  pluto.setPropsOrbitals(29.67, 90580.065, 6.375, 0.244);
  // Guardar Plutó a l'array d'astres
  astres[10] = pluto;
  
  // Carrega fitxers multimèdia de la Interfície (Imatges, fonts, ...)
  loadMedia();
    
}


void draw(){
  
  // Fons 
  dibuixaFons();
  
  // Dibuixar els cossos astronòmics 
  for(int i=0; i<numTotalAstres; i++){
    astres[i].display();
  }
  
  // Dibuixa el panell informatiu del cos astronòmic seleccionat (numAstre)
  displayInfo(50, 50, astres[numAstre]);
}

// Dibuixa la imatge de fons
void dibuixaFons(){
  background(0);
  pushMatrix();
    translate(width/2, height/2, -1000);
    scale(2);
    imageMode(CENTER);
    image(fons, 0, 0);
  popMatrix();
}


// Carrega els fitxers multimèdia (imatges, fonts, ...)
void loadMedia(){
  
  // Imatges SVG de la interfície gràfica
  panell = loadShape("panel.svg");
  
  // Imatge de fons
  fons = loadImage("nebula.jpg");
  
  // Fonts per als textos informatius
  font1 = createFont("Starge.ttf", 40);
  font2 = createFont("Nasa.ttf", 24);
  
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
  
  text(String.format("%.5e", c.masa)+" kg", x + marginLeft, y + 440 + lineHeight*0);
  text(String.format("%.4e", c.volum)+" km3", x + marginLeft, y + 440 + lineHeight*1);
  text(String.format("%.2e", c.densitat)+" kg/m3", x + marginLeft, y + 440 + lineHeight*2);
  text(String.format("%.3f", c.gravetat)+ " m/s2", x + marginLeft, y + 440 + lineHeight*3);
  
  // Dibuixa les dades del cos astronòmic (bloc 3 - propietats orbitals)
  text(String.format("%.5f", c.radiOrbita)+" ua", x + marginLeft, y + 655 + lineHeight*0);
  text(String.format("%.4e", c.periodeOrbita)+ " d", x + marginLeft, y + 655 + lineHeight*1);
  text(String.format("%.5f", c.periodeRotacio) + " d", x + marginLeft, y + 655 + lineHeight*2);
  text(String.format("%.5f", c.excentricitat), x + marginLeft, y + 655 + lineHeight*3);
}

// Utilitza el teclat per moure's en l'astre seleccionat de l'array
void keyPressed(){
  
  if((keyCode==RIGHT || keyCode==UP) && (numAstre<numTotalAstres-1)){
    // Següent astre a l'array
    numAstre++;
  }
  else if((keyCode==LEFT || keyCode==DOWN) && (numAstre>0)){
    // Anterior astre a l'array
    numAstre--;
  }
}
