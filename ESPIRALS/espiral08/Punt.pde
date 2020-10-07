
class Punt {
  
  //Propietats de la Classe
  float x;
  float y;
  
  // Constructor
  Punt(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  
  // Getters
  
  float getX(){
    return this.x;
  }
  
  float getY(){
    return this.y;
  }
  
  // Setters
  
  void setX(float x){
    this.x = x;
  }
  
  void setY(float y){
    this.y = y;
  }
  
    
  // Dibuixa el punt
  
  void display(){
    fill(0);
    ellipse(this.x, this.y, 5, 5);
  }
  
  // Dibuixa la línia entre aquest i un altre Punt
  
  void displayLine(Punt other, color c){
    stroke(c); strokeWeight(2);
    line(this.x, this.y, other.x, other.y);
  }
    
  
}
