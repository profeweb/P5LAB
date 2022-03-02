// Número d'Elements
int numColors = 20;
// Número de Generació
int generacio = 0;
// Número d'Elements a Seleccionar
int numSelecs = 5;

// Població inicial
Color[] poblacio;

// Avaluacions de la població
float[] avaluacio;

// Posicions dels millors exemplars
int[] posMillors;

// Millors exemplars seleccionats
Color[] millors;

// Exemplars creuats
Color[] creuats;


float wItem, hItem;
boolean acabar = false;
Color desti;

void setup() {
  size(1600, 900);
  desti = new Color(255, 255, 0);
  
  // Inicialització de la Població
  init(numColors);
}

void draw() {
  background(255);

  // Avaluació de la Població
  avalua();
  // Miram si ja hem acabat
  if (!acaba()) {
    // Seleccionam els millors
    selecciona();
    // Els creuam
    creua();
    // Ocorre certa mutació
    muta();
  }
  // Visualitzam el procés
  display();
  noLoop();
}

// Inicialitza la Població
void init(int num) {
  poblacio = new Color[num];
  for (int i=0; i<poblacio.length; i++) {
    poblacio[i] = new Color();
  }

  wItem = (width - 10) / (float)poblacio.length;
  hItem = 80;

}

// Avalua la Població
void avalua() {
  avaluacio = new float[poblacio.length];
  for (int i=0; i<avaluacio.length; i++) {
    avaluacio[i] = poblacio[i].distance(desti);
  }
}

// Selecció dels millors exemplars
void selecciona() {
  posMillors = posicioMillors(numSelecs);
  millors = new Color[numSelecs];
  for (int i=0; i<millors.length; i++) {
    millors[i] = poblacio[posMillors[i]];
  }
}

// Creuament dels millors exemplars
void creua() {
  creuats = new Color[poblacio.length];
  for (int i=0; i<creuats.length; i++) {
    Color c1 = millors[i%millors.length];
    Color c2 = millors[(i+1)%millors.length];
    creuats[i] = c1.creua(c2);
  }
}

// Mutació
void muta() {
}

// Comprovació d'acabament
boolean acaba() {
  int posMillor = posicioMillor();
  acabar = avaluacio[posMillor]<5;
  return acabar;
}

// Posició del millor
int posicioMillor() {
  float bestAval = Float.MAX_VALUE;
  int bestPos = -1;
  for (int i=0; i<avaluacio.length; i++) {
    if (avaluacio[i] < bestAval) {
      bestAval = avaluacio[i];
      bestPos = i;
    }
  }
  return bestPos;
}

// Posició del millor sense repetició
int posicioMillor(int[] exclou) {
  float bestAval = Float.MAX_VALUE;
  int bestPos = -1;
  for (int i=0; i<avaluacio.length; i++) {
    if (avaluacio[i] < bestAval && 
      !hiEs(i, exclou)) {
      bestAval = avaluacio[i];
      bestPos = i;
    }
  }
  return bestPos;
}

// Posicions dels n millors
int[] posicioMillors(int n) {

  int[] posicions = new int[n];
  for (int i=0; i<n; i++) {
    posicions[i] = -1;
  }

  for (int t=0; t<n; t++) {
    int p = posicioMillor(posicions);
    posicions[t] = p;
  }

  return posicions;
}

// Comprovació de si un valor és a un array
boolean hiEs(int value, int[] array) {
  for (int i=0; i<array.length; i++) {
    if (array[i]==value) {
      return true;
    }
  }
  return false;
}

// Visualització de Generació
void display() {
  fill(0); textSize(44); textAlign(CENTER);
  text("GENERACIÓ "+generacio, width/2, 60);
  displayColors(poblacio, 80);
  
  textSize(18);
  text("Avaluació", width/2, 182);
  displayAvaluacio(185);
  
  text("Selecció", width/2, 285);
  displayMillors(288);
  
  text("Creuament", width/2, 385);
  displayColors(creuats, 390);
 

  if (acabar) {
    fill(0); 
    textAlign(CENTER); 
    textSize(24);
    text("END", width/2 - wItem, height-50);
    
    Color cMillor = poblacio[posicioMillor()];
    cMillor.display( width/2, height-50, wItem, hItem);
  }
}

// Visualitza un array de colors
void displayColors(Color[] array, float y) {
  for (int i=0; i<array.length; i++) {
    array[i].display(i*wItem + 5 + wItem/2, y + hItem/2, wItem, hItem);
  }
}

// Visualitza l'array d'avaluacions
void displayAvaluacio(float y) {
  for (int i=0; i<avaluacio.length; i++) {
    pushStyle();
    rectMode(CORNER); fill(255);
    rect(i*wItem + 5, y, wItem, hItem);
    textAlign(CENTER); fill(0); textSize(12);
    text(avaluacio[i], i*wItem + 5 + wItem/2, y + hItem/2);
    popStyle();
  }
}

void displayMillors(float y) {
  for (int i=0; i<millors.length; i++) {
    pushStyle();
    Color c = millors[i];
    float n = (float)posMillors[i];
    fill(c.getColor()); rectMode(CORNER);
    rect(n*wItem + 5, y, wItem, hItem);
    popStyle();
  }
}


void keyPressed() {
  if (keyCode==RIGHT) {
      init(numColors);
      loop();
  }
}
