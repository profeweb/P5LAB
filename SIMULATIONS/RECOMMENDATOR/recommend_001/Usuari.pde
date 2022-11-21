class Usuari {
  
  String nom;
  
  Usuari(String n){
    this.nom = n;
  }
  
  int hashCode(){
    return this.nom.hashCode();
  }
  
  boolean equals(Usuari u){
    return this.nom.equals(u);
  }
  
}
