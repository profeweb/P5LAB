// Components de la GUI
// Comptadors

// Comptadors de la GUI
Counter c1, c2;

// Icones dels botons
PImage icona1, icona2;

// Dimensions dels botons
float counterW = 200, counterH = 80;

// Color de fons de l'App
color bgColor = color(255);

void setup(){
  
  size(800, 800);      // Dimensions de la Pantalla
  
  // Carregar de les imatges (icones);
  icona1 = loadImage("mes.png");
  icona2 = loadImage("menys.png");
  
  // Creació dels counters
  
  // Counter 1: va de 1 a 10 amb valor inicial de 1.
  c1 = new Counter(icona1, icona2, width/4, height/4, counterW, counterH);
  c1.setValues(1, 10);
  c1.setInitialValue(1);
  
  // Counter 2: va de 0 a 3, amb valor inicial de 3.
  c2 = new Counter(icona1, icona2, width/4, height/2, counterW, counterH);
  c2.setValues(0, 3);
  c2.setInitialValue(3);
  
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  c1.display();
  c2.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  c1.update();
  c2.update();
}


// Modifica el cursor
void updateCursor(){
  
  if(c1.mouseOverButtons() || c2.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
