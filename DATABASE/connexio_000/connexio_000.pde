// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

void setup(){
    
    size(100, 100);
  
    // Paràmetres de la connexió
    String user     = "root";
    String pass     = "mitjanit3";   
    String database = "trivio";
    
    // Establim la connexió
    msql = new MySQL( this, "localhost", database, user, pass );
    
    // Si la connexió s'ha establert
    if (msql.connect()){
        // La connexió ha funcionat!!!
        println("Connected to database!!");
    }
    else {
      // La connexió ha fallat!!!
      println("Connection failed !");
    }
}
