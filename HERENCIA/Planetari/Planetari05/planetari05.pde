
CosAstronomic c1, c2, c3, c4;
Estrella e1;
Planeta p1;

void setup(){
  size(800,800);
  
  e1 = new Estrella("Sol", "2609", 'G', -26.8);
  
  p1 = new Planeta("Terra", "2641", TipusPlaneta.ROCOS, e1, false, 1);
  
  p1.print();
}

void draw(){
  background(255);
  p1.display(width/2, height/5);
}
