// INSEREIX INFO A LA BBDD

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();      // Connexió a la BBDD
  
  setGUI();           // Crea els components de la GUI

}

void draw(){
 
  background(255);
  
  fill(200); stroke(0); strokeWeight(10);
  rect(50, 50, width-100, height-100, 25);
  
  // Etiqueta  Número
  fill(0); textSize(38); 
  text("Número:", width/4, height/4 - 20);
  
  // Etiqueta  Nom
  fill(0); textSize(38); 
  text("Nom:", width/4, height/2 - 20);
  
  // Dibuixa els camp de text
  n.display();
  
  // Dibuixa el comptador
  c.display();
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza el cursor
  updateCursor();
  
}
