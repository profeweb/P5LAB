class Casella {
  
  float x, y, w;
  int fila, columna;
  color c;
  
  Escac figura;
  boolean selected;
  
  Casella(float x, float y, float w, int f, int c, color col){
    this.x = x; this.y = y; this.w = w;
    this.fila = f; this.columna = c;
    this.c = col;
    this.figura = Escac.BUIDA;
    this.selected = false;
  }
  
  void setFigura(Escac f){
    this.figura = f;
  }
  
  void display(){
    pushStyle();
    if(this.selected){
      fill(200, 100, 100);
    }
    else {
      fill(this.c); 
    }
    noStroke();
    rect(this.x, this.y, this.w, this.w);
    popStyle();
  }
  
  boolean mouseDinsCasella(){
    return mouseX> this.x &&  mouseX< this.x + this.w && 
           mouseY > this.y && mouseY < this.y + this.w;
  }
  
}
