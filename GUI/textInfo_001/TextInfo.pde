class TextInfo {
  
  float x, y, w, h;
  String text;
  
  color borderColor;
  color backgroundColor;
  color textColor;
  
  TextInfo(String t, float x, float y, float w, float h){
    this.text = t;
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.borderColor = color(0);
    this.backgroundColor = color(255, 100, 100);
    this.textColor = color(0, 50, 50);
  }
  
  void display(){
    stroke(borderColor); strokeWeight(2); 
    fill(backgroundColor);
    rect(x, y, w, h);
    fill(textColor); textSize(18);
    text(this.text, x + 5, y + h/1.3);
  }
  
}
