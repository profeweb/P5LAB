
class Casella {
  
  int fila, columna;
  int valor; // 0, 1 (o), 2 (x)
  
  int x, y, w;
  
  Casella(int f, int c, int x, int y, int w){
    this.fila = f; this.columna = c;
    this.valor = 0;
    this.x = x; this.y = y; this.w = w;
  }
  
  void setValor(int v){
    this.valor = v;
  }
  
  void display(){
    rect(x, y, w, w);
    if(valor==1){
      line(x, y, x+w, y+w);
      line(x+w, y, x, y+w);
    }
    else if(valor==2){
      ellipse(x+w/2, y+w/2, w/2, w/2);
    }
  }
  
  boolean estaDins(float x, float y){
    return (x>this.x && x<this.x+ this.w &&
       y>this.y && y<this.y+this.w);
  }
  
}
