// Component Camp de Temps

class PositionField {
  
  // Propietats del camp de temps
  int x, y, h, w;
  TextPositionField[] tf;
   
  // Constructor
  PositionField(int x, int y, int w, int h) {
      this.x = x; this.y = y; this.w = w; this.h = h;
      tf = new TextPositionField[3];
      tf[0] = new TextPositionField("X", x, y, w/3.1, h);
      tf[1] = new TextPositionField("Y", x + w/3, y, w/3.1, h);
      tf[2] = new TextPositionField("Z", x + 2*w/3, y, w/3.1, h);
   }
  
  // Dibuixa el Camp de Text
  void display() {
      for(int i=0; i<tf.length; i++){
        tf[i].display();
      }
   }
   
   // Escritura en algun dels camps de texte
   void keyPressed(char key, int keyCode) {
      for(int i=0; i<tf.length; i++){
        tf[i].keyPressed(key, keyCode);
      }
   }
   
   // Click sobre algun dels camps de texte
   void isPressed() {
     for(int i=0; i<tf.length; i++){
        tf[i].isPressed();
      }
   }
   
}
