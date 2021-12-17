
class Label {
  
  String info1, info2;
  float x, y, w, h;
  boolean selected = false;
  
  Label(String info1, String info2){
    this.info1 = info1;
    this.info2 = info2;
  }
  
  void setDimensions(float x, float y, float w, float h){
    this.x = x; this.y = y;
    this.w = w; this.h = h;
  }
  
  void setSelected(boolean b){
    this.selected = b;
  }
  
  void display(){
    pushStyle();
    if(this.mouseOver()){
      fill(120); 
    }
    else if(this.selected){
      fill(120, 100, 100); 
    }
    else {
      fill(240);
    }
    noStroke();
    rect(x, y, w, h, 5);
    
    fill(0); textSize(24);
    text(this.info1, x + 5, y + 40);
    text(this.info2, x + 5, y + 80);
    popStyle();
  }
  
  boolean mouseOver(){
    return this.x< mouseX && mouseX < this.x + w &&
           this.y< mouseY && mouseY < this.y + h;
  }
  
  
}
