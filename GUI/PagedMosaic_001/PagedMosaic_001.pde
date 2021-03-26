
// Variable de Mosaic
PagedMosaic m;

// Noms de les imatges
String[] noms = {"camera.png", "cocktail.png", "maleta.png",
                 "map.png", "xoquins.png", "mascara.png",
                 "map.png", "xoquins.png", "mascara.png",
                 "map.png", "xoquins.png", "mascara.png",
                 "patos.png"};

void setup(){
  
  size(800,800);
  
  // Inicialitza el mosaic
  m = new PagedMosaic(50,50,700,600, 3, 3);
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

void keyPressed(){
  if(keyCode==UP){
    m.nextPage();
    m.update();
    println("PÀGINA:"+m.currentPage);
  }
  else if(keyCode==DOWN){
    m.prevPage();
    m.update();
    println("PÀGINA:"+m.currentPage);
  }
}
