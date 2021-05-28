/*
  Planetari v9.0
  Superclasse i Subclasses completades.
  Tipus Enumerats en pestanya diferent.
*/

// Variables Estrella, Planeta i Satelit
Estrella sol;
Planeta terra, mart;
Satelit lluna, deimos;

void setup(){
  
  size(800, 800);
  
  // Instanciació d'una Estrella
  sol = new Estrella ( "Sol", "2609", 'G', -26.8f );
  
  // Instanciació de 2 Planetes
  terra = new Planeta( "Terra", "2641" , TipusPlaneta.ROCOS, sol);
  mart  = new Planeta( "Mart" , "2642" , TipusPlaneta.ROCOS, sol);
  
  // Instanciació de 2 Satèl·lits
  lluna  = new Satelit("Lluna", "2600", TipusSatelit.NATURAL, terra);
  deimos = new Satelit("Deimos","0000", TipusSatelit.NATURAL, mart);
    
  // Impressió de la informació de tots els cossos astronòmics
  sol.print();
  terra.print();
  mart.print();
  lluna.print();
  deimos.print();
}


void draw(){
  background(255);
  
  // Dibuixa els objectes Cossos Astronòmics
  
  sol.display(width/4, height/2);
  
  terra.display(width/2, height/3);
  mart.display(width/2, 2*height/3);
  
  lluna.display(3*width/4, height/3);
  deimos.display(3*width/4, 2*height/3);
}
