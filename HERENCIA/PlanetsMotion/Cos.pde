
class Cos {
  
  float x, y;
  color c;
  
  float radi;
  float angOrbit;
  float stepOrbit;
  float radiOrbit;
  
  Cos(float r, float ro, float so, color c){
    this.x = width/2;
    this.y = width/2;
    this.radi = r;
    this.radiOrbit = ro;
    this.stepOrbit = so;
    this.c = c;
    this.angOrbit = 0.0;
  }
  
  void setPosition(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void orbit(Cos c){
    
    this.x = c.x + radiOrbit*cos(angOrbit);
    this.y = c.y + radiOrbit*sin(angOrbit);
    this.angOrbit+= this.stepOrbit;
    
    pushMatrix();
      translate(c.x, c.y);
      ellipseMode(CENTER);
      noFill(); strokeWeight(0.5);
      ellipse(0,0,2*radiOrbit, 2*radiOrbit);
    popMatrix();
  }
  
  
  void display(){
    pushMatrix();
      translate(this.x, this.y);
      ellipseMode(CENTER);
      fill(this.c); strokeWeight(4);
      ellipse(0,0,2*radi, 2*radi);
    popMatrix();
  }
    
  
}
