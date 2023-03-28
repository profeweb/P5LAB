
class Button {
  
  float x, y;
  float w, h;
  color c;
  
  Button(float x, float y, float w, float h, color c){
    this.x = x; this.y = y;
    this.w = w; this.h = h;
    this.c = c;
  }
  
  void display(){
    fill(c);
    rect(x, y, w, h);
  }
  
  boolean mouseDins(){
    return false;
  }
}
