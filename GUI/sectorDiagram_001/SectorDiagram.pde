
class SectorDiagram {
  
  // Dimensions del Diagrama de Sectors
  float x, y, r;
  
  // Informació del diagrama (textos, valors i colors)
  String[] texts;
  float[] values;
  float[] percentages;
  color[] colors;
  
  // Suma total dels valors
  float total;
  
  // Constructor
  
  SectorDiagram(float x, float y, float r){
    this.x = x; this.y = y; this.r = r;
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
    
    float angStart = 0;
    for(int i=0; i<this.values.length; i++){
      
      float sectorValue = (this.values[i] / this.total)*TWO_PI;
      float angEnd = angStart + sectorValue;
      
      fill(colors[i]); stroke(0); strokeWeight(5);
      arc(this.x, this.y, 2*this.r, 2*this.r, angStart, angEnd);
      
      float textX = this.x + (this.r + 50)*cos((angStart+angEnd)/2f);
      float textY = this.y + (this.r + 50)*sin((angStart+angEnd)/2f);
      fill(0); textAlign(CENTER); textSize(24);
      text(this.texts[i], textX, textY);
      
      float percX = this.x + (this.r/2)*cos((angStart+angEnd)/2f);
      float percY = this.y + (this.r/2)*sin((angStart+angEnd)/2f);
      String percentage = nf(this.percentages[i], 2, 2);
      fill(255); textAlign(CENTER); textSize(18);
      text(percentage+"%", percX, percY);
      
      angStart = angEnd;
    }
    popStyle();
  }
  
}
