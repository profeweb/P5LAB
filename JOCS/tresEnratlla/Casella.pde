
class Casella {
 
  int fila, columna;
  int valor; // 0, 1, 2
  
  int x, y, w;
  
  Casella(int f, int c, int x, int y, int w){
    this.fila = f;
    this.columna = c;
    this.valor = 0;
    this.x = x;
    this.y = y;
    this.w = w;
  }
  
  void setValor(int v){
    this.valor = v;
  }
  
  void display(){
    rect(x, y, w, w);
    if(valor==1){
      line(x, y, x+w, y+w);
      line(x, y+w, x+w, y);
    }
    else if(valor==2){
     ellipse(x + w/2, y + w/2, w/2, w/2);
    }
  }
  
  boolean estaDins(float x, float y){
    return (this.x<=x && x<=this.x+w && this.y<=y && y<=this.y+w);
  }
    
}
