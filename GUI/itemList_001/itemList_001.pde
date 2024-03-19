ListViewer lv;

void setup(){
  size(800, 800);
  
  lv = new ListViewer(50, 50, 200, 400);
  lv.setNumItems(4);
  
  lv.addItemToList("Hola");
  lv.addItemToList("Hello");
  lv.addItemToList("Uep");
  lv.addItemToList("Aloha");
}

void draw(){
  background(255);
  
  lv.display();
}
