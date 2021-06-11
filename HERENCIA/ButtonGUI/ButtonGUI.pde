/*
    ButtonGUI v1.0
    Botó senzill d'interfície gràfica.
*/

// Botó de la GUI
Boto b;

// Color de fons
color bgColor = color(50);

void setup(){
  
  size(800, 600);
  smooth(10);
  
  // Instanciant els botó de la interfície gràfica
  b  = new Boto("bNextOn.svg", "bNextOut.svg", width/2, height/2, 120);
}

void draw(){
  
  // Fons 
  background(bgColor);
  
  // Dibuixa el cursor
  if(b.mouseDinsBoto()){
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }
  
  // Dibuixa el botó
  b.display();
}

void mousePressed(){
  
  // Si pitjam dins el botó
  if(b.mouseDinsBoto()){
    bgColor = color(random(255), random(255), random(255));
  }
}
