
class Arbre {
 
  Node arrel;
  
  Arbre(){
    this.arrel = null;
  }
  
  Arbre(int n){
    this.arrel = new Node(n);
  }
  
  boolean isEmpty(){
    return this.arrel == null;
  }
  
  void addElement(int n){
    if(isEmpty()){
      this.arrel = new Node(n);
    }
    else {
      Node pare = this.arrel;
      while ((pare.esq!=null && n<pare.num)
      ||(pare.dret!=null && n>pare.num)) {
        if(n < pare.num){
          pare = pare.esq;
        }
        else {
          pare = pare.dret;
        }
      }
      if(n < pare.num){
        pare.esq = new Node(n);
      }
      else {
        pare.dret = new Node(n);
      }
    }
  }
  
  void inordreArbre(){
    this.arrel.inordre();
  }
  
  
  void display(Node n, float x, float y, float r, int level){
    
    float dx = (width/3)/(level+2);
    n.display(x, y, r, level);
    
    if(n.esq != null){
      display(n.esq, x-dx, y + 2*r, r, level +1);
    }
    
    if(n.dret != null){
      display(n.dret, x+dx, y + 2*r, r, level +1);
    }
  }
 
  
}
