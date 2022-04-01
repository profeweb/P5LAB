void setup(){
  size(800,800);
   // Connexió
  connexioBBDD();
  
  // Número de files d'una taula
  int n = getNumRowsTaula("etiqueta");
  println("\nNum Etiquetas: " + n);
  
  // Dades d'una taula Etiqueta
  String[][] dades1 = getInfoTaulaEtiqueta();
  println("\nInfo Etiqueta: ");
  printArray2D(dades1);
  
  // Dades d'una taula Categoria
  String[][] dades2 = getInfoTaulaCategoria();
  println("\nInfo Categoria: ");
  printArray2D(dades2);
  
  // Número de somnis de l'usauari ID (1)
  int ns = getNumRowsSuenosUsuario(1);
  println("\nNum Somnis: "+ns);
  
  // Dades d'una taula Sueño d'un Usuari
  String[][] dades3 = getInfoTaulaSomnisUsuari(1);
  println("\nInfo Sueños del Usuario 1: ");
  printArray2D(dades3);
  
  // Dades d'una columna (nombre) d'una taula (continente)
  String[] nomsE = getNomsEtiquetes();
  println("\nNoms Etiquetes:");
  printArray(nomsE);
  
  // Dades d'una columna (nombre) d'una taula (categoria)
  String[] nomsC = getNomsCategories();
  println("\nNoms Categories:");
  printArray(nomsC);
  
  // Inserir somni
  //insertSomni("2022-03-19","N","Resumen del sueño", "Pesadilla", "Paco");

  // Update somni
  //updateSomni(3,"2022-05-24","S","Resumen del sueño2", "Pesadilla", "Paco");
  
  // Delete somni
  //deleteSomni(4);
}

void draw(){
}
