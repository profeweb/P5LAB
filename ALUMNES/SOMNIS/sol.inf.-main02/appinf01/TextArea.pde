

class TextArea {
  
  // Propietats del camp de text
  int x, y, h, w;
  int numCols, numRows;
  
  // Colors
  color bgColor = color(140, 140, 140);
  color fgColor = color(0, 0, 0);
  color selectedColor = color(240);
  color borderColor = color(30, 30, 30);
  int borderWeight = 1;
  
  // Text del camp
  String text = "";
  String[] lines;
  int textSize = 24;

  boolean selected = false;
   
  // Constructor
  TextArea(int x, int y, int w, int h, int nc, int nr) {
      this.x = x; this.y = y; this.w = w; this.h = h;
      this.numCols = nc; this.numRows = nr;
      
      this.lines = new String[nr];
   }
  
  // Dibuixa el Camp de Text
  void display() {
      pushStyle();
      if (selected) {
         fill(selectedColor);
      } else {
         fill(bgColor);
      }
      
      strokeWeight(borderWeight);
      stroke(borderColor);
      rect(x, y, w, h, 5);
      
      fill(fgColor);
      textSize(textSize);
      for(int i=0; i<lines.length; i++){
        if(lines[i]!=null){
          text(lines[i], x + 5, y + (i+1)*textSize);
        }
      }
      popStyle();
   }
   
   void updateLines(){
     if(text.length()>0){
       int numLines = constrain(text.length() / numCols, 0, this.numRows-1);
       println("NUM LINES: "+numLines);
       for(int i=0; i<=numLines; i++){
           int start = i*numCols;
           int end = min(text.length(), (i+1)*numCols);
           lines[i] = text.substring(start, end);
       }
     }
     else {
        for(int i=0; i<lines.length; i++){ 
          lines[i] ="";
        }
     }
     printArray(lines);
   }
   
   // Afegeix, lleva el text que es tecleja
   void keyPressed(char key, int keyCode) {
      if (selected) {
         if (keyCode == (int)BACKSPACE) {
            removeText();
         } else if (keyCode == 32) {
            addText(' '); // SPACE
         } else {
           addText(key);
         }
      }
   }
   
   // Afegeix la lletra c al final del text
   void addText(char c) {
      if (this.text.length() < this.numCols*this.numRows) {
         this.text += c;
         println("TEXT:"+this.text);
      }
      updateLines();
   }
   
   // Lleva la darrera lletra del text
   void removeText() {
      if (text.length()> 0) {
         text = text.substring(0, text.length()-1);
      }
      updateLines();
   }

   // Indica si el ratolí està sobre el camp de text
   boolean mouseOverTextField() {
      if (mouseX >= this.x && mouseX <= this.x + this.w) {
         if (mouseY >= this.y && mouseY <= this.y + this.h) {
            return true;
         }
      }
      return false;
   }
   
   // Selecciona el camp de text si pitjam a sobre
   // Deselecciona el camp de text si pitjam a fora
   void isPressed() {
      if (mouseOverTextField()) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
