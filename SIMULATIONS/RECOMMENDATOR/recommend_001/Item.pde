class Item {
  
  String nom;
  
  Item(String n){
    this.nom = n;
  }
  
  int hashCode(){
    return this.nom.hashCode();
  }
  
  boolean equals(Item p){
    return this.nom.equals(p);
  }
}
