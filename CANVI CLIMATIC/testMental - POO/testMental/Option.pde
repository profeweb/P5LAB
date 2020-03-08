
class Option {
  
  float x, y;
  float r;
  String option;
  color c;
  
  
  Option(String option, float x, float y, float r, color c){
    this.option = option;
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }
  
  void display(){
    fill(c); noStroke();
    ellipse(x, y, r, r);
    fill(0);textSize(24);
    text(option, x+20, y+10);
  }
  
}
