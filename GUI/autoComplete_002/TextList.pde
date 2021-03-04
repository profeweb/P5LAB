class TextList {

  float x, y, w, h;          // Posició i dimensions
  String[][] texts;          // Valors possibles

  TextField textField;       // Camp de text

  int selectedIndex;         // Fila seleccionada
  String selectedId;         // Id Seleccionat
  String selectedValue;      // Valor Seleccionat

  boolean enabled;           // Abilitat / desabilitat

  int numMatchs = 0;
  ArrayList<Button> buttons;

  TextList(String[][] texts, float x, float y, float w, float h) {

    this.texts = texts;
    this.selectedId = "";
    this.selectedValue = "";
    this.x = x; 
    this.y = y;
    this.w = w; 
    this.h = h;
    this.enabled = true;

    this.textField = new TextField((int)x, (int)y, (int)w, (int)h);
    this.buttons = new ArrayList<Button>();
  }

  void display() {
    pushStyle();
    textField.display();

    for(Button b : this.buttons){
      b.display();
    }
    popStyle();
  }

  void update() {

    String searchFor = this.textField.text;
    println("SEARCH FOR: "+searchFor);
    
    this.numMatchs = 0;
    this.buttons = new ArrayList<Button>();
    
    if (searchFor.length() > 0) {
      for (int i=0; i<texts.length; i++) {
        if (texts[i][1].startsWith(searchFor)) {
          Button b = new Button(texts[i][1], x + 10, y + h + 50 + (h + 50)*numMatchs, w, h);
          buttons.add(b);
          this.numMatchs++;
          if (this.numMatchs==5) {
            break;
          }
        }
      }
    }
    else{
      buttons.clear();
    }
  }
  
  boolean mouseOverButtons(){
    for(Button b : buttons){
      if(b.mouseOverButton()){
         return true;
       }
    }
    return false;
  }
  
  void buttonPressed(){
    boolean pressed = false;
     for(Button b : buttons){
       if(b.mouseOverButton()){
         this.textField.text = b.textBoto;
         this.selectedValue = b.textBoto;
         pressed = true;
         println("PRESSED");
       }
     }
     if(pressed){
       buttons.clear();
       println("REMOVED BUTTONS");
     }
   }
}
