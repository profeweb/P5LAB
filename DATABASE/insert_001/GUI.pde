// Components de la GUI
TextField n;   // Camp de text
Counter c;     // Comptador
Button b1, b2; // Botons

// Icones dels botons
PImage icona1, icona2;

// Dimensions dels components
int compW = 200, compH = 80;


void setGUI(){
    // Carregar de les imatges (icones);
  icona1 = loadImage("mes.png");
  icona2 = loadImage("menys.png");
  
  // Creació dels botons
  c = new Counter(icona1, icona2, width/4, height/4, compW, compH);
  c.setValues(0, 100);
  c.setInitialValue(0);
  c.setStepValue(1);
  
  // Creació dels camps de text
  n = new TextField(width/4, height/2, 3*compW, compH);
   
  // Creació dels Botons
  b1 = new Button("Inserir", width/4, 3*height/4, compW, compH);
  b2 = new Button("Reset", 2*width/4, 3*height/4, compW, compH);
}
