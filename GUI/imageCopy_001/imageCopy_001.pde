import java.io.IOException;
import java.nio.file.*;

// Imatge
PImage img;
String rutaImatge ="";
String titol="";

// Botó
Button b1, b2;

// Carpeta on guardar les imatges
String rutaCopia = "D:\\GITHUB\\P5 LAB\\P5LAB\\GUI\\imageCopy_001\\data";

void setup(){
  
  size(800,800);
  
  // Creació dels Botons
  b1 = new Button("IMAGE", 50, height-120, 200, 80);
  b2 = new Button("SAVE", 300, height-120, 200, 80);
  
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
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b1.mouseOverButton()){
    // Obrim el dialeg
    selectInput("Selecciona una imatge ...", "fileSelected");
  }
  else if(b2.mouseOverButton()){
    // Copiam la imatge
    Path original = Paths.get(rutaImatge);
    Path copia   = Paths.get(rutaCopia+"/"+titol);
    try{
      Files.copy(original, copia);
      println("OK: imatge copiada a la carpeta.");
    } catch (IOException e) {
      println("ERROR: No s'ha pogut copiar la imatge.");
    }

  }
}

// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
