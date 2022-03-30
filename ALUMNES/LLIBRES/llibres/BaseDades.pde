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
int getNumRowsAutorNacionalitat(String pais){
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


// Retorna ID de l'editorial


// Retorna Nom de l'editorial


// Imprimeix contingut array 2D
