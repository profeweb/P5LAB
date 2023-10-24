class Poligon {
  
  PVector[] vertexs;
  
  
  Poligon(PVector ... vs){
    this.vertexs = new PVector[vs.length];
    for(int i=0; i<vs.length; i++){
      this.vertexs[i] = vs[i].copy();
    }
  }
  
  PVector getCentroid(){
    PVector c = new PVector();
    for(PVector v : vertexs){
      c.add(v);
    }
    return c.div(vertexs.length);
  }
  
  void display(color cStroke, color cFill){
    stroke(cStroke); fill(cFill);
    beginShape();
    for(int i=0; i<vertexs.length; i++){
      vertex(vertexs[i].x,vertexs[i].y, vertexs[i].z);
     }
    endShape(CLOSE);
  }
}
