// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "sueños";


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

// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Número de Somnis de l'usuari ID
int getNumRowsSuenosUsuario(int id) {
  msql.query( "SELECT COUNT(*) AS n FROM sueño WHERE usuario='"+id+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}


// Número de Etiquetas del Sueño ID
int getNumRowsEtiquetasSueno(int ids) {
  msql.query( "SELECT COUNT(*) AS n FROM sueño s, etiquetasueño es, etiqueta e WHERE es.sueño_id=s.id AND es.etiqueta_id=e.id AND s.id='"+ids+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Obté la informació d'una taula Etiqueta
String[][] getInfoTaulaEtiqueta() {
  int numFil = getNumRowsTaula("etiqueta");
  int numCol = 2;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM etiqueta" );
  while (msql.next()) {
    info[nr][0] = String.valueOf(msql.getInt("id"));
    info[nr][1] = msql.getString("nombre");
    nr++;
  }
  return info;
}

// Noms de les etiquetes en orde ascendent
String[] getNomsEtiquetes() {
  int numFiles = getNumRowsTaula("etiqueta");
  String[] info = new String[numFiles];
  int nr=0;
  msql.query( "SELECT nombre FROM etiqueta ORDER BY nombre ASC" );
  while (msql.next()) {
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}

// Noms de les categories en orde ascendent
String[] getNomsCategories() {
  int numFiles = getNumRowsTaula("categoria");
  String[] info = new String[numFiles];
  int nr=0;
  msql.query( "SELECT nombre FROM categoria ORDER BY nombre ASC" );
  while (msql.next()) {
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}

// Dades de Somnis d'un usuari
String[][] getInfoTaulaSomnisUsuari(int idc) {
  int numFil = getNumRowsSuenosUsuario(idc);
  int numCol = 6;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM sueño WHERE usuario='"+idc+"'" );
  while (msql.next()) {
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
String[][] getInfoTaulaCategoria() {
  int numFil = getNumRowsTaula("categoria");
  int numCol = 2;
  String[][] info = new String[numFil][numCol];
  int nr=0;
  msql.query( "SELECT * FROM categoria" );
  while (msql.next()) {
    info[nr][0] = String.valueOf(msql.getInt("id"));
    info[nr][1] = msql.getString("nombre");
    nr++;
  }
  return info;
}

// Imprimeix contingut array 2D
void printArray2D(String[][] dades) {
  for (int f=0; f<dades.length; f++) {
    for (int c=0; c<dades[f].length; c++) {
      print(dades[f][c]+" \t ");
    }
    println();
  }
}

int getIdCategoria(String n) {
  msql.query( "SELECT id FROM categoria WHERE nombre='"+n+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

int getIdUsuario(String n) {
  msql.query( "SELECT id FROM usuario WHERE nombre='"+n+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

int getIdEtiqueta(String e) {
  msql.query( "SELECT id FROM etiqueta WHERE nombre='"+e+"'" );
  msql.next();
  int id = msql.getInt("id");
  return id;
}

// Inserta dades a Somnis
void insertSomni(String f, String l, String d, String t, String u) {
  int idt = getIdCategoria(t);
  int idu = getIdUsuario(u);
  String q="INSERT INTO sueño (id,fecha,lucidez,descripcion,tipo,usuario)VALUES (NULL, '"+f+"', '"+l+"', '"+d+"', '"+idt+"', '"+idu+"')";
  println("INSERT: "+q);
  msql.query(q);
  println("INSERT OK! :)");
}

void updateSomni(int ids, String f, String l, String d, String t, String u) {
  int idt = getIdCategoria(t);
  int idu = getIdUsuario(u);
  String q= "UPDATE sueño SET fecha='"+f+"', lucidez='"+l+"', descripcion='"+d+"', tipo='"+idt+"', usuario='"+idu+"' WHERE id='"+ids+"'";
  println("UPDATE: "+q);
  msql.query(q);
  println("UPDATE OK! :)");
}

void deleteSomni(int id) {
  String q= "DELETE FROM sueño WHERE id='"+id+"'";
  println("DELETE: "+q);
  msql.query(q);
  println("DELETE OK! :)");
}

// SELECTS

String[] getEtiquetasSueno(int ids) {
  int numFiles = getNumRowsEtiquetasSueno(ids);
  String[] info = new String[numFiles];
  msql.query("SELECT e.nombre AS nombre FROM sueño s, etiquetasueño es, etiqueta e WHERE es.sueño_id=s.id AND es.etiqueta_id=e.id AND s.id='"+ids+"'" );
  int nr=0;
  while (msql.next()) {
    info[nr] = msql.getString("nombre");
    nr++;
  }
  return info;
}


// ARRAY To STRING
String array2String(String[] array){
  String s = "";
  for(int i=0; i<array.length; i++){
    s+=array[i];
    if(i<array.length-1){
      s+=",";
    }
  }
  return s;
}


// BÚSQUEDA

// Número de Etiquetas del Sueño ID
int getNumRowsFiltros(String email, String categoria, String etiquetas, String buscar) {
  msql.query( "SELECT COUNT(DISTINCT s.id) AS n FROM sueño s, usuario u, categoria c, etiquetasueño es, etiqueta e WHERE u.id=s.usuario AND s.tipo=c.id AND es.sueño_id=s.id AND es.etiqueta_id=e.id AND c.nombre='"+categoria+"' AND u.email='"+email+"' AND (s.descripcion LIKE '%"+buscar+"%') AND e.nombre IN ("+etiquetas+")");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

String[][] filtraSuenos(String email, String categoria, String etiquetas, String buscar){
  
  int numFilas = getNumRowsFiltros(email, categoria, etiquetas, buscar);
  int numCols = 8;
  String[][] info = new String[numFilas][numCols];
  msql.query("SELECT DISTINCT s.id AS ID, s.titulo As titulo, s.fecha AS fecha, s.descripcion AS resumen, s.lucidez AS lucidez, c.nombre AS categoria, u.email AS email FROM sueño s, usuario u, categoria c, etiquetasueño es, etiqueta e WHERE u.id=s.usuario AND s.tipo=c.id AND es.sueño_id=s.id AND es.etiqueta_id=e.id AND c.nombre='"+categoria+"' AND u.email='"+email+"' AND (s.descripcion LIKE '%"+buscar+"%') AND e.nombre IN ("+etiquetas+")");
  int nr=0;
  while(msql.next()){
    info[nr][0] = String.valueOf(msql.getInt("id"));
    info[nr][1] = msql.getString("titulo");
    info[nr][2] = msql.getString("fecha");
    info[nr][3] = msql.getString("resumen");
    info[nr][4] = msql.getString("lucidez");
    info[nr][5] = msql.getString("categoria");
    info[nr][6] = msql.getString("email");
    info[nr][7] = "";
    nr++;
  }
  return info;

}


int getNumSomnisCategoria(String c){
  int idc = getIdCategoria(c);
  String q = "SELECT COUNT(*) AS n FROM sueño s, categoria c WHERE c.id=s.tipo AND c.id='"+idc+"'";
  msql.query(q);
  msql.next();
  return msql.getInt("n");
}

int getNumSomnisEtiqueta(String e){
  int ide = getIdEtiqueta(e);
  String q = "SELECT COUNT(*) AS n FROM sueño s, etiquetasueño es, etiqueta e WHERE s.id=es.sueño_id AND es.etiqueta_id=e.id AND e.id='"+ide+"'";
  msql.query(q);
  msql.next();
  return msql.getInt("n");
}

int getNumSomnisNoLucidos(){
  return getNumSomnisLucidez("S");
}

int getNumSOmnisLucidos(){
  return getNumSomnisLucidez("S");
}

int getNumSomnisLucidez(String l){
  String q = "SELECT COUNT(*) AS n FROM sueño s WHERE s.lucidez='"+l+"'";
  msql.query(q);
  msql.next();
  return msql.getInt("n");
}

int[] getNumSomnisEtiquetas(String[] es){
  int[] nums = new int[es.length];
  for(int i=0; i<es.length; i++){
    nums[i] = getNumSomnisEtiqueta(es[i]);
  }
  return nums;
}

int[] getNumSomnisCategorias(String[] cs){
  int[] nums = new int[cs.length];
  for(int i=0; i<cs.length; i++){
    nums[i] = getNumSomnisCategoria(cs[i]);
  }
  return nums;
}
