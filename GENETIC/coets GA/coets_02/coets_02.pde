// variable Coet
Coet c;

// Destí
PVector target;

void setup(){
  size(800, 800);
  
  // Creació del Coet
  c = new Coet(new PVector(width/2, height/2));
  
  // Creació del Destí
  target = new PVector(width/2, height/4);
}

void draw(){
  background(255);
  
  // Mou i visualitza el coet
  c.run(target);
  
  // Informació del temps de vida restant
  fill(0); textSize(18);
  text("Life: "+ (c.lifetime - c.geneCounter), 100, 100);
  text("Hit: "+ c.hitTarget, 100, 130);
  
  // Visualitza destí
  ellipse(target.x, target.y, 50, 50);
}

void mousePressed(){
  c = new Coet(new PVector(width/2, height/2));
}
