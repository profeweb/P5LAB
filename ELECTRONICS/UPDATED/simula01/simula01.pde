// Variable de la Simulació 1
Simulacio01 s1;

void setup() { 
  size(700, 700);
  // Constructor de la Simulació
  s1 = new Simulacio01(this);
}

void draw() { 
  background(255);
  // Dibuixa la gui de la Simulació
  s1.display(); 
}

void mousePressed(){
  // Comprova els clicks sobre la gui 
  // (botons i sliders)
  s1.checkButtons();
  s1.checkSliders();
}

void mouseDragged(){
  // Comprova els drags sobre la gui (sliders)
  s1.checkSliders();
}
