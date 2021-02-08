
// Components de la GUI
Button b;         // Botons
TextList tList;   // Llista de textos

String[][] listValues = {{"0", "Alemania"},{"1", "Angola"},{"2", "Canada"},
                         {"3", "Brasil"}};

// Dimensions del TextList i Botons
float tListW = 600, tListH = 60;
float buttonW = 120, buttonH = 60;

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  
  // Creació de la Llista de Textos
  tList = new TextList(listValues, width/8, height/12, tListW, tListH);
   
  // Creació del Botó
  b = new Button("TRIA", 3*width/4, height/12, buttonW, buttonH);
  
}

void draw(){
 
  background(205);
  
  // Dibuixa la TextList
  tList.display();
  
  // Dibuixa els botons
  b.display();
  
  // Actualitza el cursor
  updateCursor();
  
}

// Mira si pitjam sobre els botons
void mousePressed() {
   
  // Pitjam sobre el botó de SELECT
   if(b.mouseOverButton() && b.enabled){
     
   }
   
   // Pitjam damunt el textList
   tList.textField.isPressed();
   tList.buttonPressed();
}


// Modifica el cursor
void updateCursor(){  
  if( b.mouseOverButton() || tList.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}

// Quan pitjam tecla
void keyPressed() {
   tList.textField.keyPressed(key, (int)keyCode);
   tList.update();
}
