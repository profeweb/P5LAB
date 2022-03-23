// Variable de la Simulació 2
Simulacio02 s2;

void setup(){
  size(700,700);
  smooth(); frameRate(30); 
  
  // Constructor de la Simulació
  s2 = new Simulacio02(this);
}
void draw(){
  background(255);  
  // Dibuixa la gui de la Simulació
  s2.display();
  // Actualitza el servomotor
  s2.updateServo();
}

void mousePressed(){
  // Comprova els clicks sobre la gui (slider)
  s2.checkSlider();
}

void mouseDragged(){
  // Comprova els drags sobre la gui (slider)
  s2.checkSlider();
}
