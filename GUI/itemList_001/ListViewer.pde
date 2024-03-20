class ListViewer {
  
  ArrayList<ItemList> items;
  Button bUp, bDown;
  
  float x, y, w, h;
  
  int start = 0;
  int numItems;
  
  
  ListViewer(float x, float y, float w, float h){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.items = new ArrayList();
    
    bUp = new Button("UP", this.x + this.w + 10, this.y, 100, 100);
    bUp.enabled = false;
    bDown = new Button("DOWN", this.x + this.w + 10, this.y + 120, 100, 100);
  }
  
  void setStartItem(int n){
    this.start = n;
  }
  
  void setNumItems(int n){
    this.numItems = n;
  }
  
  void addItemToList(String s){
    this.items.add(new ItemList(s));
  }
  
  void display(){
    
    pushStyle();
    fill(200);
    rect(x, y, w, h, 5);
    int s = this.start;
    int e = min(this.items.size(), s + numItems);
    for(int i= s; i< e; i++){
      this.items.get(i).display(x+5, y + (i-s)*50 + 5, w-10, 50);
    }
    
    bUp.display();
    bDown.display();
    popStyle();
  }
  
  void buttonPressed(){
    if(bUp.mouseOverButton() && this.start>0){
      this.start--;
    }
    else if(bDown.mouseOverButton() && this.start < this.items.size()){
      this.start++;
    }
    if(this.start >0){
      bUp.enabled  = true;
    }
    else {
      bUp.enabled = false;
    }
    if(this.start >= this.items.size()){
      bDown.enabled = false;
    }
    else {
      bDown.enabled = true;
    }
  }
  
  
}
