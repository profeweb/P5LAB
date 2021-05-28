// Tipus enumerat
enum TipusSatelit {NATURAL, PASTOR,  TROIA, COORBITAL, ASTEROIDAL};

// SUBCLASSE
class Satelit extends CosAstronomic {

  // 4 Atributs propis de la classe Satèlit

  TipusSatelit tipusSatelit;
  Planeta planeta;
  double pressio;
  float temperatura;

  // Constructor

  Satelit(String n, String c, TipusSatelit ts, Planeta p){
    super(n, Tipus.SATELIT, c);
    this.tipusSatelit = ts;
    this.planeta = p;
  }

  // 4 Setters

  void setTipusSatelit(TipusSatelit ts){
    this.tipusSatelit = ts;
  }

  void setPlaneta(Planeta p){
    this.planeta = p;
  }

  void setPressio(double p){
    this.pressio = p;
  }

  void setTemperatura(float t){
    this.temperatura = t;
  }


  // 4 Getters

  TipusSatelit getTipusSatelit(){
    return this.tipusSatelit;
  }

  Planeta getPlaneta(){
    return this.planeta;
  }

  double getPressio(){
    return this.pressio;
  }

  float getTemperatura(){
    return this.temperatura;
  }


  // Altre mètodes (print)

  void print(){
    System.out.println("SATÈL·LIT: ");
    System.out.println("\t Nom: "+this.nom);
    System.out.println("\t Tipus: "+this.tipusSatelit);
    System.out.println("\t Planeta: "+this.planeta.nom);
    System.out.println("\t Temperatura: "+this.temperatura);
    System.out.println("\t Pressió: "+this.pressio);
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
