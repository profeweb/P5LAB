class Result {
  
 // Propietats
 String id;
 String title;
 String fecha;
 String description;
 String categoria;
 String lucidez;
 String email;
 String[] labels;
 
 // Constructor
 
 Result(String[] data){
   this.id = data[0];
   this.title = data[1];
   this.fecha = data[2];
   this.description = data[3];
   this.lucidez = data[4];
   this.categoria = data[5];
   this.email = data[6];
   this.labels = split(data[7], ",");
   
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
   fill(0); textSize(24); textAlign(LEFT);
   text(title, x + 10, y + h/7);
   
   // Fecha
   fill(0); textSize(16); textAlign(LEFT);
   text(fecha, x + 10, y + 2*h/7);
   
   // Categoria
   fill(100, 100, 200); noStroke();
   rect(x + w - 100, y + 8, 100, 25);
   fill(0);  textAlign(RIGHT); textSize(14);
   text(categoria, x + w - 10, y + 25);
   
   // Descripció
   fill(0);textSize(14); textAlign(LEFT);
   text(description+" ...", x + b, y + 3*h/7, w - b*2, h/4);
   
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
