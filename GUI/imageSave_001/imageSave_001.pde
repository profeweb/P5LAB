import java.io.IOException;
import java.nio.file.*;

// Imatge
PImage img;
PGraphics pg;

// Nom del fitxer imatge
String titol="imatge.png";

// Botó
Button b;

// Carpeta on guardar les imatges
String ruta = "C:\\Users\\tonim\\Documents\\CODE\\P5LAB\\GUI\\imageSave_001\\data";

void setup(){
  
  size(800,800);
  
  // Creació del Gràfic on dibuixar
  pg = createGraphics(700, 600);
  pg.beginDraw();
  pg.background(255);
  //pg.endDraw();
  
  // Creació dels Botons
  b = new Button("SAVE", 300, height-120, 200, 80);
  
}

void draw(){
  
  background(200);
  
  // Dibuixa la imatge
  image(pg.get(), 50, 50, 700, 600);
  
  // Dibuixa els botons
  b.display();
  
  // Actualitza el cursor
  updateCursor();
  
  // Actualitza la imatge
  updateImatge();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b.mouseOverButton()){
    // Copiam la imatge
    pg.endDraw();
    guardar(pg, ruta, titol);
  }
}

// Modifica imatge
void updateImatge(){
  if(mousePressed){
    pg.ellipse(mouseX - 50, mouseY - 50, 5, 5);
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
