// Variable de simulació 03
Simulacio03 s3;

void setup(){ 
  size(900, 700, P3D); 
  smooth(); frameRate(30);
  
  // Constructor de la Simulació 03
  s3 = new Simulacio03(this);
} 


void draw() { 
  lights(); 
  background(255, 255, 255);
  // Dibuixa la simulació
  s3.display();
  // Actualitza el port sèrie
  //s3.updateSerial();
}

void mousePressed(){
  // Comprova els clicks sobre la gui (sliders)
  s3.checkSliders();
}

void mouseDragged(){
  // Comprova els drags sobre la gui (sliders)
  s3.checkSliders();
}
