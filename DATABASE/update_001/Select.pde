
class Select {
  
  float x, y, w, h;            // Posició i dimensions
  String[][] texts;            // Valors possibles
  
  int selectedIndex;         // Fila seleccionada
  String selectedId;         // Id Seleccionat
  String selectedValue;      // Valor Seleccionat
  
  boolean collapsed = true;  // Plegat / Desplegat
  boolean enabled;           // Abilitat / desabilitat
  
  float lineSpace = 15;      // Espai entre línies
  
  Select(String[][] texts, float x, float y, float w, float h){
    
    this.texts = texts;
    this.selectedId = "";
    this.selectedValue = "";
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;
    this.collapsed = true;
  }
  
  void reset(){
    this.selectedValue = "";
  }
  
  void setData(String[][] info){
    this.texts = info;
  }
  
  int getSelectedIndex(){
    return this.selectedIndex;
  }
  
  String getSelectedId(){
    return this.texts[selectedIndex][0];
  }
  
  String getSelectedText(){
    return this.texts[selectedIndex][1];
  }
  
  void display(){
    
    stroke(0); strokeWeight(10); fill(255);
    rect(x, y, w, h, 5);
    
    fill(100);
    rect(x + w - 100, y, 100, h, 5);
    
    fill(0); stroke(0);
    triangle(x + w - 75, y+25, x + w - 25, y + 25, x + w - 50 , y+50);
    
    fill(0); textSize(34); 
    text(selectedValue, x + 10, y + 50);
    
    if(!this.collapsed){
      
      fill(255); stroke(0);
      rect(x, y+h, w, (h + lineSpace)*texts.length);
      
      for(int i=0; i<texts.length; i++){
        
        if(i== clickedOption()){
          fill(200); noStroke();
          rect(x+4, y+4 + h + (h + lineSpace)*i - 2, w -8, h + lineSpace - 8);
        }
        
        fill(0); textSize(34);
        text(texts[i][1], x + 10, y + h + 50 + (h + lineSpace)*i);
      }
    }
    
  }
  
  void setCollapsed(boolean b){
    this.collapsed = b;
  }
  
  void toggle(){
    this.collapsed = !this.collapsed;
  }
  
  
  void update(){
    selectedIndex = clickedOption();
    selectedId    = texts[selectedIndex][0];
    selectedValue = texts[selectedIndex][1];
  }
  
 // Indica si el cursor està sobre el select
 boolean mouseOverSelect(){
   if(this.collapsed){
     return (mouseX >= x) && 
            (mouseX <= x + w) && 
            (mouseY >= y) && 
            (mouseY <= y + h); 
   }
   else {
     return (mouseX>= x) && 
            (mouseX<= x + w) && 
            (mouseY>= y) && 
            (mouseY<= y + h + (h + lineSpace)*texts.length); 
   }
 }
 
 int clickedOption(){
   int i = (int)map(mouseY, y + h, y + h + (h + lineSpace)*texts.length, 
                            0, texts.length);
   return i;
 }
  
}
