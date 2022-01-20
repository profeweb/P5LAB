class Node {
  
  int num;
  Node esq, dret;
  
  Node(int n){
    this.num = n;
    this.esq = null;
    this.dret = null;
  }
  
  void setFillEsq(Node f){
    this.esq = f;
  }
  
  void setFillDret(Node f){
    this.dret = f;
  }
  
  void inordre(){
    if(this.esq != null){ this.esq.inordre(); }
    print(this.num, ", ");
    if(this.dret != null){ this.dret.inordre(); }
  }
  
  void preordre(){
    print(this.num, ", ");
    if(this.esq != null){ this.esq.inordre(); }
    if(this.dret != null){ this.dret.inordre(); }
  }
  
  void postordre(){
    if(this.esq != null){ this.esq.inordre(); }
    if(this.dret != null){ this.dret.inordre(); }
    print(this.num, ", ");
  }
  
  
  void display(float x, float y, float r, int level){
    
    float dx = map(level, 0, 5,  maxDx, minDx);
    dx = (width/4)/(level+2);
    pushStyle();
    
      if(this.esq!=null){
        line(x, y, x - dx, y + 2*r);
      }
      
      if(this.dret!=null){
        line(x, y, x + dx, y + 2*r);
      }
      
      ellipse(x, y, r,r);
      fill(0); textSize(18); textAlign(CENTER);
      text(this.num, x, y + r/4);
    popStyle();
  }
  
  
}
