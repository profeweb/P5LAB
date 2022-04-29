class Punt3D extends Punt {
  
  // Atributs
  float z;
  
  // Constructor
  Punt3D(String n, float x, float y, float z){
    super(n, x, y);
    this.z = z;
  }
  
  void print(){
    println(toString());
  }
  
  String toString(){
    return this.nom+" ("+this.x+", "+this.y+", "+this.z+")";
  }
  
  // Sobre-escriu el mètode de dibuix
  void display(color c){
    fill(c); noStroke();
    pushMatrix();
    translate(this.x, this.y, this.z);
    ellipse(0, 0, 20, 20);
    fill(0); textSize(18); textAlign(CENTER);
    text(toString(), 0, - 20);
    popMatrix();
  }
}
