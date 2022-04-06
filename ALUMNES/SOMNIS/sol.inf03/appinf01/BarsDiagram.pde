
class BarsDiagram {
  
  // Dimensions del diagrama de Barres
  float x, y, w, h;
  
  // Informació del diagrama (textos, valors i colors)
  String[] texts;
  float[] values;
  float[] percentages;
  color[] colors;
  
  // Suma total dels valors
  float total;
  
  // Constructor
  
  BarsDiagram(float x, float y, float w, float h){
    this.x = x; this.y = y; this.w = w; this.h = h;
  }
  
  // Setters
  
  void setTexts(String[] t){
    this.texts = t;
  }
  
  void setValues(float[] v){
    this.values = v;
    this.total = 0;
    for(int i=0; i<values.length; i++){
      this.total += this.values[i];
    }
    
    this.percentages = new float[values.length];
    for(int i=0; i<percentages.length; i++){
      this.percentages[i] = (this.values[i] / this.total)*100;
    }
  }
  
  void setColors(color[] c){
    this.colors = c;
  }
  
  // Dibuixa el Diagrama de Sectors
  
  void display(){
    pushStyle();
    
    float widthBar = w / (float) this.values.length;
    
    for(int i=0; i<this.values.length; i++){
      
      float barValue = (this.values[i] / this.total)*h;
      float xBar = this.x + widthBar*i;
      
      fill(colors[i]); stroke(0); strokeWeight(5);
      rect(xBar, this.y + this.h - barValue, widthBar, barValue);
      
      float textX = xBar + widthBar/2;
      float textY = this.y + this.h + 50;
      fill(0); textAlign(CENTER); textSize(24);
      text(this.texts[i], textX, textY);
      
      float percX = xBar + widthBar/2;
      float percY = this.y + this.h - barValue - 50;
      String percentage = nf(this.percentages[i], 2, 2);
      fill(0); textAlign(CENTER); textSize(18);
      text(percentage+"%", percX, percY);
      
      textSize(24);
      text((int)this.values[i], percX, percY - 30);
      
    }
    popStyle();
  }
  
}
