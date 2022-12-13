
class SelectColor {
  
  float x, y, w, h;          // Posició i dimensions
  color[] colors;            // Valors possibles
  color selectedValue;       // Valor Seleccionat
  
  boolean collapsed = true;  // Plegat / Desplegat
  boolean enabled;           // Abilitat / desabilitat
  
  float lineSpace = 15;      // Espai entre línies
  
  SelectColor(color[] colors, float x, float y, float w, float h){
    
    this.colors = colors;
    this.selectedValue = color(255);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;
    this.collapsed = true;
  }
  
  void display(){
    pushStyle();
    stroke(0); strokeWeight(2); 
    fill(selectedValue);
    rect(x, y, w, h);
    
    fill(255);
    rect(x + w - 30, y, 30, h);
    
    fill(0); stroke(0);
    triangle(x + w - 25, y+5, x + w - 15, y + 25, x + w - 5 , y+5);
 
    
    if(!this.collapsed){
      
      fill(255); stroke(0);
      rect(x, y+h, w, (h + lineSpace)*colors.length);
      
      for(int i=0; i<colors.length; i++){
          fill(colors[i]); noStroke();
          rect(x+4, y+4 + h + (h + lineSpace)*i - 2, w -8, h + lineSpace - 8);
      }
    }
    popStyle();
  }
  
  void setCollapsed(boolean b){
    this.collapsed = b;
  }
  
  void toggle(){
    this.collapsed = !this.collapsed;
  }
  
  
  void update(){
    int option = clickedOption();
    selectedValue = colors[option];
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
            (mouseY<= y + h + (h + lineSpace)*colors.length); 
   }
 }
 
 int clickedOption(){
   int i = (int)map(mouseY, y + h, y + h + (h + lineSpace)*colors.length, 
                            0, colors.length);
   return i;
 }
  
}
