// Classe Filtre

class SwitchFilter{
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 boolean enabled;  // Abilitat / desabilitat
 String name;
 
 // Mètode Constructor
 SwitchFilter(String name, float x, float y, float w, float h){
   this.name = name;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = colorPrimari;
   fillColorOver = colorTerciari;
   fillColorDisabled = colorSecundari;
   strokeColor = color(0);
 }
 
 boolean getEnabled(){
   return enabled;
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 void setName(String n){
   this.name = n;
 }
 
 void toggle(){
   this.enabled = !this.enabled;
 }

 
 // Dibuixa el filtre
 void display(){
   
   pushStyle();
   
   fill(0);
   textAlign(CENTER); textSize(24);
   text(this.name, this.x + this.w/2, this.y - 20);
   
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
   rect(this.x, this.y, this.w, this.h, this.h/2);    // Rectangle del botó
   
   rectMode(CENTER); textAlign(CENTER); textSize(24);
   if(this.enabled){
     ellipse(this.x + this.h/2, this.y + this.h/2, this.h-10, this.h-10);
     fill(0);
     text("Sí", this.x + this.h/2, this.y + this.h/2 + 10);
   }
   else {
     ellipse(this.x + this.w - this.h/2, this.y + this.h/2, this.h-10, this.h-10);
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
