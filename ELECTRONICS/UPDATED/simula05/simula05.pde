// Variable de simulació 04
Simulacio05 s5;

void setup(){ 
  size(1200, 800, P3D); 
  smooth(); frameRate(30);
  
  // Constructor de la Simulació 03
  s5 = new Simulacio05(this);
} 


void draw() { 
  lights(); 
  background(255, 255, 255);
  // Dibuixa la simulació
  s5.display();
  // Actualitza el port sèrie
  //s4.updateSerial();
}

void mousePressed(){
  // Comprova els clicks sobre la gui (sliders)
  s5.checkSliders();
}

void mouseDragged(){
  // Comprova els drags sobre la gui (sliders)
  s5.checkSliders();
}
