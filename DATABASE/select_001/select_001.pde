
// Components de la GUI
Button b1, b2;       // Botons
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

void setup(){
  
  size(1200, 900);      // Dimensions de la Pantalla
  
  connexioBBDD();
  
  // Creació de la Taula
  String[][]info = getInfoTaulaUnitat();
  t = new DataTable(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
   
  // Creació dels Botons
  b1 = new Button("NEXT", 25 + tableW, 240 + tableH, buttonW, buttonH);
  b2 = new Button("PREV", 25 + tableW - buttonW*1.5, 240 + tableH, buttonW, buttonH);

}

void draw(){
 
  background(205);
  
  // Dibuixa la Taula
  t.display(width/8,200, tableW, tableH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza el cursor
  updateCursor();
  
}

// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Si pitjam el botó NEXT
  if(b1.mouseOverButton() && b1.enabled){
    t.nextPage();
  }
  // Si pitjam el botó PREVIOUS
  else if(b2.mouseOverButton() && b2.enabled){
    t.prevPage();
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
