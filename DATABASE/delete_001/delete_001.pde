// ELIMINA DADES DE LA BBDD

void setup(){
  
  size(1200, 900);      // Dimensions de la Pantalla
  
  connexioBBDD();       // Connexió a la BBDD
  
  setGUI();             // Crea els components de la GUI
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
