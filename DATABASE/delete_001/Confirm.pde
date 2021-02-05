class Confirm {
  
  // Dimensions
  float x, y, w, h;
  
 // Propietats
 PImage img;
 String title;
 String message;
 
 Button bAceptar, bCancelar;
 float buttonW = 200, buttonH = 80;
 
 boolean visible = true;
 
 // Constructor
 
 Confirm(String title, String message, float x, float y, float w, float h){
   this.title = title;
   this.message = message;
   this.x = x; this.y = y; 
   this.w = w; this.h = h;
   this.bAceptar = new Button("Acceptar", x + w/4 - buttonW/2, 
                                         y + h - buttonH*1.5, 
                                         buttonW, buttonH);
   this.bCancelar = new Button("Cancelar", x + 3*w/4 - buttonW/2, 
                                         y + h - buttonH*1.5, 
                                         buttonW, buttonH);
 }
 
 //Setters
 
 void setImage(PImage img){
   this.img = img;
 }
 
 void setTexts(String title, String message){
   this.title = title;
   this.message = message;
 }
 
 void setVisible(boolean b){
   this.visible = b;
   if(!this.visible){
     this.bAceptar.setEnabled(false);
     this.bCancelar.setEnabled(false);
   }
   else {
     this.bAceptar.setEnabled(true);
     this.bCancelar.setEnabled(true);
   }
 }
 
 // Dibuixa el Confirm
 
 void display(){
   
   if(this.visible){
     float b = 40;
     
     pushStyle();
     
     // Rectangle
     stroke(0); strokeWeight(10);fill(200, 200, 100);
     rect(x, y, w, h, b/2);
     
     line(x, y + 2*b , x+w, y + 2*b);
     
     // Títol
     fill(0); textSize(38); textAlign(LEFT);
     text(title, x + b, y + 1.4*b);
     
     // Missatge
     fill(0);textSize(24); textAlign(CENTER);
     text(message, x + w/2, y + 4*b);
     
     // Botons d'Acceptar i Cancelar
     bAceptar.display();
     bCancelar.display();
     popStyle();
   }
 }
 
 // Comprova si estam sobre algun dels botons del Confirm
 boolean mouseOverButtons(){
   return (( bAceptar.mouseOverButton()  && bAceptar.enabled ) || 
           ( bCancelar.mouseOverButton() && bCancelar.enabled) );
 }
 
  
}
