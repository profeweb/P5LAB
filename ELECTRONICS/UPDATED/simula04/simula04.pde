// Variable de simulació 04
Simulacio04 s4;

void setup(){ 
  size(900, 700, P3D); 
  smooth(); frameRate(30);
  
  // Constructor de la Simulació 03
  s4 = new Simulacio04(this);
} 


void draw() { 
  lights(); 
  background(255, 255, 255);
  // Dibuixa la simulació
  s4.display();
  // Actualitza el port sèrie
  //s4.updateSerial();
}

void mousePressed(){
  // Comprova els clicks sobre la gui (sliders)
  s4.checkSliders();
}

void mouseDragged(){
  // Comprova els drags sobre la gui (sliders)
  s4.checkSliders();
}
