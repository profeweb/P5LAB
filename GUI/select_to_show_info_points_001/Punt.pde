
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
  
  void dibuixaInfo(float x, float y, float w, float h){
    fill(100, 100, 200);
    rect(x, y, w, h, 25);
    fill(0); textSize(40);
    text("PUNT:", x + 10, y + 50);
    textSize(24);
    text(getInfo(), x+ 10, y + 100);
  }
  
}
