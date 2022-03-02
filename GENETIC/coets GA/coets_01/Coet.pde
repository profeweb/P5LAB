class Coet {

  // Vectors física
  PVector pos, vel, acc;
  float maxforce = 0.05;

  // Mida
  float r;

  // Informació Genètica
  PVector[] genes;
  int geneCounter;
  
  // Temps de vida
  int lifetime = 1000;

  //constructor
  Coet(PVector p) {
    this.acc = new PVector();
    this.vel = new PVector();
    this.pos = p.copy();
    this.r = 10;

    // Material genètic aleatori
    geneCounter = 0;
    genes = new PVector[lifetime];
    for (int i = 0; i < genes.length; i++) {
      float angle = random(TWO_PI);
      genes[i] = new PVector(cos(angle), sin(angle));
      genes[i].mult(random(0, maxforce));
    }
  }

  void run() {
    // Si encara té temps de vida
    if(geneCounter<lifetime){
      // Aplica força
      applyForce(genes[geneCounter]);
      geneCounter++;
      // Actualitza posició
      update();
    }
    // Dibuixa
    display();
  }

  // Aplica força
  void applyForce(PVector f) {
    acc.add(f);
  }

  // Actulalitza magnituds físiques 
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  // Dibuixa
  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(175); stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    triangle(0, -r*2, -r, r*2,r, r*2);
    popMatrix();
  }
}
