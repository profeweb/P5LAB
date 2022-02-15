
int numColors = 10;
int generacio = 0;
int numSelecs = 5;
float tasaMutacio = 0.75;
Color[] poblacio;
Color[] childhood;

float[] avaluacio;
int[] posMillors;
Color[] millors;
Color[] creuats;
boolean[] mutats;

float wItem;
boolean acabar = false;
Color desti;

void setup(){
  size(800, 800);
  desti = new Color(255, 0, 0);
  init(numColors);
}

void draw(){
  avalua();
  if(acabar){ 
    noLoop(); 
  }
  else {
    selecciona();
    creua();
    muta();
  }
  display();
}

// Inicialitza la Població
void init(int num){
  poblacio = new Color[num];
  for(int i=0; i<poblacio.length; i++){
    poblacio[i] = new Color();
  }
  
  wItem = (width - 10) / (float)poblacio.length;
  
  childhood = new Color[num];
}

// Avalua la Població
void avalua(){
  avaluacio = new float[poblacio.length];
  for(int i=0; i<avaluacio.length; i++){
    avaluacio[i] = poblacio[i].distance(desti);
  }
}

// Selecciona
void selecciona(){
  posMillors = posicioMillors(numSelecs);
  millors = new Color[numSelecs];
  for(int i=0; i<millors.length; i++){
    millors[i] = poblacio[posMillors[i]];
  }
}

void creua(){
  creuats = new Color[poblacio.length];
  for(int i=0; i<creuats.length; i++){
    Color c1 = millors[i%millors.length];
    Color c2 = millors[(i+1)%millors.length];
    creuats[i] = c1.creua(c2);
  }
}

void muta(){
  mutats = new boolean[poblacio.length];
  childhood = new Color[poblacio.length];
  for(int i=0; i<poblacio.length; i++){
    float r = random(1);
    if(r<tasaMutacio){
      mutats[i] = true;
      childhood[i] = creuats[i].muta();
    }
    else {
      mutats[i] = false;
      childhood[i] = creuats[i];
    }
  }
}

// Posició del millor
int posicioMillor(){
  float bestAval = Float.MAX_VALUE;
  int bestPos = -1;
  for(int i=0; i<avaluacio.length; i++){
    if(avaluacio[i] < bestAval){
    bestAval = avaluacio[i];
    bestPos = i;
    }
  }
  return bestPos;
}

int posicioMillor(int[] exclou){
  float bestAval = Float.MAX_VALUE;
  int bestPos = -1;
  for(int i=0; i<avaluacio.length; i++){
    if(avaluacio[i] < bestAval && 
       !hiEs(i, exclou)){
    bestAval = avaluacio[i];
    bestPos = i;
    }
  }
  return bestPos;
}

int[] posicioMillors(int n){
  
  int[] posicions = new int[n];
  for(int i=0; i<n; i++){
    posicions[i] = -1;
  }
  
  for(int t=0; t<n; t++){
    int p = posicioMillor(posicions);
    posicions[t] = p;
  }
  
  return posicions;
}

boolean hiEs(int value, int[] array){
  for(int i=0; i<array.length; i++){
    if(array[i]==value){
      return true;
    }
  }
  return false;
}

void display(){
  background(255);
  fill(0); textSize(44); textAlign(CENTER);
  text("GENERACIÓ "+generacio, width/2, 60);
  
  displayColors(poblacio, 80);
  displayAvaluacio(165);
  displayMillors(250);
  displayColors(creuats, 335);
  displayMutats(420);
  displayColors(childhood, 505);
  noLoop();
}

void displayColors(Color[] array, float y){
  for(int i=0; i<array.length; i++){
    array[i].display(i*wItem + 5 + wItem/2, y + wItem/2, wItem);
  }
}

void displayAvaluacio(float y){
  for(int i=0; i<avaluacio.length; i++){
    fill(0);
    rectMode(CORNER); fill(255);
    rect(i*wItem + 5, y, wItem, wItem);
    textAlign(CENTER); fill(0); textSize(12);
    text(avaluacio[i], i*wItem + 5 + wItem/2, y + wItem/2);
  }
}

void displayMillors(float y){
  for(int i=0; i<millors.length; i++){
    Color c = millors[i];
    float n = (float)posMillors[i];
    fill(c.getColor()); rectMode(CORNER);
    rect(n*wItem + 5, y, wItem, wItem);
  }
}

void displayMutats(float y){
  for(int i=0; i<mutats.length; i++){
    color c = mutats[i] ? color(255,0,0) : color(255);
    fill(c); rectMode(CORNER);
    rect(i*wItem + 5, y, wItem, wItem);
  }
}
