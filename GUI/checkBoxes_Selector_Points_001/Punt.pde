
class Punt {
  
  // Propietats del Punt
  String nom;
  float x, y, z;
  
  // Constructor del Punt
  Punt(String n, float x, float y, float z){ 
    this.nom = n;
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  String getInfo(){
    return this.nom+":("+x+", "+y+", "+z+")";
  }
  
}
