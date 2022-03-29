void setup(){
  size(800,800);
   // Connexió
  connexioBBDD();
  
  // Número de files d'una taula
  int n = getNumRowsTaula("etiqueta");
  println(n);
  
  // Dades d'una taula
  String[][] dades = getInfoTaulaEtiqueta();
  printArray2D(dades);
}

void draw(){
}
