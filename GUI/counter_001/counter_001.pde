// Components de la GUI
// Comptadors

// Comptadors de la GUI
Counter cr, cg, cb;

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
  
  // Creació dels botons
  cr = new Counter(icona1, icona2, width/4, height/4, counterW, counterH);
  cg = new Counter(icona1, icona2, width/4, height/2, counterW, counterH);
  cb = new Counter(icona1, icona2, width/4, 3*height/4, counterW, counterH);
  
}

void draw(){
  
  // Fons de la finestra
  background(bgColor);
  
  // Dibuixa els botons
  cr.display();
  cg.display();
  cb.display();
  
  // Actualitza forma del cursor
  updateCursor();
}

// En cas de pitjar el ratolí
void mousePressed(){
  cr.update();
  cg.update();
  cb.update();
  
  bgColor = color (cr.value, cg.value, cb.value);
}


// Modifica el cursor
void updateCursor(){
  
  if(cr.mouseOverButtons() || cg.mouseOverButtons()|| cb.mouseOverButtons()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
