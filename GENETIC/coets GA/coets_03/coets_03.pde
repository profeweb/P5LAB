// Número d'elements
int numCoets = 10;

// Pobació de coets
Coet[] coets;

// Index del millor coet
int millorCoet;

// Temps transcorregut i de vida
int time = 0;
int lifetime = 800;

// Destí 
PVector target;
boolean hitTarget;

void setup() {
  size(800, 800);
  
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
    for (int i=0; i<coets.length; i++) {
      // Mou i visualitza el coet i-èssim
      coets[i].run(target, i);
    }
  } 
  else {
    
    // Avalua els coets
    avaluacio();
    
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
  // Resetea població
  init(numCoets);
  // Abilita bucle
  loop();
}
