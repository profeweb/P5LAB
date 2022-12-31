
// Components de la GUI
Button b1;               // Botó
SelectTextList tList1;   // Select amb textos

String selectedCountry; 
String[][] listCountries = {{"0", "Alemania"},{"1", "Algola"},{"2", "Aanada"},
                            {"3", "Brasil"},{"4", "Italy"},{"5", "France"},
                            {"6", "Russia"},
                           };

// Dimensions del TextList i Botons
float tListW = 600, tListH = 60;
float buttonW = 120, buttonH = 60;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Creació de la Llista de Textos
  tList1 = new SelectTextList(listCountries, width/8, height/12, tListW, tListH);
   
  // Creació del Botó
  b1 = new Button("TRIA", 3*width/4, height/12, buttonW, buttonH);

}

void draw(){
 
  background(205);
  
  // Dibuixa la TextList
  tList1.display();
  
  // Dibuixa els botons
  b1.display();
  
  // Actualitza el cursor
  updateCursor();
  
  // Mostra la informació seleccionada
  if(selectedCountry!=null){
    pushStyle();
    textAlign(CENTER); fill(0);
    text("PAIS:"+selectedCountry, width/2, height/2);
    popStyle();
  }
  
}

// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Pitjam sobre el botó de TRIA
   if(b1.mouseOverButton() && b1.enabled){
     selectedCountry = tList1.selectedValue + "("+tList1.selectedId+")";
   }

   // Pitjam damunt el textList
   tList1.mouseOn();
}


// Modifica el cursor
void updateCursor(){  
  if( b1.mouseOverButton() || tList1.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}

// Quan pitjam tecla
void keyPressed() {
  
  // Actualitzar la llista
  tList1.keyOn();
  
}
