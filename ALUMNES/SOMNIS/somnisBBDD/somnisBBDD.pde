void setup(){
  size(800,800);
   // Connexió
  connexioBBDD();
  
  // Número de files d'una taula
  int n = getNumRowsTaula("etiqueta");
  println(n);
  
  // Dades d'una taula Etiqueta
  String[][] dades1 = getInfoTaulaEtiqueta();
  printArray2D(dades1);
  
  // Dades d'una taula Categoria
  String[][] dades2 = getInfoTaulaCategoria();
  printArray2D(dades2);
}

void draw(){
}
