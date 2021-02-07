// Imatge
PImage img;
String titol="";

// Botó
Button b;

void setup(){
  
  size(800,800);
  
  // Creació del Botó
  b = new Button("IMAGE", 50, height-120, 200, 80);
  
}

void draw(){
  
  background(200);
  
  // Dibuixa la imatge
  if(img!=null){
    image(img, 50, 50, 700, 600);
    textSize(34); textAlign(RIGHT);
    text(titol, 750, 750);
  }
  else{
    fill(255);
    rect(50, 50, 700, 600);
    textSize(34); textAlign(RIGHT);
    text("Sense imatge", 750, 750);
  }
  
  // Dibuixa el botó
  b.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b.mouseOverButton()){
    // Obrim el dialeg
    selectInput("Selecciona una imatge ...", "fileSelected");
  }
}

// Modifica el cursor
void updateCursor(){
  
  if(b.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
