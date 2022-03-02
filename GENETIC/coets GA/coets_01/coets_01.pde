// variable Coet
Coet c;

void setup(){
  size(800, 800);
  // Creació del Coet
  c = new Coet(new PVector(width/2, height/2));
}

void draw(){
  background(255);
  
  // Mou i visualitza el coet
  c.run();
  
  // Informació del temps de vida restant
  fill(0); textSize(24);
  text("Life: "+ (c.lifetime - c.geneCounter), 100, 100);
}

void mousePressed(){
  // Resetear el Coet
  c = new Coet(new PVector(width/2, height/2));
}
