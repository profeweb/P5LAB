int num = 10;
Coet[] coets;
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

  time = 0;
  hitTarget = false;
}

// Avalua els coets
void avaluacio() {
  for (int i = 0; i < coets.length; i++) {
    coets[i].fitness(target);
  }
  millorCoet = getMillorCoet();
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
