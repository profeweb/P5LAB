// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
// Taula
Table t;

// Dimensions de la taula
float tableW = 800, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 5, columnes = 2;

// Títols de les columnes 
String[] headers = {"Número", "Unitat"};

// Amplades de les columnes
float[] colWidths = {20, 80};

// Dades de la taula
String[][] info;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();
  info = getInfoTaulaUnitat();
  
  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa la taula
  t.display(50, 50, tableW, tableH);
  
}
