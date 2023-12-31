class LocationSet {
  
  int numLlocs;
  Location[] llocs;
  
  LocationSet(String[][] info){
    this.numLlocs = info.length;
    llocs = new Location[this.numLlocs];
    for(int i=0; i<info.length; i++){
      llocs[i] = new Location(info[i]);
    }
  }
  
  void display(float x, float y, float w, float h){
    for(int i=0; i<llocs.length; i++){
      llocs[i].displayMark(x, y, w, h);
    }
  }
  
  boolean mouseOverLocations(float x, float y, float w, float h){
    for(int i=0; i<llocs.length; i++){
      if(llocs[i].mouseOver(x, y, w, h)){
        return true;
      }
    }
    return false;
  }
  
  int getSelected(float x, float y, float w, float h){
    for(int i=0; i<llocs.length; i++){
      if(llocs[i].mouseOver(x, y, w, h)){
        return i;
      }
    }
    return -1;
  }
}
