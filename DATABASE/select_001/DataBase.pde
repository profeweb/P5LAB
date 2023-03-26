// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "trivio";


// Connexió a la BBDD
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
  
// Obté informació de la taula Unitat
String[][] getInfoTaulaUnitat(){
  
  int numRows = getNumRowsTaula("unitat");
  String[][] data = new String[numRows][2];
  
  int nr=0;
  msql.query( "SELECT * FROM unitat" );
  while (msql.next()){
      data[nr][0] = String.valueOf(msql.getInt("numero"));
      data[nr][1] = msql.getString("nom");
      nr++;
  }
  return data;
}
