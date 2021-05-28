
CosAstronomic c1, c2, c3, c4;
Estrella e1;

void setup(){
  size(800,800);
  
  e1 = new Estrella("Sol", "2609", 'G', -26.8);
  e1.setPosicio(1, 2, 3);
  e1.setPropsFisiques(1, 2, 3, 4, 5);
  e1.setPropsOrbitals(6, 7, 8, 9);
  
  e1.print();
}

void draw(){
  background(255);
  e1.display(width/2, height/5);
}
