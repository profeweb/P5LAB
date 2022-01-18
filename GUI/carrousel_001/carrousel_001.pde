
// Variable de Mosaic
Carrousel c;

// Noms de les imatges
String[] noms = {"camera.png", "cocktail.png", "maleta.png",
                 "map.png", "xoquins.png", "mascara.png",
                 "patos.png"};

void setup(){
  
  size(1000,800);
  
  // Inicialitza el carrousel
  c = new Carrousel(50, 100, 900, 300, 3);
  // Assigna les imatges al carrousel
  c.setImages(noms);
  // Assigna les imatges dels botons al carrousel
  c.setButtons("bPrev.png", "bNext.png");
}

void draw(){
  
  background(200);
  
  // Dibuixa el mosaic
  c.display();
  
  // Actualitza cursor
  updateCursor();
}


void keyPressed(){
  if (keyCode==LEFT){
    c.prev();
  }
  else if(keyCode==RIGHT){
    c.next();
  }
}

void mousePressed(){
  c.checkButtons();
}

void updateCursor(){
  if(c.checkCursor()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
