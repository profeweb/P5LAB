// Informació dels Fitxers
int numFitxers = 0;
int numFitxersMax = 5;
String[] titolFitxers;
String[] rutaFitxers;

// Botó
Button b1, b2;

void setup(){
  
  size(1400,800);
  
  // Array de noms i rutes dels fitxers seleccionats
  titolFitxers = new String[numFitxersMax];
  rutaFitxers  = new String[numFitxersMax];
  
  // Creació del Botó
  b1 = new Button("LOAD FILE", 50, height-120, 200, 80);
  b2 = new Button("RESET FILES", 350, height-120, 250, 80);
  
}

void draw(){
  
  background(200);
  
  // Sense fitxer seleccionat
  if(numFitxers!=0){
    textSize(34); textAlign(LEFT);
    for(int i=0; i<numFitxers; i++){
      text((i+1)+"/"+numFitxersMax+" :"+ titolFitxers[i], 50, 50 + i*50);
    }
  }
  else{
    textSize(34); textAlign(LEFT);
    text("Sense fitxer(s) seleccionat(s)", 50, 50);
  }
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza el cursor
  updateCursor();
}

void mousePressed(){
  // Si pitjam sobre el botó
  if(b1.mouseOverButton() && b1.enabled){
    // Obrim el dialeg de tria del fitxer
    selectInput("Selecciona fitxers ...", "filesSelected");
  }
  else if(b2.mouseOverButton() && b2.enabled){
    // Reseteam els fitxers
    numFitxers = 0;
  }
}

// Modifica el cursor
void updateCursor(){
  
  if(b1.mouseOverButton() || b2.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
