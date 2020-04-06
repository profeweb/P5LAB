
class Cos {
  
  // Atributs
  float x, y;
  color c;
  
  float radi;
  float angOrbit;
  float stepOrbit;
  float radiOrbit;
  
  // Constructor
  Cos(float r, float ro, float so, color c){
    
    this.x = width/2;
    this.y = width/2;
    
    this.radi = r;
    this.radiOrbit = ro;
    this.stepOrbit = so;
    this.angOrbit = 0.0;
    
    this.c = c;
  }
  
  // Setters
  void setPosition(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  
  // Orbita al voltant del cos c
  void orbit(Cos c){
    
    // Actualitza posició i angle de l'òrbita
    this.x = c.x + radiOrbit*cos(angOrbit);
    this.y = c.y + radiOrbit*sin(angOrbit);
    this.angOrbit+= this.stepOrbit;
    
    // Dibuixa l'òrbita
    pushMatrix();
      translate(c.x, c.y);
      ellipseMode(CENTER);
      noFill(); strokeWeight(0.5);
      ellipse(0,0,2*radiOrbit, 2*radiOrbit);
    popMatrix();
  }
  
  // Dibuixa el cos a la posició
  void display(){
    pushMatrix();
      translate(this.x, this.y);
      ellipseMode(CENTER);
      fill(this.c); strokeWeight(4);
      ellipse(0,0,2*radi, 2*radi);
    popMatrix();
  }
    
  
}
