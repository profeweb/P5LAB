// Component RadioButton

class RadioButton {
  
  // Propietats
  int x, y, r;
  
  // Colors
  color bgColor;
  color borderColor;
  color checkedColor;
  
  boolean checked;
  
  // Constructor
  RadioButton(int x, int y, int r){
    this.x = x;
    this.y = y;
    this.r = r;
    this.checked = false;
    this.bgColor = color(255);
    this.borderColor = color(0);
    this.checkedColor = color(180);
  }
  
  
  // Dibuixa el CheckBox
  void display(){
    
    stroke(borderColor);
    strokeWeight(2);
    fill(bgColor);
    ellipse(x, y, 2*r, 2*r);
    
    if(this.checked){
      fill(checkedColor); noStroke();
      ellipse(x, y, 1.5*r, 1.5*r);
    }
  }
  
  void setChecked(boolean b){
    this.checked = b;
  }
  
  // Canvia l'estat de selecció
  void toggle(){
    this.checked = ! this.checked;
  }
  
  
  // Mira si el ratolí està sobre el checkbox
  boolean onMouseOver(){
    return  dist(mouseX, mouseY, this.x, this.y) < this.r;
  }
  
}
