
enum TipusPlaneta { ROCOS, GASOS, NAN};

class Planeta extends CosAstronomic {
  
  TipusPlaneta tipusPlaneta;
  Estrella estrella;
  boolean anells;
  int numSatelits;
  
  Planeta(String n, String c, TipusPlaneta t, Estrella e, boolean a, int ns){
    super(n, Tipus.PLANETA, c);
    this.tipusPlaneta = t;
    this.estrella = e;
    this.anells = a;
    this.numSatelits = ns;
  }
  
  void print(){
    println("PLANETA: ");
    println("\t Nom: "+this.nom);
    println("\t Tipus: "+this.tipusPlaneta);
    println("\t Estrella: "+this.estrella.nom);
    println("\t Anells: "+this.anells);
    println("\t Num. Satèl·lits: "+this.numSatelits);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    println("\t Símbol: "+simbol);
    println("\t Posició: ("+this.x+", "+this.y+", "+this.z+")");
    println("\t Propietats Físiques: ");
    println("\t\t Masa: "+this.masa);
    println("\t\t Volum: "+this.volum);
    println("\t\t Densitat: "+this.densitat);
    println("\t\t Gravetat: "+this.gravetat);
    println("\t\t Radi: "+this.radi);
    println("\t Propietats Orbitals: ");
    println("\t\t Radi Orbital: "+this.radiOrbita);
    println("\t\t Periode Orbital: "+this.periodeOrbita);
    println("\t\t Periode Rotació: "+this.periodeRotacio);
    println("\t\t Excentricitat: "+this.excentricitat);
    println("");
  }
  
}
