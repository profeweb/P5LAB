

class Proces {
  
  // Nom del procés
  String nom;
  // Color del procés
  color c;
  // Número de cicles de rellotge del procés
  int numCicles;
  // Núm. de cicles executats
  int numExecs;
  
  // Constructor
  Proces(String n, color c, int m){
    this.nom = n;
    this.c = c;
    this.numCicles = m;
    this.numExecs  = 0;
  }
  
  // Executa
  void run(int quantum){
    this.numExecs += quantum;
  }
  
  // Dibuixa el procés
  void display(float x, float y, float w, float h){
      
      fill(this.c); stroke(0); strokeWeight(3);
      rect(x, y, w, h);
      
      fill(0); textAlign(CENTER); textSize(20);
      text(this.nom, x + w/2 , y + h/2 + 10);
      
      textSize(15); fill(220);
      text(this.numExecs +"/"+this.numCicles, x + w/2 , y + h/2 + 40);
  }
  
}
