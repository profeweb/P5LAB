class CosAstronomic {

  // Atributs generals
  String nom;
  Tipus tipus;
  String codi;

  // Constructor
  CosAstronomic(String n, Tipus t, String c){
      this.nom = n;
      this.tipus = t;
      this.codi = c;
  }


  // Setters
  void setNom(String n){
    this.nom = n;
  }

  void setTipus(Tipus t){
    this.tipus = t;
  }

  void setCodi(String c){
    this.codi = c;
  }

  // Getters

  String getNom(){
    return this.nom;
  }

  Tipus getTipus(){
    return this.tipus;
  }

  String getCodi(){
    return this.codi;
  }


  // Altres

  void print(){
    System.out.println("COS ASTRONÒMIC: ");
    System.out.println("\t "+this.nom);
    System.out.println("\t "+this.tipus);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    System.out.println("\t "+simbol);
    text(simbol, 100, 100);
    System.out.println("");
  }
  
  void display(float x, float y){
    fill(0); textAlign(CENTER);
    text(this.nom, x, y);
    //text(this.tipus, x, y + 10);
    char simbol = (char) Integer.parseInt(this.codi, 16);
    text(simbol, x, y+20);
  }

}
