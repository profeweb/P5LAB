Estant e;

String[][] info = {
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
      {"Quijote", "123", "Cervantes", "Caballeria", ""},
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
