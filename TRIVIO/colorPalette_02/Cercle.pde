class Cercle {
  
  float x, y, r;
  color c;
  
  Cercle(float x, float y, float r){
    this.x = x; this.y = y;
    this.r = r;
  }
  
  void setColor(color c){
    this.c = c;
  }
  
  void display(){
    fill(c); stroke(0); strokeWeight(3);
    ellipse(x, y, r, r);
  }
  
}
