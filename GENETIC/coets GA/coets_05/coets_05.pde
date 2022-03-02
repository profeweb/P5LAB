// Número d'elements
int numCoets = 10;

// Pobació de coets
Coet[] coets;

// Selecció dels millors coets
ArrayList<Coet> mating;

// Descendents dels coets
Coet[] fills;

// Número de generació
int generacio;

// Taxa de mutació
float taxaMutacio = 0.75;

// Index del millor coet
int millorCoet;

// Temps transcorregut i de vida
int time = 0;
int lifetime = 800;

// Destí 
PVector start, target;
boolean hitTarget;

void setup() {
  size(800, 800);
  
  // Creació del Punt d'Inici
  start = new PVector(width/2, height-100);
  
  // Creació del Destí
  target = new PVector(width/2, height/4);
  
  // Inicialitza la població
  init(numCoets);
}

void draw() {
  background(255);
  
  // passa el temps
  time++;

  // Mentre no hi ha hit i hi ha vida
  if (!hitTarget && time<lifetime) {
    for (int i=0; i<numCoets; i++) {
      // Mou i visualitza el coet i-èssim
      coets[i].run(target, i);
    }
  } else {
    
    // Avalua els coets
    avaluacio();
    
    // Selecciona els millors (proporcionalment)
    seleccio();
    
    // Creuament dels millors (proporcionalment)
    creuament();
    
    // Mutació dels gens dels fills
    mutacio();

    fill(0); 
    textSize(18); 
    textAlign(LEFT);
    text("Millor:"+millorCoet, 100, 150);
    
    // Dibuixa el millor coet
    coets[millorCoet].display(millorCoet);

    // Atura el bucle
    noLoop();
  }

  fill(0); 
  textSize(18); 
  textAlign(LEFT);
  text("Life: "+ time, 100, 100);

  // Dibuixa destí
  ellipse(target.x, target.y, 50, 50);
}

// Inicialitza
void init(int num) {

  coets = new Coet[num];
  for (int i=0; i<num; i++) {
    coets[i] = new Coet(start);
  }

  // Selecció buida
  mating = new ArrayList();

  time = 0;
  hitTarget = false;
  generacio = 0;
}

// Avalua els coets
void avaluacio() {
  for (int i = 0; i < coets.length; i++) {
    coets[i].fitness(target);
  }
  millorCoet = getMillorCoet();
}

// Selecciona els millors
void seleccio() {
  
  // Buida l'anterior selecció
  mating.clear();

  // Calculate total fitness of whole population
  float maxF = getMaxFitness();

  // Per cada coet
  for (int i = 0; i < coets.length; i++) {
    
    // Mapeja l'avaluació entre 0 i 1
    float fNormal = map(coets[i].getFitness(), 0, maxF, 0, 1);
    
    // Normalitza el valor entre 0 i 100
    int n = (int) (fNormal * 100);
    
    // Crea n còpies del coet i-èssim
    // i les afegeix al grup de selecció
    for (int j = 0; j < n; j++) {
      mating.add(coets[i]);
    }
  }
}

// Valor del Millor fitness
float getMaxFitness() {
  float maxF = 0;
  for (int i = 0; i < coets.length; i++) {
    if (coets[i].getFitness() > maxF) {
      maxF = coets[i].getFitness();
    }
  }
  return maxF;
}

// Coet millor (més a prop de Target)
int getMillorCoet() {
  float record = 0;
  int numCoet = -1;
  for (int i = 0; i < coets.length; i++) {
    if (coets[i].getFitness() > record) {
      record = coets[i].getFitness();
      numCoet = i;
    }
  }
  return numCoet;
}

void creuament(){
  
  fills = new Coet[numCoets];
  
  for (int i = 0; i < coets.length; i++) {
    
      // Roda de la fortuna per seleccionar 2 pares
      int m = int(random(mating.size()));
      int p = int(random(mating.size()));
      
      // Agafar 2 pares
      Coet mama = mating.get(m);
      Coet papa = mating.get(p);
      
      // Creua els gens per crear el fill
      PVector[] gensFill = mama.creua(papa);
      
      // Crea el fill i-èssim a partir dels gens
      fills[i] = new Coet(start, gensFill);
    }
}

void mutacio(){
   // Per cada coet fill
   for (int i = 0; i < fills.length; i++) {
     // Aplica mutació
     fills[i].mutate(taxaMutacio);
   }
}

void mousePressed() {
  // Resetea població
  init(numCoets);
  
  // Abilita bucle
  loop();
}
