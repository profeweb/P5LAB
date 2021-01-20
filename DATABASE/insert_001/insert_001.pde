// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
TextField n;   // Camp de text
Counter c;   // Comptador

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
  
  // Creació dels camps de text
  n = new TextField(width/4, height/2, 2*compW, compH);
   

}

void draw(){
 
  background(255);
  
  // Dibuixa els camp de text
  n.display();
  
  // Dibuixa el comptador
  c.display();
  
}

// Mira si pitjam sobre els camps de text
void mousePressed() {
   n.isPressed();
}

// Quan pitjam tecla
void keyPressed() {
   n.keyPressed(key, (int)keyCode);
}

// Modifica el cursor
void updateCursor(){
  
  if(c.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
