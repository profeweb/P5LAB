// SUBCLASSE
class Estrella extends CosAstronomic {
  
  // Atributs
  char tipusEspectral;
  float brillo;
  
  //Constructor
  
  Estrella(String n, String c, char t, float b){
    super(n, Tipus.ESTRELLA, c);
    this.tipusEspectral = t;
    this.brillo = b;
  }
  
  // Setters

  void setTipusEspectral( char t){
    this.tipusEspectral = t;
  }

  void setBrillo(float b){
    this.brillo = b;
  }

  // Getters

  char getTipusEspectral(){
    return this.tipusEspectral;
  }

  float getBrillo(){
    return this.brillo;
  }
  
  // Altres
  
  void print(){
    System.out.println("ESTRELLA: ");
    System.out.println("\t Nom: "+this.nom);
    System.out.println("\t Tipus: "+this.tipus);
    System.out.println("\t Tipus Espectral: "+this.tipusEspectral);
    System.out.println("\t Brillo: "+this.brillo);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    System.out.println("\t Símbol: "+simbol);
    System.out.println("\t Posició: ("+this.x+", "+this.y+", "+this.z+")");
    System.out.println("\t Propietats Físiques: ");
    System.out.println("\t\t Masa: "+this.masa);
    System.out.println("\t\t Volum: "+this.volum);
    System.out.println("\t\t Densitat: "+this.densitat);
    System.out.println("\t\t Gravetat: "+this.gravetat);
    System.out.println("\t\t Radi: "+this.radi);
    System.out.println("");

  }
  
}
