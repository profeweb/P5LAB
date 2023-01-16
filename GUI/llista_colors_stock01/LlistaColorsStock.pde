class LlistaColorStock {
  
  color[] colors;
  int[] stocks;
  
  LlistaColorStock(int n){
    colors = new color[n];
    stocks = new int[n];
  }
  
  void setColors(color[] cs){
    this.colors = cs;
  }
  
  void setStocks(int[] st){
    this.stocks = st;
  }
  
  void display(float x, float y, float r){
    pushStyle();
      for(int i=0; i<colors.length; i++){
        fill(colors[i]); stroke(0); strokeWeight(2);
        ellipse(x + (2*r + 10)*i, y, 2*r, 2*r);
        fill(0); textAlign(CENTER); textSize(24);
        text(stocks[i], x + (2*r + 10)*i, y + 2*r);
      }
    popStyle();
  }
  
  
  
}
