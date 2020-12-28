// Elements GUI
// Pissarra amb 2 equips de 5 pins

Pissarra p;

void setup(){
  size(800,800);
  // Crear la pissarra
  p = new Pissarra(50, 50, 700,700);
}

void draw(){
  background(255);
  // Dibuixa la pissarra
  p.display();
  // Dibuixa els pins
  p.displayPins();
}


void mouseDragged(){
  // Comprova si ha de moure algun pin
  p.checkPinsMotion();
}

void keyPressed(){
  if(key=='r' || key=='R'){
    // Resetea les posicions dels pins
    p.resetPinPositions();
  }
}
