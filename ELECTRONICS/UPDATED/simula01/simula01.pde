Simulacio1 s1;

void setup() { 
  size(1200, 700);
  
  s1 = new Simulacio1();
}

void draw() { 
  background(255);
  s1.display(); 
  s1.updateSerial();
}

void mousePressed(){
  s1.checkButtons();
  s1.checkSliders();
}

void mouseDragged(){
  s1.checkSliders();
}
