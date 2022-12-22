// Component Camp de Text

class TextPositionField {
  
  // Propietats del camp de text
  float x, y, h, w;
  
  // Colors
  color bgColor = color(140, 140, 140);
  color fgColor = color(0, 0, 0);
  color selectedColor = color(190, 190, 60);
  color borderColor = color(30, 30, 30);
  int borderWeight = 1;
  
  // Text del camp
  String text = "0";
  int textSize = 32;
  
  String labelText="";

  boolean selected = false;
   
  // Constructor
  TextPositionField(String lt, float x, float y, float w,float h) {
      this.labelText = lt;
      this.x = x; this.y = y; 
      this.w = w; this.h = h;
   }
  
  // Dibuixa el Camp de Text
  void display() {

      if (selected) {
         fill(selectedColor);
      } else {
         fill(bgColor);
      }
      
      strokeWeight(borderWeight);
      stroke(borderColor);
      rect(x, y, w, h, 5);
      
      fill(fgColor);
      textSize(textSize); textAlign(CENTER);
      text(text, x + w/2, y + textSize +5);
      
      fill(0); textAlign(CENTER);
      text(labelText, x + w/2, y - textSize/2);
   }
   
   // Afegeix, lleva el text que es tecleja
   void keyPressed(char key, int keyCode) {
      if (selected) {
         if (keyCode == (int)BACKSPACE) {
            removeText();
         } else if (keyCode == 32) {
            addText(' '); // SPACE
         } else {
            
           boolean isKeyNumber = (key >= '0' && key <= '9');
      
           if (isKeyNumber || key=='-') {
               addText(key);
           }
         }
      }
   }
   
   // Afegeix la lletra c al final del text
   void addText(char c) {
      if (this.text.length()<3) {
         this.text += c;
      }
   }
   
   // Lleva la darrera lletra del text
   void removeText() {
      if (this.text.length()> 0) {
         text = text.substring(0, text.length() - 1);
      }
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
