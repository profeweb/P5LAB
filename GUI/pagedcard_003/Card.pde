class Card {
  
 // Propietats
 String title;
 String description;
 
 // Dimensions
 float x, y, w, h, b;
 
 // Constructors
 
 Card(){
 }
 
 Card(String title, String place, String date, String section, String description){
   this.title = title;
   this.description = description;
 }
 
 Card(String[] info){
   this.title = info[0];
   this.description = info[1];
 }
 
 //Setters
 
 void setDimensions(float x, float y, float w, float h, float b){
   this.x = x; this.y = y;
   this.w = w; this.h = h;
   this.b = b;
 }
 
 
 // Dibuixa la Card
 
 void display(boolean selectedCard){
   
   pushStyle();
   
   // Rectangle inferior
   stroke(0);
   if(selectedCard){
       fill(200, 100, 100);
   }
   else if(this.mouseOver()){
       fill(200);
   }
   else {
       fill(220);
   }
   rect(x, y, w, h, b/2);
  
   
   // Títol
   fill(0); textSize(24); textAlign(LEFT);
   text(title, x + 20, y + h/2 + 10);
   
   line(x + 145, y + 10, x + 145 , y + h - 10);
   
   // Descripció
   fill(0);textSize(20); textAlign(LEFT);
   text(description, x + 160, y + 10, w-170, h-20);
   
   
   popStyle();
 }
 
 boolean mouseOver(){
   return this.x < mouseX && mouseX < this.x + this.w &&
          this.y < mouseY && mouseY < this.y + this.h; 
 }
 
  
}
