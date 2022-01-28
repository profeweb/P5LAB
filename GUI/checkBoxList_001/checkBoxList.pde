class CheckBoxList {
  
  // Propietats (posició i dimensions)
  float x, y, w, h;
  
  // Propietats(informació i checkboxes)
  String[] info;
  CheckBoxText[] cbs;
  
  // Constructor
  CheckBoxList(String[] info, float x, float y, float w, float h){
    this.x = x; this.y = y;
    this.w = w; this.h = h;
    
    this.info = info;
    this.cbs = new CheckBoxText[ info.length ];
    for(int i=0; i<info.length; i++){
      cbs[i] = new CheckBoxText(info[i], x, y + (h + 15)*i, w, h);
    }
  }
  
  // Actualitzam la informació del checkboxlist
  void setInfo(String[] info){
    this.info = info;
    this.cbs = new CheckBoxText[ info.length ];
    for(int i=0; i<info.length; i++){
      cbs[i] = new CheckBoxText(info[i], x, y + h*i, w, h);
    }
  }
  
  // Dibuixam el checkboxlist
  void display(){
    for(CheckBoxText cb : cbs){
      cb.display();
    }
  }
  
  // COmprova si feim click sobre algun checkbox
  void checkMouse(){
    for(CheckBoxText cb : cbs){
      if(cb.onMouseOver()){
        cb.toggle();
        break;
      }
    }
  }
  
  // Retorna si el checkBox n està seleccionat
  boolean isChecked(int n){
    return cbs[n].checked;
  }
  
  // Retorna si el checkBox amb texte s està seleccionat
  boolean isChecked(String s){
    for(CheckBoxText cb : cbs){
      if(cb.texte.equals(s)){
        return cb.checked;
      }
    }
    return false;
  }
  
}
