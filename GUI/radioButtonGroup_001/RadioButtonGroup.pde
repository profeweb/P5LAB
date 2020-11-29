// Component RadioButtonGroup

class RadioButtonGroup {
  
  // Propietats
  RadioButton[] rbuttons;
  int selectedOption;
  
  RadioButtonGroup(int n){
    rbuttons = new RadioButton[n];
    selectedOption = 0;
  }
  
  void setRadioButtons(RadioButton ... rbs){
    for(int i=0; i<rbs.length; i++){
      this.rbuttons[i] = rbs[i];
    }
  }
  
  void setSelected(int n){
    selectedOption = n;
  }
  
  void display(){
    for(int i=0; i<rbuttons.length; i++){
      if(rbuttons[i]!=null){
        if(i==selectedOption){
          rbuttons[i].setChecked(true);
        }
        else {
          rbuttons[i].setChecked(false);
        }
        rbuttons[i].display();
      }
    }
  }
  
  void updateOnClick(){
    for(int i=0; i<rbuttons.length; i++){
      if(rbuttons[i]!=null && rbuttons[i].onMouseOver()){
        selectedOption = i;
      }
    }
  }
  
}
