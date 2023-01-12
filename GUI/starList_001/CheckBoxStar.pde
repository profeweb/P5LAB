// Component CheckBoxStar

class CheckBoxStar {
  
  // Propietats
  float x, y, w, h;
  PImage imgChecked, imgNotChecked;
  
  boolean checked;
  
  // Constructor
  CheckBoxStar(int x, int y, int w, int h){
    this.x = x; this.y = y;
    this.h = h; this.w = w;
    this.checked = false;
  }
  
  void setImages(String imgName1, String imgName2){
    this.imgChecked = loadImage(imgName1);
    this.imgNotChecked = loadImage(imgName2);
  }
  
  // Dibuixa el CheckBox
  void display(){
    
    pushStyle();
    
    
    
    imageMode(CORNER);
    
    if(this.checked){
      image(imgChecked, x, y, w, h);
    }
    else{
      image(imgNotChecked, x, y, w, h);
    }
    
    popStyle();
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
