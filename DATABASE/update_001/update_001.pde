// Llibreria de MySQL i Processing
import de.bezier.data.sql.*;

// Components de la GUI
TextField n;         // Camp de text
Counter c;           // Comptador
Button b1, b2, b3;   // Botons
Select s;            // Seleccionable
PopUp p;             // PopUp

// Icones dels botons
PImage icona1, icona2;

// Dimensions dels components
int compW = 200, compH = 80;

// Dimensions del PopUp
float popW = 600, popH = 340;

// Textos del PopUp
String title = "Informació!";
String message = "S'ha actualitzat la Base de Dades.";

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  connexioBBDD();
  
  // Carregar de les imatges (icones);
  icona1 = loadImage("mes.png");
  icona2 = loadImage("menys.png");
  
  // Creació dels botons
  c = new Counter(icona1, icona2, width/4, height/2 -compH, compW, compH);
  c.setValues(0, 100);
  c.setInitialValue(0);
  c.setStepValue(1);
  
  // Creació del Select
  String[][] selectValues = getInfoTaulaUnitat();
  
  // Creació de la taula
  s = new Select(selectValues, width/8, height/12, 3*compW, compH);
  
  // Creació dels camps de text
  n = new TextField(width/4, 2*height/3 - compH/2, 3*compW, compH);
   
  // Creació dels Botons
  b1 = new Button("Guardar", width/4, 3*height/4, compW, compH);
  b1.setEnabled(false);
  b2 = new Button("Reset", 2*width/4, 3*height/4, compW, compH);
  b2.setEnabled(false);
  b3 = new Button("Editar", 3*width/4, height/12, compW, compH);
  
  // Creació del PopUp
  p = new PopUp(title, message, 250, 250, popW, popH);
  p.setVisible(false);

}

void draw(){
 
  background(255);
  
  fill(200); stroke(0); strokeWeight(10);
  rect(50, 200, width-100, height-250, 25);
  
  // Etiqueta  Número
  fill(0); textSize(38); 
  text("Número:", width/4, height/4 + compH*1.25);
  
  // Etiqueta  Nom
  fill(0); textSize(38); 
  text("Nom:", width/4, 2*height/3 - compH/1.5);
  
  // Dibuixa els camp de text
  n.display();
  
  // Dibuixa el comptador
  c.display();
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  b3.display();
  
  // Dibuixa el select
  s.display();
  
  // Dibuixa el popup
  p.display();
  
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
     String id = s.getSelectedId();
     
    // Actualitzam la BBDD
    updateInfoTaulaUnitat(id, valorNumero, valorNom);
    
    // Resetear camps del formulari
    resetFormulari();
    
     // Desactiva els botons del formulari
    b1.setEnabled(false);
    b2.setEnabled(false);
    
    // Mostram el Popup
    p.setVisible(true);
  }
  else if(b2.mouseOverButton() && b2.enabled){
    // Resetear camps del formulari
    resetFormulari();
  }
  else if(b3.mouseOverButton() && b3.enabled){
    
    // Agafa les dades del Select i les copia als camps del formulari
    n.setValue(s.selectedValue);
    c.setValue(s.selectedIndex);
    
    // Activa els botons del formulari
    b1.setEnabled(true);
    b2.setEnabled(true);
  }
  else if(p.bAceptar.mouseOverButton() && p.bAceptar.enabled){
    p.setVisible(false);
  }
  
  // Si pitjam sobre el select s
  if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      // Actualitzar valor
      s.update();      
      println("Sel: "+s.selectedIndex+", "+s.selectedValue);
    }
    // Plegar o desplegar
    s.toggle();        
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
