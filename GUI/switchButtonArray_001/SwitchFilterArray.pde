class SwitchFilterArray {
  
  SwitchFilter[] sfs;
  int x, y;
  int w, h;
  int space = 50;
  boolean initialValue = false;
  
  SwitchFilterArray(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void setData(String[] info){
    sfs = new SwitchFilter[info.length];
    int num = info.length;
    float sfWidth = (this.w - space*(num-1)) / ((float) num);
    for(int i=0; i<info.length; i++){
      float x = this.x + i*(sfWidth+space);
      float y = this.y;
      sfs[i] = new SwitchFilter(info[i], x, y, sfWidth, this.h);
      sfs[i].setEnabled(initialValue);
    }
  }
  
  void display(){
    for(SwitchFilter sf : sfs){
      sf.display();
    }
  }
  
  void updateFilters(){
    for(SwitchFilter sf : sfs){
      if(sf.mouseOverButton()){
        sf.toggle();
      }
    }
  }
  
  boolean updateCursor(){
    for(SwitchFilter sf : sfs){
      if(sf.mouseOverButton()){
        return true;
      }
    }
    return false;
  }
  
  boolean getSelectedValue(String name){
    for(SwitchFilter sf : sfs){
      if(sf.name.equals(name)){
        return sf.getEnabled();
      }
    }
    return false;
  }
  
  int getNumSelected(){
    int n=0;
    for(SwitchFilter sf : sfs){
      if(sf.getEnabled()){
        n++;
      }
    }
    return n;
  }
  
  String[] getSelectedValues(){
    String[] selected = new String[getNumSelected()];
    int n=0;
    for(SwitchFilter sf : sfs){
      if(sf.getEnabled()){
        selected[n]=sf.name;
        n++;
      }
    }
    return selected;
  }
  
  String getSelectedValuesIn(){
    String selected = "";
    int n = getNumSelected();
    int i = 0;
    for(SwitchFilter sf : sfs){
      if(sf.getEnabled()){
        selected+="'"+sf.name+"'";
        if(i<n-1){
          selected+=",";
        }
        i++;
      }
    }
    return selected;
  }
  
}
