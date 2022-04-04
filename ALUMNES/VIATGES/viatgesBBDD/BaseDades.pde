// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "viajes";


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

// Número de Paisos del Continente ID
int getNumRowsPaisosContinente(int id){
  msql.query( "SELECT COUNT(*) AS n FROM pais WHERE continente_id='"+id+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Número de Ciudades del Pais ID
int getNumRowsCiudadesPais(int id){
  msql.query( "SELECT COUNT(*) AS n FROM ciudad WHERE pais='"+id+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Número de Fotos del Lugar ID
int getNumRowsFotosLugar(int idl){
  msql.query( "SELECT COUNT(*) AS n FROM foto WHERE lugar='"+idl+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

int getNumRowsFotosCiudad(int idc){
  msql.query( "SELECT COUNT(*) AS n FROM foto f, lugar l, ciudad c WHERE l.id = f.lugar AND c.id=l.ciudad AND c.id='"+idc+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Número de Lugares de la Ciudad ID
int getNumRowsLugaresCiudad(int id){
  msql.query( "SELECT COUNT(*) AS n FROM lugar WHERE ciudad='"+id+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Obté la informació d'una taula
String[][] getInfoTaulaContinente(){
  int numFil = getNumRowsTaula("continente");
  int numCol = 2;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM continente" );
  while (msql.next()){
      info[nr][0] = String.valueOf(msql.getInt("id"));
      info[nr][1] = msql.getString("nombre");
      nr++;
  }
  return info;
}

// Dades de Països d'un continent
String[][] getInfoTaulaPaisos(int idc){
  int numFil = getNumRowsPaisosContinente(idc);
  int numCol = 2;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT id, nombre FROM pais WHERE continente_id='"+idc+"'" );
  while (msql.next()){
      info[nr][0] = String.valueOf(msql.getInt("id"));
      info[nr][1] = msql.getString("nombre");
      nr++;
  }
  return info;
}

// Retorna ID del continente
int getIdContinente(String n){
  msql.query( "SELECT id FROM continente WHERE nombre='"+n+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

// Retorna ID del pais
int getIdPais(String n){
  msql.query( "SELECT id FROM pais WHERE nombre='"+n+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

String getNombreContinente(int id){
  msql.query( "SELECT nombre FROM continente WHERE id='"+id+"'" );
  msql.next();
  String n = msql.getString("nombre");
  return n;
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

// Retorna ID de la ciudad
int getIdCiudad(String n){
  msql.query( "SELECT id FROM ciudad WHERE nombre='"+n+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

// Retorna ID del lugar
int getIdLugar(String n){
  msql.query( "SELECT id FROM lugar WHERE nombre='"+n+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

// Insereix dades d'un Lugar
void insertLugar(String n, String d, String c){
  int idc = getIdCiudad(c);
  String q= "INSERT INTO lugar (id, nombre, descripcion, ciudad) VALUES (NULL, '"+n+"', '"+d+"', '"+idc+"')";
  println("INSERT: "+q);
  msql.query(q);
  println("INSERT OK! :)");
}

// Update dades d'un Lugar ID
void updateLugar(int id, String n, String d, String c){
  int idc = getIdCiudad(c);
  String q= "UPDATE lugar SET nombre='"+n+"', descripcion='"+d+"', ciudad='"+idc+"' WHERE id='"+id+"'";
  println("UPDATE: "+q);
  msql.query(q);
  println("UPDATE OK! :)");
}

// Elimina dades d'un Lugar ID
void deleteLugar(int id){
  String q= "DELETE FROM lugar WHERE id='"+id+"'";
  println("DELETE: "+q);
  msql.query(q);
  println("DELETE OK! :)");
}

// Dades de la columna c d'una taula t en orde ascendent
String[] getColumn(String c, String t){
  int numFiles = getNumRowsTaula(t);
  String[] info = new String[numFiles];
  int nr=0;
  msql.query( "SELECT "+c+" FROM "+t+" ORDER BY "+c+" ASC");
  while (msql.next()){
      info[nr] = msql.getString(c);
      nr++;
  }
  return info;
}


// SELECTS

String[] getContinents(){
  return getColumn("nombre", "continente");
}

String[] getTiposRutas(){
  return getColumn("nombre", "tipo");
}

String[] getPaisesContinente(String c){
  int idc = getIdContinente(c);
  int numFiles = getNumRowsPaisosContinente(idc);
  String[] info = new String[numFiles];
  String q = "SELECT p.nombre AS nombre FROM pais p, continente c WHERE p.continente_id = c.id AND c.id='"+idc+"'";
  msql.query(q);
  int nr=0;
  while(msql.next()){
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}

String[] getCiutatsPais(String p){
  int idp = getIdPais(p);
  int numFiles = getNumRowsCiudadesPais(idp);
  String[] info = new String[numFiles];
  String q = "SELECT c.nombre AS nombre FROM pais p, ciudad c WHERE p.id = c.pais AND p.id='"+idp+"'";
  msql.query(q);
  int nr=0;
  while(msql.next()){
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}

String[] getLugaresCiudad(String c){
  int idc = getIdCiudad(c);
  int numFiles = getNumRowsLugaresCiudad(idc);
  String[] info = new String[numFiles];
  String q = "SELECT l.nombre AS nombre FROM lugar l, ciudad c WHERE c.id = l.ciudad AND c.id='"+idc+"'";
  msql.query(q);
  int nr=0;
  while(msql.next()){
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}


// Fotos de un Lugar
String[] getFotosLugar(int idl){
  int numFiles = getNumRowsFotosLugar(idl);
  String[] info = new String[numFiles];
  String q = "SELECT f.nombre AS nombre FROM foto f, lugar l WHERE l.id = f.lugar AND l.id='"+idl+"'";
  msql.query(q);
  int nr=0;
  while(msql.next()){
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}

String[] getFotosCiudad(String c){
  int idc = getIdCiudad(c);
  int numFiles = getNumRowsFotosCiudad(idc);
  String[] info = new String[numFiles];
  String q = "SELECT f.nombre AS nombre FROM foto f, lugar l, ciudad c WHERE l.id = f.lugar AND c.id=l.ciudad AND c.id='"+idc+"'";
  msql.query(q);
  int nr=0;
  while(msql.next()){
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}

// Comprueva usuario de BBDD
boolean login(String u, String p){
  String q= "SELECT COUNT(*) AS n FROM usuario "+
            "WHERE nombre='"+u+"' AND password='"+p+"'";
  msql.query(q);
  msql.next();
  return msql.getInt("n")==1;
}
