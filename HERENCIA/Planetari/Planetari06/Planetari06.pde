/*
  Planetari v6.0
  Completar la Subclasse.
  Planeta. Atributs addicionals.
*/

// Variables de classe Planeta
Planeta terra, mart, saturn;

void setup(){
  size(800,800);
  
  // Instanciació d'objectes Estrella
  
  Estrella sol = new Estrella("Sol", "2609", 'G', -26.8);
  
  // Instanciació d'objectes Planeta

  terra = new Planeta( "Terra" , "2641" , TipusPlaneta.ROCOS, sol);
  terra.setAnells(false);
  terra.setNumSatelits(1);
  terra.print();

  mart = new Planeta( "Mart" , "2642" , TipusPlaneta.ROCOS, sol);
  mart.setAnells(false);
  mart.setNumSatelits(2);
  mart.print();

  saturn = new Planeta( "Saturn" , "2796" , TipusPlaneta.GASOS, sol);
  saturn.setAnells(true);
  saturn.setNumSatelits(52);
  saturn.print();
}

void draw(){
  
  background(255);
  
  // Dibuixa els objectes Planeta
  terra.display(width/2, height/4);
  mart.display(width/2, 2*height/4);
  saturn.display(width/2, 3*height/4);
}
