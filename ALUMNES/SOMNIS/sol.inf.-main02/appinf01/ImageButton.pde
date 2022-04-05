// Classe Botó

class ImageButton {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 
 PImage img, imgOver, imgDisabled;  // Imatges del botó
 
 boolean enabled;   // Abilitat / desabilitat
 
 // Mètode Constructor
 ImageButton(PImage[] imgs, float x, float y, float w, float h){
   this.img = imgs[0];
   this.imgOver = imgs[1];
   this.imgDisabled = imgs[2];
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.enabled = true;
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 // Dibuixa el botó
 void display(){
   
   if(!enabled){
     imageMode(CORNER);
     image(imgDisabled, this.x, this.y, this.w, this.h);
   }
   else if(mouseOverButton()){
     imageMode(CORNER);
     image(imgOver, this.x, this.y, this.w, this.h);
   }
   else{
     imageMode(CORNER);
     image(img, this.x, this.y, this.w, this.h);
   }
   
 }
 
 // Indica si el cursor està sobre el botó
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h); 
 }
  
}
