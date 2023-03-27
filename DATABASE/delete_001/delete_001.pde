// ELIMINA DADES DE LA BBDD

void setup(){
  
  size(1200, 900);      // Dimensions de la Pantalla
  
  connexioBBDD();       // Connexió a la BBDD
  
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

void draw(){
 
  background(205);
  
  // Dibuixa la Taula
  t.display(width/8,200, tableW, tableH);
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  b3.display();
  
  // Dibuixa el select
  s.display();
  
  // Dibuixa el popup
  p.display();
  
  // Dibuixa el confirm
  c.display();
  
  // Actualitza el cursor
  updateCursor();
  
}
