class TableLabel {
 
  int numRows;
  Label[] labels;
  float x, y, w, h;
  int selectedIndex = -1;
  
  TableLabel(int nr, float x, float y, float w, float h){
    this.numRows = nr;
    this.labels = new Label[nr];
    this.x = x; this.y = y;
    this.w = w; this.h = h;
  }
  
  void setLabelsInfo(String[][] info){
    for(int i=0; i<info.length; i++){
      this.labels[i] = new Label(info[i][0], info[i][1]);
    }
  }
  
  void setPositions(){
    for(int i=0; i<labels.length; i++){
      float px = x + ((i%2==0)? 0 : this.w/2 + 5);
      float py = y + (i/2)* (h/6 +5);
      this.labels[i].setDimensions(px, py, w/2, h/6);
    }
  }
  
  void display(){
    for(int i=0; i<labels.length; i++){
      labels[i].display();
    }
  }
  
  boolean checkClick(){
    boolean selected = false;
    for(int i=0; i<labels.length; i++){
      if(labels[i].mouseOver()){
        selectedIndex = i;
        labels[i].setSelected(true);
        selected = true;
      }
      else{
        labels[i].setSelected(false);
      }
    }
    if(selected == false){
      selectedIndex = -1;
    }
    return selected;
  }
  
  boolean checkMouseOver(){
    boolean mouseOver = false;
    for(int i=0; i<labels.length; i++){
      if(labels[i].mouseOver()){
        mouseOver = true;
        break;
      }
    }
    return mouseOver;
  }
  
  void displaySelected(){
    pushStyle();
    if(selectedIndex!= -1){
      fill(100, 200, 200); noStroke();
      rect(850, 25, w/3, h/6, 5);
      fill(0);
      text(labels[selectedIndex].info1, 900, 70);
      text(labels[selectedIndex].info2, 900, 100);
    }
    popStyle();
  }
  
}
