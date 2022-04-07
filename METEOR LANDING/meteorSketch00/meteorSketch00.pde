// Variables Globals
PShape baseMap;

void setup() {
  size(1800, 900);
  
  // Carregam imatge del mapa
  baseMap = loadShape("WorldMap.svg");
}

void draw() {
  // Dibuixa el mapa
  shape(baseMap, 0, 0, width, height);
}
