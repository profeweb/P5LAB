
Memory memory;
Proces p0, p1, p2, p3, p4;

void setup(){
  
  size(1400,800);
  
  memory = new Memory(1024);
  
  p0 = new Proces("SO", color(0,0,255), 512);
  p1 = new Proces("P1", color(255, 0, 0), 64);
  p2 = new Proces("P2", color(255, 255, 0), 128);
  p3 = new Proces("P3", color(255, 0, 255), 256);
  p4 = new Proces("P4", color(0, 255, 255), 128);
  
  // Posam el SO a la memòria
  memory.swapIn(p0);
}


void draw(){
  
  background(255);
  
  // Visualitzam el continguta de la memòria
  memory.display();
  
  if(frameCount == 100){
    memory.swapIn(p1); // Afegim el procés P1 a la memòria
  }
  
  if(frameCount == 200){
    memory.swapIn(p2); // Afegim el procés P2 a la memòria
  }
  
  if(frameCount == 300){
    memory.swapIn(p3); // Afegim el procés P3 a la memòria
  }
  
  if(frameCount == 400){
    memory.swapOut(p1); // Llevam el procés P1 de la memòria
  }
  
  // Intenta afegir el procés P4 a la memòria
  if(frameCount == 500){
    memory.swapIn(p4); // No serà possible per manca d'espai compactat!!!
  }
  
}
