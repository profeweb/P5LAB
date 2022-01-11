
class LinesDiagram {
  
  // Dimensions del diagrama de Barres
  float x, y, w, h;
  
  // Informació del diagrama (textos, valors i colors)
  String[] texts;
  float[] values;
  color colorLines;
  float maxValue;
  
  // Constructor
  
  LinesDiagram(float x, float y, float w, float h){
    this.x = x; this.y = y; this.w = w; this.h = h;
  }
  
  // Setters
  
  void setTexts(String[] t){
    this.texts = t;
  }
  
  void setValues(float[] v){
    this.values = v;
    this.maxValue = this.values[0];
    for(int i=0; i<values.length; i++){
      if(this.values[i]>this.maxValue){
        maxValue = this.values[i];
      }
    }
    
  }
  
  void setColors(color c){
    this.colorLines = c;
  }
  
  // Dibuixa el Diagrama de Sectors
  
  void display(){
    pushStyle();
    
    stroke(0); strokeWeight(2);
    line(this.x, this.y, this.x, this.y + this.h);
    line(this.x, this.y + this.h, this.x +  this.w, this.y + this.h);
    
    float widthBar = w / (float) this.values.length;
    
    for(int i=0; i<this.values.length-1; i++){
      
      // Posició Mes i
      float barValue1 = this.y + this.h -map(this.values[i], 0, maxValue, 0, h-50);
      float xBar1 = this.x + widthBar*i + widthBar/2;
      
      // Posició Mes i+1
      float barValue2 = this.y + this.h - map(this.values[i+1], 0, maxValue, 0, h-50);
      float xBar2 = this.x + widthBar*(i+1) + widthBar/2;
      
      // Linia de mesos i a i+1
      stroke(colorLines); strokeWeight(2);
      line(xBar1, barValue1, xBar2, barValue2);
      
      // Quadradet del mes i
      noStroke();
      fill(colorLines); rectMode(CENTER);
      rect(xBar1, barValue1, 10, 10);
      
      // 
      float textY = this.y + this.h + 50;
      fill(0); textAlign(CENTER); textSize(24);
      text(this.texts[i], xBar1, textY);
      
      textSize(24);
      text((int)this.values[i], xBar1, barValue1 - 20);
      
      if(i+1==this.values.length-1){
        text(this.texts[i+1], xBar2, textY);
        text((int)this.values[i+1], xBar2, barValue2 - 20);
        
        noStroke();
        fill(colorLines); rectMode(CENTER);
        rect(xBar2, barValue2, 10, 10);
      }
      
    }
    popStyle();
  }
  
}
