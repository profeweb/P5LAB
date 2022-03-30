void setup(){
  size(800,800);
  
  // Connexió
  connexioBBDD();
  
  // Número de files d'una taula
  int n = getNumRowsTaula("continente");
  println("\nFiles Continente:"+n);
  
  // Dades d'una taula
  String[][] dades1 = getInfoTaulaContinente();
  println("\nDades Taula Continente:");
  printArray2D(dades1);
  
  // Num Files (Paisos d'Europa)
  int np = getNumRowsPaisosContinente(2);
  println("\nNum Paisos d'Europa:"+np);
  
  // Paisos de Europa
  String[][] dades2 = getInfoTaulaPaisos(2);
  println("\nDades Taula Pais (2 - Europa):");
  printArray2D(dades2);
  
  // Insereix un nou Lugar
  insertLugar("Museo Reina Sofia", "Museo de Arte Contemporaneo...", "Madrid");
  
}

void draw(){
}
