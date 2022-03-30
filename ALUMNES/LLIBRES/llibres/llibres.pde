void setup(){
  size(800,800);
  
  // Connexió a la BBDD (Libros)
  connexioBBDD();
  
  // Número de files d'una taula (Editorial)
  int nf = getNumRowsTable("editorial");
  println("Num.Files Editorial:"+nf);
  
  // Dades d'una taula (Editorial)
  String[][] dades = getInfoTaulaEditorial();
  for(int f=0; f<dades.length; f++){
    for(int c=0; c<dades[f].length; c++){
      print(dades[f][c]+"\t");
    }
    println();
  }
  
  // Num. Autor d'una nacionalitat determinada (p.ex: España).
  int na = getNumRowsAutorNacionalitat("España");
  println("Num.Autors España:"+na);
  
  // Dades dels Llibres d'un editorial determinat (p.ex: ANAYA).
  
}

void draw(){
}
