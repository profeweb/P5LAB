class Node {
  
  int valor;
  Node seg;
  
  // Constructor (1): quan no sabem qui és el seguent node
  Node(int v){
    this.valor = v;
    this.seg = null;
  }
  
  // Constructor (2): quan sí sabem qui és el seguent node
  Node(int v, Node sn){
    this.valor = v;
    this.seg = sn;
  }
  
  // Getters
  int getValor(){
    return this.valor;
  }
  
  Node getSegNode(){
    return this.seg;
  }
  
  // Dibuixa el node
  void display(float x, float y, float w){
    
    fill(255);
    rect(x, y, w, w);
    
    fill(0); textAlign(CENTER);
    text(this.valor, x + w/2, y + w/2 + 10);
    
    if(this.seg!=null){
      line(x + w, y + w/2, x + 2*w, y +w/2);
      fill(0);
      triangle(x + 2*w, y +w/2, 
               x + 2*w - w/4, y +w/2 - w/4, 
               x + 2*w - w/4, y +w/2 + w/4);
    }
    else {
      line(x + w/2, y + w, x + w/2, y + 2*w);
      circle(x + w/2, y + 2*w, 10);
      text("TAIL", x + w/2, y + 2*w + 50);
    }
  }
  
}
