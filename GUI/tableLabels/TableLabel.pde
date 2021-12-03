class TableLabel {
 
  int numRows;
  Label[] labels;
  
  TableLabel(int nr){
    this.numRows = nr;
    this.labels = new Label[nr];
  }
  
  void setLabelsInfo(String[][] info){
    for(int i=0; i<info.length; i++){
      this.labels[i] = new Label(info[i][0], info[i][1]);
    }
  }
  
  void display(int x, int y, int w, int h){
    for(int i=0; i<labels.length; i++){
      int px = x + ((i%2==0)? 0 : w/2 + 5);
      int py = y + (i/2)* (h/6 +5);
      labels[i].display(px, py, w/2, h/6);
    }
    
  }
  
}
