// Classe Botó

class SquareButton {
  
 // Propietats d'un botó:
 float x, y, s;  // Posició i dimensions
 
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor, fillColorOver, fillColorDisabled;
 
 PImage icona;       // Icona del botó
 
 boolean enabled;    // Abilitat / desabilitat
 
 // Mètode Constructor
 SquareButton(PImage icona, float x, float y, float s){
   this.icona = icona;
   this.x = x;
   this.y = y;
   this.s = s;
   this.enabled = true;
   fillColor = color(155, 155, 55);
   fillColorOver = color(255, 255, 55);
   fillColorDisabled = color(150);
   strokeColor = color(0);
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 // Dibuixa el botó
 void display(){
   
   if(!enabled){
     fill(fillColorDisabled);  // Color desabilitat
   }
   else if(mouseOverButton()){
     fill(fillColorOver);      // Color quan ratolí a sobre
   }
   else{
     fill(fillColor);          // Color actiu però ratolí fora
   }
   stroke(strokeColor); strokeWeight(10);          //Color i gruixa del contorn
   rectMode(CENTER);
   rect(this.x, this.y, this.s, this.s, 10);   // Rectangle del botó
   
   // Icona del botó
   imageMode(CENTER);
   image(icona, this.x, this.y, this.s, this.s);
 }
 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return mouseX >= this.x - this.s/2 && mouseX <= this.x + this.s/2 &&
          mouseY >= this.y - this.s/2 && mouseY <= this.y + this.s/2; 
 }
  
}
