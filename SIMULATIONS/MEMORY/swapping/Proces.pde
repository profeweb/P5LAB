

class Proces {
  
  // Nom del procés
  String nom;
  // Color del procés
  color c;
  // Mida del procés
  int mida;
  
  // Adreça de memòria del procés
  int address;
  
  // Constructor
  Proces(String n, color c, int m){
    this.nom = n;
    this.c = c;
    this.mida = m;
  }
  
  // Assigna adreça de memòria al procés
  void setAddress(int a){
    this.address = a;
  }
  
  // Dibuixa el procés
  void display(float x, float y, float h){
      
      fill(this.c); stroke(0); strokeWeight(3);
      rect(x + this.address, y, this.mida, h);
      
      fill(0); textAlign(CENTER); textSize(20);
      text(this.nom, x + this.address + this.mida/2 , y + h/2 + 10);
  }
  
}
