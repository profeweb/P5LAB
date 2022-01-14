// Components de la GUI
// Array de Filtres

// Filtres de la GUI
SwitchFilterArray sfa;

// Dimensions de la zona de filtres
int sfW = 700;
int sfH = 100;

// Dades dels filtres
String[] info = {"Vegana", "Internacional", "Italiana"};

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800); // Dimensions de la Pantalla
  
  // Creació dels filtres de switch
  sfa = new SwitchFilterArray(50, height/2 - sfH, sfW, sfH);
  
  // Establim les etiquetes (noms) dels filtres
  sfa.setData(info);

}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  sfa.display();
  
  // Actualitza forma del cursor
  updateCursor();
  
  // Visualitzam la informació dels filtres
  fill(0); textSize(18); textAlign(LEFT);
  text("Vegana: "+sfa.getSelectedValue("Vegana"), 100, 600);
  text("Internacional: "+sfa.getSelectedValue("Internacional"), 100, 650);
  text("Italiana: "+sfa.getSelectedValue("Italiana"), 100, 700);
}

// En cas de pitjar el ratolí
void mousePressed(){
  // Actualitzam els filtres
  sfa.updateFilters();
}


// Modifica el cursor
void updateCursor(){
  if(sfa.updateCursor()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
}
