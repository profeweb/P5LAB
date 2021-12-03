
class Label {
  
  String info1, info2;
  
  Label(String info1, String info2){
    this.info1 = info1;
    this.info2 = info2;
  }
  
  void display(int x, int y, int w, int h){
    
    fill(200); noStroke();
    rect(x, y, w, h, 5);
    
    fill(0); textSize(24);
    text(this.info1, x + 5, y + 40);
    text(this.info2, x + 5, y + 80);
    
  }
  
  
  
}
