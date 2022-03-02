class Color{
  
 // Informació del color
 float[] cromosoma;
 
 
 // Constructor
 Color(float r, float g, float b){
   
   cromosoma = new float[3];
   
   cromosoma[0] = r;  // Gen R
   cromosoma[1] = g;  // Gen G
   cromosoma[2] = b;  // Gen B
 }
 
 // Constructor Aleatori
 Color(){
   this(random(255), random(255), random(255));
 }
 
 // Distància entre colors
 float distance(Color altre){
   float distR = abs(this.cromosoma[0] - altre.cromosoma[0]);
   float distG = abs(this.cromosoma[1] - altre.cromosoma[1]);
   float distB = abs(this.cromosoma[2] - altre.cromosoma[2]);
   return distR + distG + distB;
 }
 
 // Obtenir el color (GETTER)
 color getColor(){
   return color(this.cromosoma[0], this.cromosoma[1], this.cromosoma[2]);
 }
 
 // Visualitzar el color
 void display(float x, float y, float w, float h){
   pushStyle();
   fill(this.getColor());
   rectMode(CENTER);
   rect(x, y, w, h);
   fill(0); textAlign(CENTER); textSize(12);
   text(this.cromosoma[0], x, y - h/4);
   text(this.cromosoma[1], x, y - 0);
   text(this.cromosoma[2], x, y + h/4);
   popStyle();
 }
 
 // Creuar 2 colors (CROSS)
 Color creua(Color altre){
   float cR = (this.cromosoma[0] + altre.cromosoma[0]) / 2;
   float cG = (this.cromosoma[1] + altre.cromosoma[1]) / 2;
   float cB = (this.cromosoma[2] + altre.cromosoma[2]) / 2;
   return new Color(cR, cG, cB);
 }
 
 // Mutació en un color
 Color muta(){
   float mR = constrain(this.cromosoma[0] + random(-150, 150), 0, 255);
   float mG = constrain(this.cromosoma[1] + random(-150, 150), 0, 255);
   float mB = constrain(this.cromosoma[2] + random(-150, 150), 0, 255);
   return new Color(mR, mG, mB);
 }
 
}
