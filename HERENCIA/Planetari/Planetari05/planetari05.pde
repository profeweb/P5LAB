/*
  Planetari v5.0
  Introducció de la Subclasse.
  Planeta. Atributs bàsics.
*/

// Variables de classe Planeta
Planeta p1, p2;

void setup(){
  size(800,800);
  
  // Instanciació d'objectes Estrella
  
  Estrella sol = new Estrella("Sol", "2609", 'G', -26.8);
  
  // Instanciació d'objectes Planeta
  
  p1 = new Planeta( "Terra" , "2641" , TipusPlaneta.ROCOS, sol);
  p1.print();

  p2 = new Planeta( "Mart" , "2642" , TipusPlaneta.ROCOS, sol);
  p2.print();
}

void draw(){
  
  background(255);
  
  // Dibuixa els objectes Planeta
  p1.display(width/2, height/3);
  p2.display(width/2, 2*height/3);
}
