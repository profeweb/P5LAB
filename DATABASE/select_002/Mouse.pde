// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Pitjam sobre el botó de FILTRAR
   if(b1.mouseOverButton() && b1.enabled){
     int idUnitat = getIdTaulaUnitat(s.selectedValue);
     String[][]info = getInfoTaulaPreguntaUnitat(idUnitat);
     t = new DataTable(files, columnes);
     t.setHeaders(headers);
     t.setData(info);
     t.setColumnWidths(colWidths);
   }
  // Si pitjam el botó NEXT
  else if(b2.mouseOverButton() && b2.enabled){
    t.nextPage();
  }
  // Si pitjam el botó PREVIOUS
  else if(b3.mouseOverButton() && b3.enabled){
    t.prevPage();
  }
  // Si pitjam sobre el select s
  else if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      // Actualitzar valor
      s.update();      
    }
    // Plegar o desplegar
    s.toggle();        
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton() || b3.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
