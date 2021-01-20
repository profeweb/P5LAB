// Components de la GUI

// PopUp
PopUp p;

// Dimensions del PopUp
float popW = 600;
float popH = 340;

// Textos del PopUp
String title = "Error!";
String message = "Error en la connexió a la BBDD.";

// Imatge de la card
PImage img1, img2;

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Imatges de les Categories
  img1 = loadImage("categoria1.png");
  img2 = loadImage("categoria2.png");
  
  // Creació del PopUp
  p = new PopUp(title, message, 100, 100, popW, popH);
}

void draw(){
 
  background(255);
  
  // Dibuixa el PopUp
  p.display();
  
  // Actualitza cursor
  updateCursor();
  
}

void mousePressed(){
  
  if(p.bAceptar.mouseOverButton() && p.bAceptar.enabled){
    p.setVisible(false);
  }
  else {
    p.setVisible(true);
  }
}

// Modifica el cursor
void updateCursor(){
  
  if((p.bAceptar.mouseOverButton() && p.bAceptar.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
