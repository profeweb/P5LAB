// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "sueños";


// Connexió
void connexioBBDD(){
    
    msql = new MySQL( this, "localhost", database, user, pass );
    
    // Si la connexió s'ha establert
    if (msql.connect()){
      // La connexió s'ha establert correctament
      println("Connexió establerta :)");
    }
    else {
      // La connexió ha fallat!!!
      println("Error de Connexió :(");
    }
}

// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula){
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Obté la informació d'una taula Etiqueta
String[][] getInfoTaulaEtiqueta(){
  int numFil = getNumRowsTaula("etiqueta");
  int numCol = 2;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM etiqueta" );
  while (msql.next()){
      info[nr][0] = String.valueOf(msql.getInt("id"));
      info[nr][1] = msql.getString("nombre");
      nr++;
  }
  return info;
}

// Obté la informació d'una taula Categoria
String[][] getInfoTaulaCategoria(){
  int numFil = getNumRowsTaula("categoria");
  int numCol = 2;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM categoria" );
  while (msql.next()){
      info[nr][0] = String.valueOf(msql.getInt("id"));
      info[nr][1] = msql.getString("nombre");
      nr++;
  }
  return info;
}

// Imprimeix contingut array 2D
void printArray2D(String[][] dades){
  for(int f=0; f<dades.length; f++){
    for(int c=0; c<dades[f].length; c++){
      print(dades[f][c]+" \t ");
    }
    println();
  }
}
