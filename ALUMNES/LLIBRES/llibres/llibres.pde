void setup(){
  size(800,800);
  
  // Connexió a la BBDD (Libros)
  connexioBBDD();
  
  // Número de files d'una taula (Editorial)
  int nf = getNumRowsTable("editorial");
  println("Num.Files Editorial:"+nf);
  
  // Dades d'una taula (Editorial)
  String[][] dades = getInfoTaulaEditorial();
  printArray2D(dades);

  
  // Num. Autor d'una nacionalitat determinada (p.ex: España).
  int na = getNumRowsAutorNacionalitat("España");
  println("Num.Autors España:"+na);
  
  // Id del genere novela
  int idn = getIdFromGenere("novela");
  println("\nId del genere novela:"+idn);
  
  // Nom del genere amb id 2
  String ng = getNombreFromGenere(2);
  println("\nNom del genere 2:"+ng);
  
}

void draw(){
}
