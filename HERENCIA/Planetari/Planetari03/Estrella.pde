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
  
  void setTipusEspectral(char t){
    this.tipusEspectral = t;
  }
  
  char getTipusEspectral(){
    return this.tipusEspectral;
  }
  
  void print(){
    println("ESTRELLA: ");
    println("\t Nom: "+this.nom);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    println("\t Símbol: "+simbol);
    println("\t Tipus Espectral: "+this.tipusEspectral);
    println("\t Brillo: "+this.brillo);
  }
  
}
