
// Variable de Mosaic
Mosaic m;

// Noms de les imatges
String[] noms = {"camera.png", "cocktail.png", "maleta.png",
                 "map.png", "xoquins.png", "mascara.png",
                 "patos.png"};

void setup(){
  
  size(800,800);
  
  // Inicialitza el mosaic
  m = new Mosaic(50,50,700,600, 3, 3);
  // Assigna les imatges al mosaic
  m.setImages(noms);
}

void draw(){
  
  background(200);
  
  // Dibuixa el mosaic
  m.display();
}

void mousePressed(){
  // Comprovar si clicam sobre les imatges del mosaic
  m.checkImgs();
}
