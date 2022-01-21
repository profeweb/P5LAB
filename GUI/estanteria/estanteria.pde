Estant e;

String[][] info = {
      {"Quijote", "123", "Cervantes", "Caballeria", "portada00.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada01.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada02.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada03.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada04.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada05.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada06.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada07.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada08.jpg"},
      {"Quijote", "123", "Cervantes", "Caballeria", "portada09.jpg"},
   };

void setup(){
  size(1200, 800);
  
  e = new Estant(1, "Llegits", 150, 150, 800, 500, 3);
  e.afegirLlibres(info);
  e.setColor(color(200, 200, 100));
  e.setButtons("bPrev.png", "bNext.png");
}

void draw(){
  background(200, 100, 100);
  e.display();
  updateCursor();
}

void keyPressed(){
  if (keyCode==LEFT){
    e.prev();
  }
  else if(keyCode==RIGHT){
    e.next();
  }
}

void mousePressed(){
  e.checkButtons();
}

void updateCursor(){
  if(e.checkCursor()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
