class TextInfo {
  
  float x, y, w, h;
  String text;
  
  TextInfo(String t, float x, float y, float w, float h){
    this.text = t;
    this.x = x; this.y = y; this.w = w; this.h = h;
  }
  
  void display(){
    stroke(0); strokeWeight(2); fill(255);
    rect(x, y, w, h);
    fill(0);
    text(this.text, x + 5, y + 15);
  }
  
}
