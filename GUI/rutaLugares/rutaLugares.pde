Lugar lu;
Ruta r;

String[] rutaInfo = { "1",
                  "Museos de Madrid", 
                  "Resumen Ruta.... ", 
                  "Cultural"};

String[][] info = {{ "1",
                  "Museo del Prado", 
                  "Resumen del museo del prado del museo del prado  del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado.... ", 
                  "Madrid", 
                  "40.412671", "3.686130", 
                  "madrid.jpg"},
                  { "2",
                  "Museo Reina Sofia", 
                  "Resumen del reina sofia del museo del prado  del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado.... ", 
                  "Madrid", 
                  "33.412671", "-6.686130",  
                  "madrid.jpg"},
                  { "3",
                  "Museo Reina Sofia", 
                  "Resumen del reina sofia del museo del prado  del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado.... ", 
                  "Madrid", 
                  "42.412671", "-3.686130", 
                  "madrid.jpg"},
                  { "4",
                  "Museo Reina Sofia", 
                  "Resumen del reina sofia del museo del prado  del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado.... ", 
                  "Madrid", 
                  "40.412671", "-12.186130", 
                  "madrid.jpg"},
                  { "5",
                  "Museo Reina Sofia", 
                  "Resumen del reina sofia del museo del prado  del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado del museo del prado.... ", 
                  "Madrid", 
                  "26.412671", "-5.686130", 
                  "madrid.jpg"},
                };

void setup(){
  size(1600, 800);
  
  // Constructor de la Llista de Link
  r = new Ruta(rutaInfo);
  r.setLocation(100, 100, 600, 600);
  r.setLugares(info);
  
  println("MIN LAT:"+r.minLat);
  println("MIN LON:"+r.minLon);
  
  println("MAX LAT:"+r.maxLat);
  println("MAX LON:"+r.maxLon);
  
  // Creació de Link a navegador
  desktop = Desktop.getDesktop();
}

void draw(){
  background(255, 200, 200);
  
  // Dibuix de la llista de Links
  r.display();
  
  r.displayMapa(width/2, 100, width/2-200, height-200);
  
  // Actualitza el cursor
  updateCursor();
}

// Comprova clicks de mouse
void mousePressed(){
  r.checkClicks();
}

void keyPressed(){
  if(keyCode==LEFT){
    r.prevPage();
  }
  else if(keyCode==RIGHT){
    r.nextPage();
  }
}

// Actualitza el cursor
void updateCursor(){
  if(r.mouseOver()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
