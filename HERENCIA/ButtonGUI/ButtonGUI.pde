
// Botó de la Interfície Gràfica
Boto bNext;

// Color de fons
color bgColor = color(50);

void setup(){
  
  size(800, 600, P3D);
  smooth(10);
  
  // Instanciant els botó de la interfície gràfica
  bNext  = new Boto("bNextOn.svg", "bNextOut.svg", width/2, height/2, 120);
    
}


void draw(){
  
  // Fons 
  background(bgColor);
  
  // Dibuixant el botó
  bNext.display();
}

void mousePressed(){
  
  // Si pitjam dins el botó
  if(bNext.isMouseOnButton()){
    
    bgColor = color(random(255), random(255), random(255));
    
  }
}
