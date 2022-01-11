// Classe Botó

class SwitchButton {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 boolean enabled;  // Abilitat / desabilitat
 
 // Mètode Constructor
 SwitchButton(float x, float y, float w, float h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = color(155, 55, 155);
   fillColorOver = color(255, 55, 155);
   fillColorDisabled = color(150);
   strokeColor = color(0);
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 void toggle(){
   this.enabled = !this.enabled;
 }
 
 // Dibuixa el botó
 void display(){
   
   pushStyle();
   
   if(!enabled){
     fill(fillColorDisabled);  // Color desabilitat
   }
   else if(mouseOverButton()){
     fill(fillColorOver);      // Color quan ratolí a sobre
   }
   else{
     fill(fillColor);          // Color actiu però ratolí fora
   }
   stroke(strokeColor); strokeWeight(2);        //Color i gruixa del contorn
   rect(this.x, this.y, this.w, this.h, 10);    // Rectangle del botó
   
   rectMode(CENTER); textAlign(CENTER); textSize(24);
   if(this.enabled){
     rect(this.x + this.h/2, this.y + this.h/2, this.h-10, this.h-10, 5);
     fill(0);
     text("Sí", this.x + this.h/2, this.y + this.h/2 + 10);
   }
   else {
     rect(this.x + this.w - this.h/2, this.y + this.h/2, this.h-10, this.h-10, 5);
     fill(0);
     text("No", this.x + this.w - this.h/2, this.y + this.h/2 + 10);
   }
     
  popStyle();
   
 }
 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h); 
 }
  
}
