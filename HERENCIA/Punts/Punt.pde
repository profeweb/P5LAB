
class Punt {
  
  // Propietats del Punt
  float x;
  float y;
  
  // Constructor del Punt
  Punt(float x, float y){ 
    this.x = x;
    this.y = y;
  }
  
  // Mètode per visualitzar el Punt
  void display(){
    fill(0); noStroke();
    ellipse(x, y, 5, 5);
  }
  
  
  // Mètode que calcula la distancia del Punt al Punt p
  float dist(Punt p){
    
    float dx = (this.x - p.x);
    float dy = (this.y - p.y);
    
    return sqrt(dx*dx + dy*dy);
  }
  
}
