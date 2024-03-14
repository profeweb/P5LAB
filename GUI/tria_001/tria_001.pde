// Components de la GUI

// Tria de 3 opcions
Tria c;

// Dimensions del Confirm 
float compW = 800;
float compH = 340;

// Textos del Confirm
String title = "Canvia de Color!";
String message = "Tria el nou color de fons";

// Color del fons
color colFons = color(255);

void setup(){
  
  size(1400, 800);      // Dimensions de la Pantalla
  
  // Creació del Tria
  c = new Tria(title, message, 100, 100, compW, compH);
  c.setTextButtons("Vermell","Verd","Blau");
}

void draw(){
 
  background(colFons);
  
  // Dibuixa el PopUp
  c.display();
  
  // Actualitza cursor
  updateCursor();
  
}

void mousePressed(){
  
  if(c.b1.mouseOverButton() && c.b1.enabled){
    c.setVisible(false);
    colFons = color(255, 0, 0);
  }
  else if(c.b2.mouseOverButton() && c.b2.enabled){
    c.setVisible(false);
    colFons = color(0, 255, 0);
  }
  else if(c.b3.mouseOverButton() && c.b3.enabled){
    c.setVisible(false);
    colFons = color(0, 0, 255);
  }
  else {
    c.setVisible(true);
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((c.b1.mouseOverButton() && c.b1.enabled) ||
     (c.b2.mouseOverButton() && c.b2.enabled) ||
     (c.b3.mouseOverButton() && c.b3.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
