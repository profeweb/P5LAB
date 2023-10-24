class Sensor {
  
  String nom;
  boolean ences;
  
  Sensor(String n){
    this.nom = n;
    this.ences = false;
  }
  
  void dibuixa(float x, float y){
    fill(0);
    circle(x, y, 50);
    fill(this.ences? color(255, 255, 0) : color(0));
    circle(x, y, 40);
    fill(0); textAlign(CENTER);
    text(this.nom, x, y +  60);
  }
}
