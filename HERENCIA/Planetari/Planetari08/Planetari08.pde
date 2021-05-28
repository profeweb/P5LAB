/*
  Planetari v8.0
  Completar la Subclasse.
  Satèl·lit. Atributs addicionals.
*/

// Variables de classe Satèl·lit
Satelit lluna, deimos;

void setup(){
  size(800,800);
  
  // Instanciació d'objectes Estrella
  
  Estrella sol = new Estrella("Sol", "2609", 'G', -26.8);
  
  // Instanciació d'objectes Planeta

  Planeta terra = new Planeta( "Terra", "2641" , TipusPlaneta.ROCOS, sol); 
  Planeta mart  = new Planeta( "Mart" , "2642" , TipusPlaneta.ROCOS, sol);
  
  // Instanciació d'objectes Satèl·lit

  lluna = new Satelit("Lluna", "2600", TipusSatelit.NATURAL, terra);
  lluna.print();
  
  deimos = new Satelit("Deimos", "0000", TipusSatelit.NATURAL, mart);
  deimos.print();
}

void draw(){
  
  background(255);
  
  // Dibuixa els objectes Satèl·lit
  
  lluna.display(width/2, height/3);
  deimos.display(width/2, 2*height/3);
  
}
