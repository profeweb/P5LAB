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
      
        // Sol·lictam una query
        msql.query( "SELECT * FROM unitat" );
        
        // Recorrem les files de la resposta a la query
        while (msql.next()){
            String s = msql.getString("nom");   // Agafam la columna nom
            int n = msql.getInt("numero");      // Agafam la columna numero
            println(n + "   " + s);
        }
    }
    else {
      // La connexió ha fallat!!!
      println("Connection failed !");
    }
}
