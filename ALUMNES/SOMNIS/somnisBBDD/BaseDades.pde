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

// Número de Somnis de l'usuari ID
int getNumRowsSuenosUsuario(int id){
  msql.query( "SELECT COUNT(*) AS n FROM sueño WHERE usuario='"+id+"'");
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

// Dades de Somnis d'un usuari
String[][] getInfoTaulaSomnisUsuari(int idc){
  int numFil = getNumRowsSuenosUsuario(idc);
  int numCol = 6;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM sueño WHERE usuario='"+idc+"'" );
  while (msql.next()){
      info[nr][0] = String.valueOf(msql.getInt("id"));
      info[nr][1] = msql.getString("fecha");
      info[nr][2] = msql.getString("lucidez");
      info[nr][3] = msql.getString("descripcion");
      info[nr][4] = String.valueOf(msql.getInt("tipo"));
      info[nr][5] = String.valueOf(msql.getInt("usuario"));
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

int getIdCategoria(String n){
}

// Inserta dades a Somnis
//INSERT INTO sueño (id,fecha,lucidez,descripcion,tipo,usuario) 
// VALUES (NULL, '2022-03-19', 'N', 'Resumen del sueño', '1', '1');
void insertSomni(String f, String l, String d, String t, String u){
  int idt = getIdCategoria(t);
  int idu = getIdUsuario(u);
  String q="INSERT INTO sueño (id,fecha,lucidez,descripcion,tipo,usuario)VALUES (NULL, '"+f+"', '"+l+"', '"+d+"', '"+idt+"', '"+idu+"')";
  msql.query(q);
}
