class ListViewer {
  
  ArrayList<ItemList> items;
  
  float x, y, w, h;
  
  int start = 0;
  int numItems;
  
  
  ListViewer(float x, float y, float w, float h){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.items = new ArrayList();
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
    fill(255);
    rect(x, y, w, h, 5);
    int s = this.start;
    int e = min(this.items.size(), s + numItems);
    for(int i= s; i< e; i++){
      this.items.get(i).display(x+5, y + (i-s)*50 + 5, w-10, 50);
    }
    popStyle();
  }
  
  
}
