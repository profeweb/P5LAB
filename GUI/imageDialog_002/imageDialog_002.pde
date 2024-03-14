enum DISTRIBUCIO {TRESxTRES, DOSxDOS, DOS_HORITZ};
Canvas c;

// Capa de dibuix
PGraphics dibuix;
color colorDibuix = color(255, 0, 0);

// Darrera imatge carregada
PImage img;
String titol="";

// Botó
Button bImg, bReset;

void setup(){
    size(800,800);
  
  // Creació del Botons
  bImg = new Button("IMAGE", 50, height-120, 200, 80);
  bReset = new Button("RESET", 300, height-120, 200, 80);
  
  // Creació del canvas
  c = new Canvas(10, 10, 500, 500);
  
  // Crea el dibuix buit
  dibuix = createGraphics(500, 500);
  
}


void draw(){
  
  background(200);
  
  // Dibuixa el canvas
  c.display();
  
  // Dibuixa el dibuix
  if(dibuix!=null){
    image(dibuix, 10, 10, 500, 500);
  }
  
  
  // Dibuixa la darrera imatge carregada
  rect(600, 10, 100, 100);
  if(img!=null){
    image(img, 600, 10, 100, 100);
    fill(0); textSize(10);
    text("Darrera imatge carregada", 600, 120);
  }
  
  
  // Dibuixa el tipus de distribució
  textSize(18); fill(0);
  text(c.distribucio.toString(), 100, 600);
  
  // Dibuixa els botons
  bImg.display();
  bReset.display();
  
  // Actualitza el cursor
  updateCursor();
}


// Fa el dibuix del color corresponent
void ferDibuix(color c){
  dibuix.beginDraw();
  dibuix.fill(c);
  dibuix.noStroke();
  dibuix.circle(mouseX, mouseY, 50);
  dibuix.endDraw();
}

void keyPressed(){
  // Canvia el color del dibuix
  if(key=='c' || key=='C'){
    colorDibuix = color(random(255), random(255), random(255));
  }
}

void mousePressed(){
  // Selecciona una nova imatge
  if(bImg.mouseOverButton()){
    selectInput("Selecciona una imatge ...", "fileSelected");
  }
  // Resetea el dibuix i el canvas
  else if(bReset.mouseOverButton()){
    dibuix = createGraphics(500, 500);
    c.resetCanvas();
  }
}

void mouseDragged(){
  if(mouseX>10 && mouseX<510 && mouseY>10 && mouseY<510){
    ferDibuix(colorDibuix);
  }
}


// Modifica el cursor
void updateCursor(){
  if(bImg.mouseOverButton() || bReset.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
}
