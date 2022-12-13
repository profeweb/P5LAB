// Components de la GUI
// Select Color Desplegable

// SelectColor de la GUI
SelectColor s1;

// Colors dels Selects
color[] selectValues = {color(255,0,0), color(0,255,0), color(0,0,255), color(255, 255, 0)};

// Dimensions dels botons
float selectW = 300;
float selectH = 50;

// Color de fons de l'App
color bgColor = color(255);

// Valor numèric
int n = 0;

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació del SelectColor
  s1 = new SelectColor(selectValues, width/4, height/5, selectW, selectH);
}

void draw(){
  
  // Fons de la finestra
  background(255);
  
  // Rectangle del color seleccionat
  fill(s1.selectedValue); noStroke();
  rect(0, height/2, width, height/2);
  
  // Dibuixa els selects
  s1.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  
  // Si pitjam sobre el select 1
  if(s1.mouseOverSelect() && s1.enabled){
    if(!s1.collapsed){
      s1.update();      // Actualitzar valor
      updateColor();    // Fer acció amb valor
    }
    s1.toggle();        // Plegar o desplegar
  }
}

// Modifica el color segons Select 1
void updateColor(){
    bgColor = color(s1.selectedValue);
}

 // Modifica el cursor
void updateCursor(){
  if((s1.mouseOverSelect() && s1.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
}
