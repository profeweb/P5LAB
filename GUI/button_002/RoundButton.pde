// Classe Botó

class RoundButton {
  
 // Propietats d'un botó:
 float x, y, r;  // Posició i dimensions
 
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor, fillColorOver, fillColorDisabled;
 
 PImage icona;       // Icona del botó
 
 boolean enabled;    // Abilitat / desabilitat
 
 // Mètode Constructor
 RoundButton(PImage icona, float x, float y, float r){
   this.icona = icona;
   this.x = x;
   this.y = y;
   this.r = r;
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
   ellipse(this.x, this.y, 2*this.r, 2*this.r);   // Cercle del botó
   
   // Icona del botó
   imageMode(CENTER);
   image(icona, this.x, this.y, 2*this.r, 2*this.r);
 }
 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return dist(mouseX, mouseY, this.x, this.y)<= this.r; 
 }
  
}
