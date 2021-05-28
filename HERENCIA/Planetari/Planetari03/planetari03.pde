/*
  Planetari v3.0
  Introducció de la Subclasse.
  Estrella. Atributs bàsics.
*/

// Variables de classe Estrella
Estrella e1, e2;

void setup(){
  
  size(800,800);
  
  // Instanciació d'objectes Estrella  
  
  e1 = new Estrella( "Sol", "2609", 'G', -26.8f );
  e1.setMasa(64547);
  e1.print();

  e2 = new Estrella( "Canopus", "2605", 'F', -1.47f);
  e2.print();
}

void draw(){
  
  background(255);
  
  // Dibuixa els objectes Estrella
  e1.display(width/2, height/3);
  e2.display(width/2, 2*height/3);
}
