class Bar {
  
  float x, y;  // Coordenades de posició
  float w, h;  // Dimensions (amplada i alçada)
  color c;     // Color
  float val;   // Valor (%)
  
  Bar(float x, float y, float w, float h, color c, float val){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.val = val;
  }
  
  // Dibuixa la Barra
  void display(){
    fill(c);
    stroke(255);
    rect(x, y - h, w, h);
    fill(0); textAlign(CENTER);
    text(nf(val,2,2)+"%", x + w/2, y - h - 10);
  }
  
}
