class Coet {

  // Vectors física
  PVector pos, vel, acc;
  float maxforce = 0.05;

  // Mida
  float r;

  
  PVector[] genes;
  int geneCounter;
  int lifetime = 1000;

  //constructor
  Coet(PVector p) {
    this.acc = new PVector();
    this.vel = new PVector();
    this.pos = p.copy();
    this.r = 10;

    geneCounter = 0;
    genes = new PVector[lifetime];
    
    for (int i = 0; i < genes.length; i++) {
      float angle = random(TWO_PI);
      genes[i] = new PVector(cos(angle), sin(angle));
      genes[i].mult(random(0, maxforce));
    }
  }

  void run() {
    if(geneCounter<lifetime){
      applyForce(genes[geneCounter]);
      geneCounter++;
      update();
    }
    display();
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
}
