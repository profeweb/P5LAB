
// Tipus enumerat
enum TipusPlaneta { ROCOS, GASOS, NAN};

// SUBCLASSE
class Planeta extends CosAstronomic {
 
  // Atributs
  TipusPlaneta tipusPlaneta;
  Estrella estrella;

  // Constructor
  Planeta(String n, String c, TipusPlaneta tp, Estrella e){
    super(n, Tipus.PLANETA, c);
    this.tipusPlaneta= tp;
    this.estrella = e;
  }

  // Setters

  void setTipusPlaneta(TipusPlaneta tp){
    this.tipusPlaneta = tp;
  }

  void setEstrella(Estrella e){
    this.estrella = e;
  }

  // Getters

  TipusPlaneta gTipusPlaneta(){
    return this.tipusPlaneta;
  }

  Estrella getEstrella(){
    return this.estrella;
  }

  // Altres

  void print(){
    System.out.println("PLANETA: ");
    System.out.println("\t Nom: "+this.nom);
    System.out.println("\t Tipus: "+this.tipusPlaneta);
    System.out.println("\t Estrella: "+this.estrella.nom);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    System.out.println("\t Símbol: "+simbol);
    System.out.println("\t Posició: ("+this.x+", "+this.y+", "+this.z+")");
    System.out.println("\t Propietats Físiques: ");
    System.out.println("\t\t Masa: "+this.masa);
    System.out.println("\t\t Volum: "+this.volum);
    System.out.println("\t\t Densitat: "+this.densitat);
    System.out.println("\t\t Gravetat: "+this.gravetat);
    System.out.println("\t\t Radi: "+this.radi);
    System.out.println("\t Propietats Orbitals: ");
    System.out.println("\t\t Radi Orbital: "+this.radiOrbita);
    System.out.println("\t\t Periode Orbital: "+this.periodeOrbita);
    System.out.println("\t\t Periode Rotació: "+this.periodeRotacio);
    System.out.println("\t\t Excentricitat: "+this.excentricitat);
    System.out.println("");
  }


}
