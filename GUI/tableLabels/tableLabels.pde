
TableLabel t;

String[][] info = { {"Titol 1a", "Dada 1" }, {"Titol 1b", "Dada 1" },
                    {"Titol 2a", "Dada 2" }, {"Titol 2b", "Dada 2" },
                    {"Titol 3a", "Dada 3" }, {"Titol 3b", "Dada 3" },
                    {"Titol 4a", "Dada 4" }, {"Titol 4b", "Dada 4" },
                    {"Titol 5a", "Dada 5" }, {"Titol 5b", "Dada 5" },
                    {"Titol 6a", "Dada 6" }, {"Titol 6b", "Dada 6" },
                  };
                  
boolean cursorHand = false;

void setup(){
  size(1200, 800);
  t = new TableLabel(info.length, 25, 25, 800, 600);
  t.setLabelsInfo(info);
  t.setPositions();
}


void draw(){
  background(255);
  
  t.display(); 
  t.displaySelected();
  
  updateCursor();
}

void mousePressed(){
  t.checkClick();
}

void updateCursor(){
  
  cursorHand = t.checkMouseOver();
  
  if(cursorHand){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
