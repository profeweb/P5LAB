class Node {
  
  int valor;
  Node seg;
  
  Node(int v){
    this.valor = v;
    this.seg = null;
  }
  
  Node(int v, Node sn){
    this.valor = v;
    this.seg = sn;
  }
  
  int getValor(){
    return this.valor;
  }
  
  Node getSegNode(){
    return this.seg;
  }
  
  void display(float x, float y, float w){
    fill(255);
    rect(x, y, w, w);
    fill(0); textAlign(CENTER);
    text(this.valor, x + w/2, y + w/2);
  }
  
}
