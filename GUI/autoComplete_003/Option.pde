// Classe Option

class Option {
  
 // Propietats d'un option:
 float x, y, w, h;  // Posició i dimensions
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 String textBoto;  // Text
 boolean enabled;  // Abilitat / desabilitat
 
 // Mètode Constructor
 Option(String text, float x, float y, float w, float h){
   this.textBoto = text;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = color(255);
   fillColorOver = color(155, 155, 155);
   fillColorDisabled = color(150);
   strokeColor = color(0);
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
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
   noStroke();
   rect(this.x, this.y, this.w, this.h);    // Rectangle de l'option
   
   // Text (color, alineació i mida)
   fill(0); textAlign(CENTER); textSize(34);
   text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10);
   popStyle();
 }
 
 // Indica si el cursor està sobre l'option
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h); 
 }
  
}
