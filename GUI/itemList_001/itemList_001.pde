ListViewer lv;

void setup(){
  size(800, 800);
  
  lv = new ListViewer(50, 50, 200, 510);
  lv.setNumItems(10);
  
  lv.addItemToList("1 Hola");
  lv.addItemToList("2 Hello");
  lv.addItemToList("3 Uep");
  lv.addItemToList("4 Aloha");
  lv.addItemToList("5 Hola");
  lv.addItemToList("6 Hello");
  lv.addItemToList("7 Uep");
  lv.addItemToList("8 Aloha");
  lv.addItemToList("9 Uep");
  lv.addItemToList("10 Aloha");
  lv.addItemToList("11 Uep");
  lv.addItemToList("12 Aloha");
}

void draw(){
  background(255);
  lv.display();
  updateCursor();
}

void mousePressed(){
  lv.buttonPressed();
}

void keyPressed(){
  if(key=='a' || key=='A'){
    int num = lv.items.size() + 1;
    lv.addItemToList(num + " NOU ELEMENT");
  }
}

// Modifica el cursor
void updateCursor(){
  
  if(lv.bUp.mouseOverButton() || lv.bDown.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
