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
  
  // Dades d'una columna (nombre) d'una taula (continente)
  String[] nomsC = getColumn("nombre", "continente");
  println("\nNoms Continents:");
  printArray(nomsC);
  
  // Dades d'una columna (nombre) d'una taula (continente)
  String[] nomsP = getColumn("nombre", "pais");
  println("\nNoms Paisos:");
  printArray(nomsP);
  
  // Insereix un nou Lugar
  //insertLugar("Museo Reina Sofia", "Museo de Arte Contemporaneo...", "Madrid");
  //insertLugar("Nombre", "Descripción", "Madrid");
  
  // Modifica un Lugar
  int idl = getIdLugar("Paseo del Prado");
  println("\nId del Paseo del Prado:"+idl);
  updateLugar(idl,"Paseo del Prado","Paseo Precioso...","Madrid");
  
  // Elimina un Lugar
  //int idl2 = getIdLugar("Nombre");
  //deleteLugar(idl2);
}

void draw(){
}
