void setup(){
  size(800,800);
  
  // Connexió a la BBDD (Libros)
  connexioBBDD();
  
  // Número de files d'una taula (Categoria)
  int nf = getNumRowsTable("categoria");
  println("\nNum.Files Categoria:"+nf);
  
  // Dades d'una taula (Categoria)
  String[][] dades = getInfoTaulaCategoria();
  println("\nTabla Categoria:");
  printArray2D(dades);

  // Num. Componentes d'una categaria (p.ex: Procesador).
  int nc = getNumRowsCompsCategoria("Procesador");
  println("\nNum.Components Procesador:"+nc);
  
  // Id de la categoria Procesador
  int idn = getIdFromCategoria("Procesador");
  println("\nId de categoria Procesador:"+idn);
  
  // Nom de la categoria amb id 2
  String ng = getNombreFromCategoria(2);
  println("\nNom de la categoria 2:"+ng);
  
  // Inserir nova categoria
  
  // Inserir nou component
  
  // Actualitzar categoria
  
  // Actualitzar component
  
  // Eliminar component
  
}

void draw(){
}
