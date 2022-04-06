// Ruta a mostrar
Ruta r;

// Dades de rutes filtrades
String[][] rF;

// Número de ruta a mostrar
int numRandom;

// Número de rutes filtrades
int numResultats;

// Botons
Button bRand, bSig, bAnt;

// Dimensions dels botons
float buttonW = 80;
float buttonH = 50;

void setup() {
  size(1600, 800);

  // Botons
  bRand = new Button("RAND", width- buttonW - 15, 100, buttonW, buttonH);
  bSig = new Button("->", width- buttonW - 15, 160, buttonW, buttonH);
  bAnt = new Button("<-", width- buttonW - 15, 220, buttonW, buttonH);

  // Connecta amb la BBDD
  connexioBBDD();

  // Filtres
  String tipoRuta ="Cultural";
  String fecha1 = "2022-05-10";
  String fecha2 = "2022-05-20";
  String ciudad = "Madrid";

  // Query de filtratge
  rF = filtraRutas(tipoRuta, fecha1, fecha2, ciudad);
  numResultats = rF.length;
  numRandom = (int)random(0, numResultats);

  // Genera la información de la ruta
  setRuta(numRandom);

  // Creació de Link a navegador
  desktop = Desktop.getDesktop();
}

void setRuta(int nR){
  // Constructor de ruta
  r = new Ruta(rF[nR]);
  // Posicions dins la finestra
  r.setLocation(100, 100, 600, 600);
  // Id de la ruta
  int idRuta = Integer.valueOf(r.id);
  // Info de lugares de la ruta
  String[][]info = lugaresRuta(idRuta);
  //printArray2D(info);
  // Setter dels lugares de la ruta
  r.setLugares(info);
}

void draw() {
  
  background(255, 200, 200);

  // Dibuixa els botons
  bRand.display();
  bSig.display();
  bAnt.display();
  
  // Número de Rutes / Ruta seleccionada
  fill(0); textAlign(RIGHT);
  text("Rutes trobades: "+ numResultats, width - 50, 50);
  text("Número Ruta: "+ numRandom, width - 50, 80);

  // Dibuix de la llista de llocs de la ruta
  r.display();

  // Dibuixa el mapa de la ruta
  r.displayMapa(width/2, 100, width/2-200, height-200);

  // Actualitza el cursor
  updateCursor();
}

// Comprova clicks de mouse
void mousePressed() {

  // Comprova clicks sobre Lugares
  r.checkClicks();

  // Click sobre botó de Ruta Random
  if (bRand.mouseOverButton() && bRand.enabled) {
    // Numero aleatori
    numRandom = (int)random(0, numResultats);
    // Ruta en aquesta posició
    setRuta(numRandom);
  }
  else if (bSig.mouseOverButton() && bSig.enabled) {
    // Seguent ruta
    numRandom++;
    numRandom = constrain(numRandom, 0, numResultats-1);
    // Actualitza dades de la ruta
    setRuta(numRandom);
  }
  else if (bAnt.mouseOverButton() && bAnt.enabled) {
    // Anterior ruta
    numRandom--;
    numRandom = constrain(numRandom, 0, numResultats-1);
    // Actualitza dades de la ruta
    setRuta(numRandom);
  }
}

void keyPressed() {
  if (keyCode==LEFT) {
    r.prevPage();
  } else if (keyCode==RIGHT) {
    r.nextPage();
  }
}

// Actualitza el cursor
void updateCursor() {
  if (r.mouseOver() || 
      bRand.mouseOverButton() ||
      bSig.mouseOverButton() || 
      bAnt.mouseOverButton()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
