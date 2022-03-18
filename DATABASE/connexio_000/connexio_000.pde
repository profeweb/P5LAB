// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

// Objecte de connexió a la BBDD
MySQL msql;

void setup(){
    
    size(100, 100);
  
    // Paràmetres de la connexió
    String user     = "root";
    String pass     = "12345";   
    String database = "trivio";
    // bildwelt?useUnicode=true&characterEncoding=UTF-8 // =latin1
    //useUnicode=true&character_set_server=utf8mb4&useLegacyDatetimeCode=false
    
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
