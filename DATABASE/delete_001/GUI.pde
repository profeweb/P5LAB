
// Components de la GUI
Button b1, b2, b3;   // Botons
Select s;            // Seleccionable
PopUp p;             // PopUp
Confirm c;           // Confirmació
DataTable t;         // Taula de BD

// Dimensions de la taula
float tableW = 950, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 5, columnes = 2;

// Títols de les columnes 
String[] headers = {"Número", "Unitat"};

// Amplades de les columnes
float[] colWidths = {20, 80};

// Dimensions dels components
int compW = 200, compH = 80;

// Dimensions del PopUp, Confirm i Botons
float popW = 600, popH = 340;
float confW = 600, confH = 340;
float buttonW = 120, buttonH = 60;

// Textos del PopUp
String title = "Informació!";
String message1 = "S'ha actualitzat la Base de Dades.";
String message2 = "Vols eliminar aquesta informació?";

void setGUI(){
    // Creació de la Taula
  String[][]info = getInfoTaulaUnitat();
  t = new DataTable(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
  
  // Creació del Select
  String[][] selectValues = getInfoTaulaUnitat();
  s = new Select(selectValues, width/8, height/12, 3*compW, compH);
   
  // Creació dels Botons
  b1 = new Button("Eliminar", 3*width/4, height/12, compW, compH);
  b2 = new Button("NEXT", 25 + tableW, 240 + tableH, buttonW, buttonH);
  b3 = new Button("PREV", 25 + tableW - buttonW*1.5, 240 + tableH, buttonW, buttonH);
  
  
  // Creació del PopUp
  p = new PopUp(title, message1, 250, 250, popW, popH);
  p.setVisible(false);
  
  // Creació del Confirm
  c = new Confirm(title, message2, 250, 250, confW, confH);
  c.setVisible(false);
}
