/*
  Planetari v4.0
  Completar la Subclasse.
  Estrella. Atributs addicionals.
*/

// Variables de classe Estrella
Estrella e1, e2, e3;

void setup(){
  size(800,800);
  
  // Instanciació d'objectes Estrella 
  
  e1 = new Estrella ( "Sol", "2609", 'G', -26.8f );
  e1.setTemperatura(5778);
  e1.setIndexColorUB(0.10f);
  e1.print();

  e2 = new Estrella ( "Canopus", "2605", 'F', -1.47f );
  e2.setTemperatura(7280);
  e2.setIndexColorUB(0.10f);
  e2.print();

  e3 = new Estrella ( "Rigel", "2605", 'B', 2.1f );
  e3.setTemperatura(33000);
  e3.setIndexColorUB(0.35f);
  e3.print();
}

void draw(){
  
  background(255);
  
  // Dibuixa els objectes Estrella
  e1.display(width/2, height/4);
  e2.display(width/2, 2*height/4);
  e3.display(width/2, 3*height/4);
}
