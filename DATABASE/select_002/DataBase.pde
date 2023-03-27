// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "trivio";


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

// Obté el número de files de la query
int getNumRowsQuery(String q){
  msql.query( q);
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Retorna el numero de Unitat de la Unitat amb nom
int getIdTaulaUnitat(String nom){
  String sNom = nom.replace("\'", "\\'");
  String q = "SELECT numero FROM unitat WHERE nom='"+sNom+"'";
  msql.query(q);
  msql.next();
  return msql.getInt("numero");
}
  
// Obté informació de la taula Pregunta
String[][] getInfoTaulaPregunta(){
  
  int numRows = getNumRowsTaula("pregunta");
  
  String[][] data = new String[numRows][2];
  
  int nr=0;
  msql.query("SELECT * FROM pregunta");
  while (msql.next()){
      data[nr][0] = String.valueOf(msql.getInt("numero"));
      data[nr][1] = msql.getString("enunciat");
      nr++;
  }
  return data;
}

// Obté la informació de les Preguntes de la Unitat amb numero
String[][] getInfoTaulaPreguntaUnitat(int numero){
  
  String sNumero = String.valueOf(numero).replace("\'", "\\'");
  String q = "SELECT COUNT(*) AS n FROM pregunta WHERE unitat='"+sNumero+"'";
  println(q);
  int numRows = getNumRowsQuery(q);
  String[][] data = new String[numRows][2];
  
  int nr=0;
  msql.query("SELECT * FROM pregunta WHERE unitat='"+sNumero+"'" );
  while (msql.next()){
      data[nr][0] = String.valueOf(msql.getInt("numero"));
      data[nr][1] = msql.getString("enunciat");
      nr++;
  }
  return data;
}

// Obté tota la informació de la taula Unitat
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
