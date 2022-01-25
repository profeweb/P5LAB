
// Imatge del mapa
PShape baseMap;

// Conjunt de localitzacions
LocationSet l;

// Localització seleccionada
Location selectedLoc;

// Dades de ciutats
String info[][]= {
  {"Madrid", "SPA", "-3.7176", "40.3919", "madrid.jpg"},
  {"New York", "USA", "-74.005974", "40.712776", "nyc.jpg"},
  {"Sidney", "AUS", "151.209290", "-33.868820", "sidney.jpg"},
};

void setup() {
  size(1400, 900);
  
  // Carregam imatge del mapa
  baseMap = loadShape("WorldMap.svg");
  
  // Creació de les localitzacions
  l = new LocationSet(info);
  
  // Inicialment res seleccionat
  selectedLoc = null;
}


void draw() {
  
  background(200, 100, 100);
  
  // Dibuixa el mapa
  shape(baseMap, 50, 50, width-100, height-100);
  
  // Dibuixa les localitzacions
  l.display(50, 50, width-100, height-100);
  
  // Actualitza el cursor
  updateCursor();
  
  // Mostra localització seleccionada
  if(selectedLoc!=null){
    selectedLoc.displayInfo(60, 60, 300, 400);
  }
}


void mousePressed(){
  
  int nl = l.getSelected(50, 50, width-100, height-100);
  if(nl!=-1){
    selectedLoc = l.llocs[nl];
  }
  else {
    selectedLoc = null;
  }
}


void updateCursor(){
  if(l.mouseOverLocations(50, 50, width-100, height-100)){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
