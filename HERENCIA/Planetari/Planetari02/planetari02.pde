/*
  Planetari v2.0
  Completar la Superclasse.
  Cos Astronòmic. Atributs addicionals.
*/

// Variables de classe CosAtronomic
CosAstronomic c1, c2, c3, c4;

void setup(){
  size(800,800);
  
  // Instanciació d'objectes CosAstronomic  
  c1 = new CosAstronomic("Terra",Tipus.PLANETA, "2641");
  c1.setMasa(59735e24);
  c1.setGravetat(9.780327);
  c1.setRadiOrbita(0.999855);
  c1.print();

  c2 = new CosAstronomic("Mart",Tipus.PLANETA, "2642");
  c2.setMasa(6.4185e23);
  c2.setGravetat(3.711);
  c2.setRadiOrbita(1.523662);
  c2.print();
  
}

void draw(){
  background(255);
  // Dibuixa els objectes CosAstronomic
  c1.display(width/2, height/3);
  c2.display(width/2, 2*height/3);
}
