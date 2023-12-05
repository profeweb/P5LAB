
// Figures vàlides
enum Escac {REI_B, REINA_B, ALFIL_B, CAVALL_B, TORRE_B, PEO_B, 
            REI_N, REINA_N, ALFIL_N, CAVALL_N, TORRE_N, PEO_N, 
            BUIDA};

// Tauler d'escacs
Tauler t;

void setup(){
  size(900, 900);
  
  // Constructor del tauler
  int marge = 50;
  t = new Tauler(marge, marge, width-2*marge);
  t.setImatges();
  t.colocaFigures();
}


void draw(){
  background(155);
  
  // Dibuixa el tauler
  t.display();
}

void mousePressed(){
  // Selecciona caselles del tauler
  t.casellaMouse();
}

void keyPressed(){
  if(key=='m' || key=='M'){
    // Aplica la jugada seleccionada
    t.mouJugada();
  }
}
