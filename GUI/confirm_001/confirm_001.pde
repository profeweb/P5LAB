// Components de la GUI

// Confirm
Confirm c;

// Dimensions del Confirm 
float compW = 600;
float compH = 340;

// Textos del Confirm
String title = "Confirma!";
String message = "Vols canviar el color de fons?";

// Color del fons
color colFons = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació del Confirm
  c = new Confirm(title, message, 100, 100, compW, compH);
}

void draw(){
 
  background(colFons);
  
  // Dibuixa el PopUp
  c.display();
  
  // Actualitza cursor
  updateCursor();
  
}

void mousePressed(){
  
  if(c.bAceptar.mouseOverButton() && c.bAceptar.enabled){
    c.setVisible(false);
    colFons = color(random(255), random(255), random(255));
  }
  else if(c.bCancelar.mouseOverButton() && c.bCancelar.enabled){
    c.setVisible(false);
  }
  else {
    c.setVisible(true);
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((c.bAceptar.mouseOverButton() && c.bAceptar.enabled) ||
     (c.bCancelar.mouseOverButton() && c.bCancelar.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
