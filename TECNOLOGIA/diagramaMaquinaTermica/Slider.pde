class Slider {

  String s;
  float x, y, w, h;
  float minV, maxV, v;
  
  color c;

  Slider (String s, float x, float y, float w, float h, float minV, float maxV, float val) {
    this.s = s;
    this.x = x; this.y = y;
    this.w = w; this.h = h;
    this.v = val; this.minV = minV; this.maxV = maxV;
    
    this.c = color(255, 100, 100);
  }
  
  float getValue(){
    return this.v;
  }
  
  void setColor(color c){
    this.c = c;
  }

  void display() {
    pushStyle();
      fill(c); strokeWeight(3);
      rect(x, y, w, h, 5);
      noStroke(); fill(0);
      rect(x + map(v, minV, maxV, 0, w-15), y, 15, h);
      fill(0); textAlign(CENTER); textSize(24);
      text(nf(floor(v), 2, 0), x + w + 25, y +h/2 + 10);
      fill(0); textAlign(LEFT); textSize(24);
      text(s, x - 40, y + h/2 + 10);
    popStyle();
  }

  boolean mouseOnSlider() {
    return ((mouseX>x) && (mouseX<x+w) && 
            (mouseY>=y)&& (mouseY<=y+h));
  }

  void updateSlider() {
    v = map(mouseX, x, x+w, minV, maxV);
    v = constrain(v, minV,maxV);
  }
  
  void checkSlider(){
    if(mouseOnSlider()){
      updateSlider();
    }
  }

}
