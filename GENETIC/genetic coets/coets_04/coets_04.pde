int num = 10;
Coet[] coets;
ArrayList<Coet> mating;
int generacio;
int millorCoet;

int time = 0;
int lifetime = 800;

PVector target;
boolean hitTarget;

void setup() {
  size(800, 800);
  target = new PVector(width/2, height/4);
  init();
}

void draw() {
  background(255);
  time++;

  // Mentre no hi ha hit i hi ha vida
  if (!hitTarget && time<lifetime) {
    for (int i=0; i<num; i++) {
      coets[i].run(target, i);
    }
  } else {
    avaluacio();
    selection();

    fill(0); 
    textSize(18); 
    textAlign(LEFT);
    text("Millor:"+millorCoet, 100, 150);
    coets[millorCoet].display(millorCoet);

    noLoop();
  }

  fill(0); 
  textSize(18); 
  textAlign(LEFT);
  text("Life: "+ time, 100, 100);

  ellipse(target.x, target.y, 50, 50);
}

// Inicialitza
void init() {

  coets = new Coet[num];
  for (int i=0; i<num; i++) {
    coets[i] = new Coet(new PVector(width/2, height-100));
  }

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

void selection() {
  // Clear the ArrayList
  mating.clear();

  // Calculate total fitness of whole population
  float maxF = getMaxFitness();

  for (int i = 0; i < coets.length; i++) {
    float fNormal = map(coets[i].getFitness(), 0, maxF, 0, 1);
    int n = (int) (fNormal * 100);
    for (int j = 0; j < n; j++) {
      mating.add(coets[i]);
    }
  }
}

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

void mousePressed() {
  init();
}
