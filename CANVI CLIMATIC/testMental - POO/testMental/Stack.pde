class Stack {
  
  float x, y;  // Coordenades de posició
  float w, h;  // Dimensions (amplada i alçada)
  color c;     // Color
  float val;   // Valor (%)
  
  Stack (float x, float y, float w, float h, color c, float val){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.val = val;
  }
  
  // Dibuixa la Pila
  void display(){
    fill(c);
    stroke(255);
    rect(x, y, w, h);
    fill(0); textAlign(CENTER);
    text(nf(val,2,2)+"%", x + w + 50 , y + h/2);
  }
    
}
