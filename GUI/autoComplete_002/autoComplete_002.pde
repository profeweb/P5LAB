
// Components de la GUI
Button b1, b2;             // Botons
TextList tList1, tList2;   // Llista de textos

String[][] listCountries = {{"0", "Alemania"},
                            {"1", "Angola"},
                            {"2", "Canada"},
                            {"3", "Brasil"},
                            {"4", "Italy"},
                            {"5", "France"},
                            {"6", "Russia"},
                           };

String[][] listLanguages = {{"0", "Alemany"},
                            {"1", "Angolés"},
                            {"2", "Francés"},
                            {"3", "Portugués"},
                            {"4", "Belga"},
                            {"5", "Hungarés"}
                           };

String selectedCountry, selectedLanguage; 

// Dimensions del TextList i Botons
float tListW = 600, tListH = 60;
float buttonW = 120, buttonH = 60;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  
  // Creació de la Llista de Textos
  tList1 = new TextList(listCountries, width/8, height/12, tListW, tListH);
  tList2 = new TextList(listLanguages, width/8, height/3, tListW, tListH);
   
  // Creació del Botó
  b1 = new Button("TRIA", 3*width/4, height/12, buttonW, buttonH);
  b2 = new Button("TRIA", 3*width/4, height/3, buttonW, buttonH);

}

void draw(){
 
  background(205);
  
  // Dibuixa la TextList
  tList2.display();
  tList1.display();
  
  
  // Dibuixa els botons
  b1.display();
  b2.display();
  
  // Actualitza el cursor
  updateCursor();
  
  // Mostra la informació seleccionada
  if(selectedCountry!=null){
    pushStyle();
    textAlign(CENTER); fill(0);
    text("PAIS:"+selectedCountry, width/2, height/2);
    popStyle();
  }
  if(selectedLanguage!=null){
    pushStyle();
    textAlign(CENTER); fill(0);
    text("IDIOMA:"+selectedLanguage, width/2, 2*height/3);
    popStyle();
  }
  
}

// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Pitjam sobre el botó de TRIA
   if(b1.mouseOverButton() && b1.enabled){
     selectedCountry = tList1.selectedValue;
   }
   else if(b2.mouseOverButton() && b2.enabled){
     selectedLanguage = tList2.selectedValue;
   }
   
   // Pitjam damunt el textList
   tList1.textField.isPressed();
   tList1.buttonPressed();
   
   tList2.textField.isPressed();
   tList2.buttonPressed();
   
   if(tList1.textField.selected){
     tList1.update();
     tList2.buttons.clear();
   }
   else if(tList2.textField.selected){
     tList2.update();
     tList1.buttons.clear();
   }
   else{
     tList1.buttons.clear();
     tList2.buttons.clear();
   }
}


// Modifica el cursor
void updateCursor(){  
  if( b1.mouseOverButton() || tList1.mouseOverButtons() ||
      b2.mouseOverButton() || tList2.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}

// Quan pitjam tecla
void keyPressed() {
  
  if(tList1.textField.selected){
    tList1.textField.keyPressed(key, (int)keyCode);
    tList1.update();
  }
  
  if(tList2.textField.selected){
    tList2.textField.keyPressed(key, (int)keyCode);
    tList2.update();
  }
}
