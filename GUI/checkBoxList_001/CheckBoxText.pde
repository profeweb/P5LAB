// Component Checkbox

class CheckBoxText {
  
  // Propietats
  float x, y, w, h;
  String texte;
  PImage img;
  
  // Colors
  color bgColor;
  color borderColor;
  color checkedColor;
  
  boolean checked;
  
  // Constructor
  CheckBoxText(int x, int y, int w, int h){
    this.x = x; this.y = y;
    this.h = h; this.w = w;
    this.checked = false;
    this.bgColor = color(255);
    this.borderColor = color(0);
    this.checkedColor = color(180);
    this.texte = "";
  }
  
  CheckBoxText(String t, float x, float y, float w, float h){
    this.texte = t;
    this.x = x;this.y = y;
    this.w = w; this.h = h;
    this.checked = false;
    this.bgColor = color(255);
    this.borderColor = color(0);
    this.checkedColor = color(180);
  }
  
  void setImage(String imgName){
    this.img = loadImage(imgName);
  }
  
  // Dibuixa el CheckBox
  void display(){
    
    stroke(borderColor);
    strokeWeight(2);
    
    if(this.checked){
      fill(checkedColor);
    }
    else{
      fill(bgColor);
    }
    rect(x, y, w, h);
    fill(0); textAlign(LEFT); textSize(24);
    text(this.texte, x + w + 15, y + h/2 + 5);
    
    if(img!=null){
      image(img, x - w, y, w, h);
    }
    
    if(this.checked){
      line(x, y, x + w, y + w);
      line(x, y+w, x + w, y);
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
    return  mouseX>= this.x && 
            mouseX<= this.x + this.w &&
            mouseY>= this.y &&
            mouseY<= this.y + this.h;
  }
  
}
