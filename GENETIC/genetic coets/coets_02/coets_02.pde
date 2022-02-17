Coet c;
PVector target;

void setup(){
  size(800, 800);
  c = new Coet(new PVector(width/2, height/2));
  
  target = new PVector(width/2, height/4);
}

void draw(){
  background(255);
  c.run(target);
  
  fill(0); textSize(18);
  text("Life: "+ (c.lifetime - c.geneCounter), 100, 100);
  text("Hit: "+ c.hitTarget, 100, 130);
  
  ellipse(target.x, target.y, 50, 50);
}

void mousePressed(){
  c = new Coet(new PVector(width/2, height/2));
}
