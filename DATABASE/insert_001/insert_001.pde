// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
TextField n;   // Camp de text
Counter c;     // Comptador
Button b1, b2; // Botons

// Icones dels botons
PImage icona1, icona2;

// Dimensions dels components
int compW = 200, compH = 80;


void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();
  
  // Carregar de les imatges (icones);
  icona1 = loadImage("mes.png");
  icona2 = loadImage("menys.png");
  
  // Creació dels botons
  c = new Counter(icona1, icona2, width/4, height/4, compW, compH);
  c.setValues(0, 100);
  c.setInitialValue(0);
  c.setStepValue(1);
  
  // Creació dels camps de text
  n = new TextField(width/4, height/2, 3*compW, compH);
   
  // Creació dels Botons
  b1 = new Button("Inserir", width/4, 3*height/4, compW, compH);
  b2 = new Button("Reset", 2*width/4, 3*height/4, compW, compH);

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

// Mira si pitjam sobre els camps de text
void mousePressed() {
   n.isPressed();
   c.update();
   
   if(b1.mouseOverButton() && b1.enabled){
     // Agafar els valors dels camps del formulari
     String valorNumero = String.valueOf(c.getValue());
     String valorNom    = n.getValue();
    // Inserir a la BBDD
    insertInfoTaulaUnitat(valorNumero, valorNom);
    // Resetear camps del formulari
    resetFormulari();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    // Resetear camps del formulari
    resetFormulari();
  }
}

// Reset del Formulari
void resetFormulari(){
  c.resetValue();
  n.removeAllText();
}

// Quan pitjam tecla
void keyPressed() {
   n.keyPressed(key, (int)keyCode);
}

// Modifica el cursor
void updateCursor(){
  
  if(c.mouseOverButtons() || b1.mouseOverButton() || b2.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
