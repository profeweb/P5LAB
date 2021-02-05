
// Variable de Mosaic
Mosaic m;

// Botó
Button bShuffle;

// Ruta de la carpeta on hi ha les imatges
String carpetaImatges ="D:\\GITHUB\\P5 LAB\\P5LAB\\GUI\\mosaic_002\\data";

void setup(){
  
  size(800,800);
  
  // Inicialitza el mosaic
  m = new Mosaic(50,50,700,600, 3, 3);
  
  // Llegeix els noms de les imatges
  String[] noms = listFileNames(carpetaImatges);
  println("Imatges de la carpeta:");
  printArray(noms);
  
  // Assigna les imatges al mosaic
  m.setImages(noms);
  
  // Creació del Botó
  bShuffle = new Button("SHUFFLE", 50, height-120, 200, 80);
  
}

void draw(){
  
  background(200);
  
  // Dibuixa el mosaic
  m.display();
  
  // Indica quantes imatges es mostren del total
  textSize(34); textAlign(RIGHT);
  text(m.getNumImatges()+"/"+m.getNumTotalImatges()+ " imatges", 750, 750);
  
  // Dibuixa el botó
  bShuffle.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  
  if(bShuffle.mouseOverButton()){
    m.mesclaImatges();
  }
}

// Modifica el cursor
void updateCursor(){
  
  if(bShuffle.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
