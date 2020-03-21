class Poliedre {
  
  // Atributs del Poliedre
  Poligon[] poligons;
  
  // Constructor
  Poliedre(int n){
    this.poligons = new Poligon[n];
  }
  
  // Setter
  void setPoligon(int i, Poligon p){
    this.poligons[i] = p;
  }
  
  // Getter
  Poligon getPoligon(int i){
    return this.poligons[i];
  }
  
  // Altres
  
  // Dibuixa el Poliedre, dibuixant cada un dels seus poligons (cares).
  void display(){
    for(int i=0; i<poligons.length; i++){
      this.poligons[i].display();
    }
  }
  
 
  
}
