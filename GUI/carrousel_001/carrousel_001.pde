
// Variable de Mosaic
Carrousel c;

// Noms de les imatges
String[] noms = {"camera.png", "cocktail.png", "maleta.png",
                 "map.png", "xoquins.png", "mascara.png",
                 "patos.png"};

void setup(){
  
  size(1000,800);
  
  // Inicialitza el mosaic
  c = new Carrousel(50,100,900,300, 3);
  // Assigna les imatges al mosaic
  c.setImages(noms);
}

void draw(){
  
  background(200);
  
  // Dibuixa el mosaic
  c.display();
}


void keyPressed(){
  if (keyCode==LEFT){
    c.prev();
  }
  else if(keyCode==RIGHT){
    c.next();
  }
}
