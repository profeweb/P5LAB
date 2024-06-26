// Guarda un fitxer PDF d'alguna cosa dibuixada
import processing.pdf.*;

// Nom i ruta del fitxer PDF
String rutaPDF = "C:\\Users\\tonim\\Downloads\\";
String titolPDF ="output.pdf";

// Botons
Button b;

void setup(){
  
  size(800,800);
  
  // Creació del Botó
  b = new Button("SAVE PDF", width/2 - 125, height/2 -100, 250, 80);

}

void draw(){
  
  background(200);
  
  // Dibuixa els botons
  b.display();

  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b.mouseOverButton()){
    println("Guardant PDF ...");
    savePDF();
    println("PDF Guardat!");
  }

}


// Genera el PDF 
void savePDF(){
  PGraphics pdf = createGraphics(300, 300, PDF, rutaPDF+titolPDF);
  pdf.beginDraw();
  pdf.background(128, 0, 0);
  pdf.line(50, 50, 250, 250);
  pdf.textAlign(CENTER);
  pdf.text("Hello PDF", 150, 150);
  pdf.dispose();
  pdf.endDraw();
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
