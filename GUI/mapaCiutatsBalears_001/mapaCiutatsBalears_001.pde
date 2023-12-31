
// Imatge del mapa
PShape baseMap;

// Conjunt de localitzacions
LocationSet l;

// Localització seleccionada
Location selectedLoc;

float xcm=0, xcM=0;

// Dades de ciutats
String info[][]= {
  {"Manacor", "MAN", "3.210713", "39.568628", "madrid.jpg"},
  {"Eivissa", "EIV", "1.430586", "38.910193", "nyc.jpg"},
  {"Maó", "MAO", "4.260208", "39.889040", "sidney.jpg"},
  {"Palma", "PAL", "2.649952", "39.570064", "sidney.jpg"},
};

void setup() {
  size(1600, 900);
  
  // Carregam imatge del mapa
  baseMap = loadShape("MapaBalears.svg");
  
  // Creació de les localitzacions
  l = new LocationSet(info);
  
  // Inicialment res seleccionat
  selectedLoc = null;
}


void draw() {
  
  background(200, 100, 100);
  
  fill(200);
  rect(50, 50, width-100, height-100);
  
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
