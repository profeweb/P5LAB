
// Declaració de variables Cercle
Cercle c1, c2;
Punt p1, p2;

void setup(){
  
  size(800,800, P3D);
  textMode(SHAPE);
  smooth(10);
  
  // Instanciant els objectes Punt
  p1 = new Punt("C1", 300, 300, 0);
  p2 = new Punt("C2", 500, 400, 0);
  
  // Instanciant els objectes Cercle
  c1 = new Cercle(p1, 100);
  c2 = new Cercle(p2, 200);
}

void draw(){
  
  background(255);
  
  // Visualitzar els cercles
  c1.display();
  c2.display();
}

void keyPressed(){
  if(keyCode==LEFT){
    c1.radi-=5;
  }
  else if(keyCode==RIGHT){
    c1.radi+=5;
  }
  else if(keyCode==UP){
    p1.y-=10;
  }
}
