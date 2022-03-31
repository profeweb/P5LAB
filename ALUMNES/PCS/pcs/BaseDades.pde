// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";   
String database = "pcs";

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
int getNumRowsTable(String nomTaula) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}


// Número de Components de la categoria
int getNumRowsCompsCategoria(String cat) {
  int idc = getIdFromCategoria(cat);
  msql.query("SELECT COUNT(*) AS n FROM componente WHERE categoria_id LIKE '"+idc+"'");
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}


// Obté la informació d'una taula (Categoria)
String[][] getInfoTaulaCategoria() {

  int numFiles = getNumRowsTable("categoria");
  int numCols = 2;

  String[][] info = new String[numFiles][numCols];

  msql.query("SELECT * FROM categoria");
  int nr=0;
  while (msql.next()) {
    info[nr][0] = String.valueOf(msql.getInt("id"));
    info[nr][1] = msql.getString("nombre");
    nr++;
  }

  return info;
}

// Dades de tots els Autors d'una nacionalitat concreta


// Retorna ID de la categoria
int getIdFromCategoria(String nom){
  msql.query( "SELECT id FROM categoria WHERE nombre='"+nom+"'" );
  msql.next();
  int numRows = msql.getInt("id");
  return numRows;
}

int getIdFromMarca(String nom){
  msql.query( "SELECT id FROM marca WHERE nombre='"+nom+"'" );
  msql.next();
  int numRows = msql.getInt("id");
  return numRows;
}

// Retorna Nom de la categoria
String getNombreFromCategoria(int id){
  msql.query( "SELECT nombre FROM categoria WHERE id='"+id+"'" );
  msql.next();
  return msql.getString("nombre");
}

// Imprimeix contingut array 2D
void printArray2D(String[][] dades) {
  for (int f=0; f<dades.length; f++) {
    for (int c=0; c<dades[f].length; c++) {
      print(dades[f][c]+"\t");
    }
    println();
  }
}

// Insertar categoria
// INSERT INTO categoria (id,nombre) VALUES (NULL,'Monitor');
void insertCategoria(String n){
  String q="INSERT INTO categoria (id,nombre) VALUES (NULL,'"+n+"')";
  println("INSERT:"+q);
  msql.query(q);
  println("INSERT OK");
}

// Insertar componente
void insertComp(String d, String r, float p, String f, String m, String c){
  int idm = getIdFromMarca(m);
  int idc = getIdFromCategoria(c);
  String q="INSERT INTO componente (id,descripcion, recomendacion, precio, imagen, marca_id, categoria_id) VALUES (NULL, '"+d+"', '"+r+"', '"+p+"', '"+f+"', '"+idm+"', '"+idc+"')";
  println("INSERT:"+q);
  msql.query(q);
  println("INSERT OK");

}

// Actualizar categoria
void updateCategoria(int idc, String n ){
  String q = "UPDATE categoria SET nombre = '"+n+"' WHERE id ='"+ idc+"'";
  println("UPDATE:"+q);
  msql.query(q);
  println("UPDATE OK");
}

// Actualizar componente

// Eliminar component
void deleteCategoria(int id){
  String q = "DELETE FROM categoria WHERE id = '"+id+"'";
  println("DELETE:"+q);
  msql.query(q);
  println("DELETE OK");
}
