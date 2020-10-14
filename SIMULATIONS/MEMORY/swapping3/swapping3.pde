// Gestió de Memòria
// Amb certa compactació


Memory memory;
Proces p0, p1, p2, p3, p4, p5, p6;

void setup(){
  
  size(1400,800);
  
  memory = new Memory(1024);
  
  p0 = new Proces("SO", color(0,0,255), 512);
  p1 = new Proces("P1", color(255, 0, 0), 64);
  p2 = new Proces("P2", color(255, 255, 0), 128);
  p3 = new Proces("P3", color(255, 0, 255), 256);
  p4 = new Proces("P4", color(0, 255, 255), 64);
  p5 = new Proces("P5", color(155, 255, 60), 128);
  p6 = new Proces("P6", color(255, 60, 155), 16);
  
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
  
  if(frameCount == 500){
    memory.swapIn(p4); // Afegim el procés P3 a la memòria
  }
  
  if(frameCount == 600){
    memory.swapOut(p3); // Llevam el procés P3 de la memòria
  }
  
  if(frameCount == 700){
    memory.swapIn(p5); // Afegim el procés P5 a la memòria
    //memory.swapIn(p6); // Afegim el procés P6 a la memòria
  }
  
}

void keyPressed(){
  if(key=='c' || key=='C'){
    memory.compacta();
  }
}
