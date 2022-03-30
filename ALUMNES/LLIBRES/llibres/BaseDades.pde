// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "libros";

// Connexió
void connexioBBDD() {

  msql = new MySQL( this, "localhost", database, user, pass );

  // Si la connexió s'ha establert
  if (msql.connect()) {
    // La connexió s'ha establert correctament
    println("Connexió establerta :)");
  } else {
    // La connexió ha fallat!!!
    println("Error de Connexió :(");
  }
}

// Obté el número de files de la taula (Editorial)
int getNumRowsTable(String nomTaula) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}


// Número de Autors de la nacionalitat
int getNumRowsAutorNacionalitat(String pais) {
  msql.query("SELECT COUNT(*) AS n FROM autor WHERE pais LIKE '"+pais+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}


// Obté la informació d'una taula (Editorial)
String[][] getInfoTaulaEditorial() {

  int numFiles = getNumRowsTable("editorial");
  int numCols = 2;

  String[][] info = new String[numFiles][numCols];

  msql.query("SELECT * FROM editorial");
  int nr=0;
  while (msql.next()) {
    info[nr][0] = String.valueOf(msql.getInt("id"));
    info[nr][1] = msql.getString("nombre");
    nr++;
  }

  return info;
}

// Dades de tots els Autors d'una nacionalitat concreta


// Retorna ID del genere
int getIdFromGenere(String nom){
  msql.query( "SELECT id FROM genero WHERE nombre='"+nom+"'" );
  msql.next();
  int numRows = msql.getInt("id");
  return numRows;
}

// Retorna ID del genere
String getNombreFromGenere(int id){
  msql.query( "SELECT nombre FROM genero WHERE id='"+id+"'" );
  msql.next();
  return msql.getString("nombre");
}


// Retorna Nom de l'editorial


// Imprimeix contingut array 2D
void printArray2D(String[][] dades) {
  for (int f=0; f<dades.length; f++) {
    for (int c=0; c<dades[f].length; c++) {
      print(dades[f][c]+"\t");
    }
    println();
  }
}
