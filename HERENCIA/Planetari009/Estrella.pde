class Estrella extends CosAstronomic {

  // Atributs
  char tipusEspectral;
  float brillo;
  float temperatura;
  float indexColorUB;

  // Constructor
  Estrella( String n , String c, char te ,float b){
      super( n , Tipus.ESTRELLA , c) ;
      this.tipusEspectral = te;
      this.brillo = b;
  }

  // Setters

  void setTipusEspectral( char t){
    this.tipusEspectral = t;
  }

  void setBrillo(float b){
    this.brillo = b;
  }

  void setTemperatura(float t){
    this.temperatura = t;
  }

  void setIndexColorUB(float c){
    this.indexColorUB = c;
  }


  // Getters

  char getTipusEspectral(){
    return this.tipusEspectral;
  }

  float getBrillo(){
    return this.brillo;
  }

  float getTemperatura(){
    return this.temperatura;
  }

  float getIndexColorUB(){
    return this.indexColorUB;
  }


  // Altres 

  void print(){
    System.out.println("ESTRELLA: ");
    System.out.println("\t Nom: "+this.nom);
    System.out.println("\t Tipus: "+this.tipus);
    System.out.println("\t Tipus Espectral: "+this.tipusEspectral);
    System.out.println("\t Brillo: "+this.brillo);
    System.out.println("\t Temperatura Efectiva: "+this.temperatura);
    System.out.println("\t Index Color UB: "+this.indexColorUB);
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
