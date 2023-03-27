// VISUALITZA i FILTRA INFORMACIÓ DE TAULES

void setup(){
  
  size(1400, 900);      // Dimensions de la Pantalla
  
  connexioBBDD();       // Connexió a la BBDD
  
  // Creació de la Taula
  String[][]info = getInfoTaulaPregunta();
  t = new DataTable(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
  
  // Creació del Select
  String[][] selectValues = getInfoTaulaUnitat();
  s = new Select(selectValues, width/8, height/12, 3*compW, compH);
   
  // Creació dels Botons
  b1 = new Button("Filtrar", 3*width/4, height/12, compW, compH);
  b2 = new Button("NEXT", tableW - buttonW, 240 + tableH, buttonW, buttonH);
  b3 = new Button("PREV", tableW - buttonW*2.5, 240 + tableH, buttonW, buttonH);
  
}

void draw(){
 
  background(205);
  
  // Dibuixa la Taula
  t.display(50,200, tableW, tableH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  b3.display();
  
  // Dibuixa el select
  s.display();
  
  // Actualitza el cursor
  updateCursor();
  
}
