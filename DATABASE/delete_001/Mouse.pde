
// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Pitjam sobre el botó de BORRAR
   if(b1.mouseOverButton() && b1.enabled){
     
     // Mostra el Confirm
     c.setVisible(true);
   }
   // Pitjam sobre el botó de ACEPTAR del Confirm
   else if(c.bAceptar.mouseOverButton()){
     
     // Amagam el Confirm
     c.setVisible(false);
     
     // Agafar el valor Id del Select
     String id = s.getSelectedId();
     
    // Actualitza la BBDD
    deleteInfoTaulaUnitat(id);
    
    // Recarregar informació al select
    String[][] selectValues = getInfoTaulaUnitat();
    s.setData(selectValues);
    s.reset();
    
    // Mostra el Popup
    p.setVisible(true);
  }
  // Pitjam sobre el botó de CANCELAR del Confirm
  else if(c.bCancelar.mouseOverButton()){
    
    // Amagam el Confirm
    c.setVisible(false);
    
  }
  // Si pitjam el botó NEXT
  else if(b2.mouseOverButton() && b2.enabled){
    t.nextPage();
  }
  // Si pitjam el botó PREVIOUS
  else if(b3.mouseOverButton() && b3.enabled){
    t.prevPage();
  }
  // Si pitjam el botó ACEPTAR del PopUp
  else if(p.bAceptar.mouseOverButton() && p.bAceptar.enabled){
    p.setVisible(false);
  }
  // Si pitjam sobre el select s
  else if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      // Actualitzar valor
      s.update();      
      println("Index: "+s.selectedIndex+",Id: "+s.selectedId+", Text:"+s.selectedValue);
    }
    // Plegar o desplegar
    s.toggle();        
  }
}


// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton() || b3.mouseOverButton() ||
      p.mouseOverButton() || c.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
