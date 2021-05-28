/*
  Planetari v7.0
  Introducció a la Subclasse.
  Satèl·lit. Atributs bàsics.
*/

// Variables de classe Satèl·lit
// ...

void setup(){
  size(800,800);
  
  // Instanciació d'objectes Estrella
  
  Estrella sol = new Estrella("Sol", "2609", 'G', -26.8);
  
  // Instanciació d'objectes Planeta

  Planeta terra = new Planeta( "Terra" , "2641" , TipusPlaneta.ROCOS, sol);
  terra.setAnells(false);
  terra.setNumSatelits(1);
  
  // Instanciació d'objectes Satèl·lit

  // ...
}

void draw(){
  
  background(255);
  
  // Dibuixa els objectes Satèl·lit
  
  // ...
  
}
