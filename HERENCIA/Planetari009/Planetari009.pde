

// Tipus de Cosos Astronòmics (enumerat)
enum Tipus {ESTRELLA, PLANETA, SATELIT, COMETA, COSMENOR};

// Tipus de Planetes (enumerat)
enum TipusPlaneta { ROCOS, GASOS, NAN};

// Tipus de Satèl·lits (enumerat)
enum TipusSatelit {NATURAL, PASTOR,  TROIA, COORBITAL, ASTEROIDAL};


// Variables Estrella, Planeta i Satelit
Estrella sol;
Planeta terra, mart;
Satelit lluna, deimos;

void setup(){
  
  // Instanciació d'una Estrella
  sol = new Estrella ( "Sol", "2609", 'G', -26.8f );
  
  // Instanciació de 2 Planetes
  terra = new Planeta( "Terra", "2641" , TipusPlaneta.ROCOS, sol);
  mart  = new Planeta( "Mart" , "2642" , TipusPlaneta.ROCOS, sol);
  
  // Instanciació de 2 Satèl·lits
  lluna  = new Satelit("Lluna", "2600", TipusSatelit.NATURAL, terra);
  deimos = new Satelit("Deimos","0000", TipusSatelit.NATURAL, mart);
    
  // Impressió de la informació dels 2 Satèl·lits
  lluna.print();
  deimos.print();
}


void draw(){
}
