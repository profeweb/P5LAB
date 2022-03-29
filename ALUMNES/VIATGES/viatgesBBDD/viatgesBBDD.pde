void setup(){
  size(800,800);
  
  // Connexió
  connexioBBDD();
  
  // Número de files d'una taula
  int n = getNumRowsTaula("continente");
  println(n);
  
  // Dades d'una taula
  String[][] dades = getInfoTaulaContinente();
  
  
  
}

void draw(){
}
