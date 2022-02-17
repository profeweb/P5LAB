Coet c;

void setup(){
  size(800, 800);
  c = new Coet(new PVector(width/2, height/2));
}

void draw(){
  background(255);
  c.run();
  
  fill(0); textSize(24);
  text("Life: "+ (c.lifetime - c.geneCounter), 100, 100);
}

void mousePressed(){
  c = new Coet(new PVector(width/2, height/2));
}
