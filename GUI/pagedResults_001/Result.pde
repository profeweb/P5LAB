class Result {
  
 // Propietats
 String title;
 String description;
 String[] labels;
 
 Button bVeure;
 
 // Constructors
 
 Result(){
 }
 
 Result(String title, String description){
   this.title = title;
   this.description = description;
 }
 
 Result(String title, String description, String[] labels){
   this.title = title;
   this.description = description;
   this.labels = labels;
 }
 
 Result(String[] data){
   this.title = data[0];
   this.description = data[1];
   this.labels = split(data[2], ",");
   
}
 

 // Dibuixa la Card
 
 void display(float x, float y, float w, float h, float b, boolean mouseOver){
   
   pushStyle();
   
   // Rectangle inferior
   stroke(0); fill(220);
   if(mouseOver){
     fill(220, 100, 100);
   }
   rect(x, y, w, h, b/2);
   
   // imatge descriptiva
   float imgW = (w/3) - 2*b;
   float imgH = h - 2*b;
   
   // Títol
   fill(0); textSize(24); textAlign(CENTER);
   text(title, x + w/2, y + h/5);
   
   // Descripció
   fill(0);textSize(14); textAlign(LEFT);
   text(description+" ...", x + b, y + h/3, w - b*2, h/4);
   
   float espaiLabels = 220;
    for(int i=0; i<min(4, this.labels.length); i++){
      fill(200, 100, 100); noStroke();
      rect(x + b + i*espaiLabels, y + h - 40, 120, 30, 5);
      fill(0); 
      text(this.labels[i], x + 2*b + i*espaiLabels, y + h - 20);
    }
   
   popStyle();
 }
 
 String joinLabels(String separador){
    String txt = "";
    for(int i=0; i<this.labels.length; i++){
      txt = txt + this.labels[i] + ", ";
    }
    txt+="...";
    return txt;
  }
 
  
}
