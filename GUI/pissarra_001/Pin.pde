class Pin {
 
  // Propietats d'un Pin
  float x, y, r;
  String txt;
  color c;
  
  // Constructor
  Pin(float x, float y, float r, String t, color c){
    this.x = x;
    this.y = y;
    this.r = r;
    this.txt = t;
    this.c = c;
  }
  
  
  // Setter
  
  void setPosition(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  // Dibuixa el Pin
  void display(){
    pushStyle();
      stroke(0); strokeWeight(3); fill(c);
      ellipse(x, y, 2*r, 2*r);
      fill(0); textAlign(CENTER); textSize(r);
      text(txt, x, y + r/4);
    popStyle();
  }
  
  // Indica si el cursor està sobre el Pin
  boolean mouseOver(){
    return dist(mouseX, mouseY, this.x, this.y)<=this.r;
  }
  

  
}
