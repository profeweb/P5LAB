// Components de la GUI
// Select Desplegable

// Selects de la GUI
Select s1, s2;

// Valors dels Selects
String[] selectValues = {"RED", "GREEN", "BLUE"};
String[] selectValues2 = {"1", "2", "3"};

// Dimensions dels botons
float selectW = 300;
float selectH = 30;

// Color de fons de l'App
color bgColor = color(255);

// Valor numèric
int n = 0;

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Creació dels selects
  s1 = new Select(selectValues, width/3, height/5, selectW, selectH);
  s2 = new Select(selectValues2, width/3, 3*height/5, selectW, selectH);
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els selects
  s1.display();
  s2.display();
  
  // Actualitza forma del cursor
  updateCursor();
  
  // Dibuixa número n
  fill(0); textSize(38);
  text(n, 50, 50);
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
  
  // Si pitjam sobre el select 2
  if(s2.mouseOverSelect() && s2.enabled){
    if(!s2.collapsed){
      s2.update();      // Actualitzar valor
      updateNumber();   // Fer acció amb valor
    }
    s2.toggle();        // Plegar o desplegar
  }
}

// Modifica el color segons Select 1
void updateColor(){
  if(s1.selectedValue=="RED"){
    bgColor = color(255, 0, 0);
  }
  else if(s1.selectedValue=="GREEN"){
    bgColor = color(0, 255, 0);
  }
  else if(s1.selectedValue=="BLUE"){
    bgColor = color(0, 0, 255);
  }
}

// Modificar el número segons Select 2
void updateNumber(){
  n = Integer.parseInt(s2.selectedValue);
}

 // Modifica el cursor
void updateCursor(){
  if((s1.mouseOverSelect() && s1.enabled)||
     (s2.mouseOverSelect() && s2.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
}
