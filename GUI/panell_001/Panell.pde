// Classe Panell

class Panell {

 // Propietats d'un panell
 float x, y, w, h;
 color fillColor, strokeColor;
 String titolPanell, textPanell;
 PShape icona;
 
 // Constructor de Panell
 Panell(String titol, String text, float x, float y, float w, float h){
   this.titolPanell = titol;
   this.textPanell = text;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.fillColor = color(245);
   this.strokeColor = color(0);
   this.icona = null;
 }
 
 // Setters
 
 void setIcona(String img){
   this.icona = loadShape(img);
 }
 
 
 // Dibuixa el panell
 void display(){
   
   fill(fillColor);
   stroke(strokeColor); strokeWeight(2);
   rect(this.x, this.y, this.w, this.h, 10);
   line(this.x, this.y+60, this.x + this.w, this.y + 60);
   
   if(icona!=null){
     shape(this.icona, this.x, this.y, 60, 60);
   }
   
   fill(0); textAlign(CENTER); textFont(font1);
   text(titolPanell, this.x + this.w/2, this.y + 40);
   
   fill(0); textAlign(LEFT); textFont(font2);
   text(textPanell, this.x + 20 , this.y + 80, this.w - 40, this.h - 80);
 }
 
}
