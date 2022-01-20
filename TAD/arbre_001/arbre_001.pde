
Arbre a;

float minDx = 50;
float maxDx = 300;

void setup(){
  size(1400, 900);
  
  a = new Arbre();
  for(int i=0; i<15; i++){
    a.addElement((int)random(100));
  }
  
  println("INORDRE: ");
  a.arrel.inordre();
  println("\nPREORDRE: ");
  a.arrel.preordre();
  println("\nPOSTORDRE: ");
  a.arrel.postordre();
}

void draw(){
  background(200, 100, 100);
  a.display(a.arrel, width/2, 100, 50, 0);
}

void mousePressed(){
  a = new Arbre((int)random(100));
  for(int i=0; i<15; i++){
    a.addElement((int)random(100));
  }
}
