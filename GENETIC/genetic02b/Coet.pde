class Coet {

  // Vectors física
  PVector pos, vel, acc;

  // Mida
  float r;

  // Avaluació
  float fitness;
  
  // Cromosoma
  DNA dna;
  
  // To count which force we're on in the genes
  int geneCounter = 0;

  boolean hitTarget = false;   
  
  //constructor
  Coet(PVector p, DNA dna) {
    this.acc = new PVector();
    this.vel = new PVector();
    this.pos = p.copy();
    this.r = 4;
    this.dna = dna;
  }

  // Fitness function
  void fitness() {
    float d = dist(pos.x, pos.y, target.x, target.y);
    fitness = pow(1/d, 2);
  }

  // Run in relation to all the obstacles
  // If I'm stuck, don't bother updating or checking for intersection
  void run() {
    checkTarget(); // Check to see if we've reached the target
    if (!hitTarget) {
      applyForce(dna.genes[geneCounter]);
      geneCounter = (geneCounter + 1) % dna.genes.length;
      update();
    }
    display();
  }

  // Did I make it to the target?
  void checkTarget() {
    float d = dist(pos.x, pos.y, target.x, target.y);
    if (d < 12) {
      hitTarget = true;
    } 
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(0);
    rect(-r/2, r*2, r/2, r);
    rect(r/2, r*2, r/2, r);

    // Rocket body
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();

    popMatrix();
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

}
