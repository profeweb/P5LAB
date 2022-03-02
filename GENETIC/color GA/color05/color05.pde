// Número d'Elements
int numColors = 20;

// Número de Generació
int generacio = 0;

// Número d'Elements a Seleccionar
int numSelecs = 5;

// Taxa de mutació [0,1]
float taxaMutacio = 0.75;

// Població inicial
Color[] poblacio;

// Descendència resultant
Color[] childhood;

// Avaluacions de la població
float[] avaluacio;

// Posicions dels millors exemplars
int[] posMillors;

// Millors exemplars seleccionats
Color[] millors;

// Exemplars creuats
Color[] creuats;

// Casos on s'aplica mutació
boolean[] mutats;

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

  childhood = new Color[num];
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
  mutats = new boolean[poblacio.length];
  childhood = new Color[poblacio.length];
  for (int i=0; i<poblacio.length; i++) {
    float r = random(1);
    if (r<taxaMutacio) {
      mutats[i] = true;
      childhood[i] = creuats[i].muta();
    } else {
      mutats[i] = false;
      childhood[i] = creuats[i];
    }
  }
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
  
  text("Mutació ("+taxaMutacio+")", width/2, 495);
  displayMutats(500);
  
  text("Descendents", width/2, 605);
  displayColors(childhood, 610);

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

void displayMutats(float y) {
  for (int i=0; i<mutats.length; i++) {
    pushStyle();
    color c = mutats[i] ? color(255, 0, 0) : color(255);
    fill(c); rectMode(CORNER);
    rect(i*wItem + 5, y, wItem, hItem);
    popStyle();
  }
}

// Aplica la seguent generació
void setNextGeneration() {
  for (int i=0; i<creuats.length; i++) {
    poblacio[i] = childhood[i];
  }
}

void keyPressed() {
  if (keyCode==RIGHT) {
    // Si no hem acabat, passar a la seguent generació
    if (!acabar) {
      generacio++;
      setNextGeneration();
      loop();
    }
  }
}
