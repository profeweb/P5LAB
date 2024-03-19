class ItemList {
  
  String info;
  
  
  ItemList(String info){
    this.info = info;
  }
  
  void display(float x, float y, float w, float h){
    pushStyle();
    rect(x, y, w, h);
    fill(0); textAlign(LEFT); textSize(18);
    text(this.info, x + 5, y + h/2);
    popStyle();
  }
}
