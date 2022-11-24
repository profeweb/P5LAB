
// Variable ShowImage
ShowImage s;

// Noms de les imatges
String[] noms = {"camera.png", "cocktail.png", "maleta.png",
                 "map.png", "xoquins.png", "mascara.png", "patos.png"};

void setup(){
  
  size(1000,800);
  
  // Inicialitza el ShowImage
  s = new ShowImage(50, 50, 700, 700, 3);
  
  // Assigna les imatges al ShowImage
  s.setImages(noms);
}

void draw(){
  
  background(200);
  
  // Dibuixa el ShowImage
  s.display();
  
}
