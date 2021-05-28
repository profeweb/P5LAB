
CosAstronomic c1, c2, c3, c4;

void setup(){
  size(800,800);
  
  c1 = new CosAstronomic("Sol", Tipus.ESTRELLA, "2609");
  c1.setPosicio(1, 2, 3);
  c1.setPropsFisiques(1, 2, 3, 4, 5);
  c1.setPropsOrbitals(6, 7, 8, 9);
  
  c1.print();
}

void draw(){
  background(255);
  c1.display(width/2, height/5);
}
