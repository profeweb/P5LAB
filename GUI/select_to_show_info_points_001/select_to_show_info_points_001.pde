// Components de la GUI
// Select Desplegable

// Selects de la GUI
Select s;

// Opció seleccionada (-1: cap)
int n = -1;

// Valors dels Selects
String[] infoSelect;

// Dimensions dels botons
float selectW = 300, selectH = 30;

// Array de Punts
Punt[] punts;


void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
    // Crea l'array de Punts
  punts = new Punt[5];
  
  // Emplena l'array de Punts
  punts[0] = new Punt("A", 5, -3, 0);
  punts[1] = new Punt("B", 15, 30, 10);
  punts[2] = new Punt("C", -5, 3, 0);
  punts[3] = new Punt("D", 0, 13, 20);
  punts[4] = new Punt("E", 11, 4, -10);
  
  infoSelect = new String[punts.length];
  
  // Crea l'array d'informació a partir dels punts
  infoSelect = new String[punts.length];
  for(int i=0; i<punts.length; i++){
    infoSelect[i] = punts[i].getNom();
  }
  
  // Creació dels selects
  s = new Select(infoSelect, width/4, height/4, selectW, selectH);
}

void draw(){
  
  // Fons de la finestra
  background(255);
  
  fill(0); textSize(24);
  text("Selecciona un punt per mostrar-ne la seva informació.", 100, 100);
  text("Pitja fora per ocultar el punt que es mostri.", 100, 140);
  
  // Mostra informació del punt seleccionat
  if(n!=-1){
    punts[n].dibuixaInfo(width - 260,height - 300, 250, 250);
  }
  
  // Dibuixa el select
  s.display();
  
  
  // Actualitza forma del cursor
  updateCursor();
  
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  // Si pitjam sobre el select
  if(s.mouseOverSelect() && s.enabled){
    if(!s.collapsed){
      s.update();      // Actualitzar valor
      n = s.clickedOption(); 
    }
    s.toggle();        // Plegar o desplegar
  }
  // Si pitjam fora, reseteam el select
  else {
    s.reset();
    n = -1;
  }
}

// Modifica el color segons Select 1
void updateColor(){
  if(s.selectedValue=="RED"){

  }
  else if(s.selectedValue=="GREEN"){

  }
  else if(s.selectedValue=="BLUE"){

  }
}

 // Modifica el cursor
void updateCursor(){
  if((s.mouseOverSelect() && s.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
}
