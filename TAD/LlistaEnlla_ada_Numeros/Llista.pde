
class Llista {
 
  Node head;
  Node tail;
  int num;
  
  Llista(){
    head = null;
    tail = null;
    num = 0;
  }
  
  void prepend(int v){
    if(!isEmpty()){
      Node n = new Node(v, head);
      head = n;
    }
    else {
      Node n = new Node(v);
      head = n;
      tail = n;
    }
    num++;
    
  }
  
  void append(int v){
    if(!isEmpty()){
      Node n = new Node(v);
      tail = n;
    }
    else {
      Node n = new Node(v);
      head = n;
      tail = n;
    }
    num++;
  }
  
  boolean isEmpty(){
    return tail==null;
  }
  
  int numElements(){
    return num;
  }
  
  int getElementAt(int i){
    if(i<num && !isEmpty()){
      int k=0;
      Node n = head;
      while(k<i){
        n = n.getSegNode();
        k++;
      }
      return n.getValor();
    }
    else {
      return -1;
    }
  }
  
  int getFirst(){
    return getElementAt(0);
  }
  
  int getLast(){
    return getElementAt(num);
  }
  
  int removeAt(int p){
    if(p<num && !isEmpty()){
      int k=0;
      Node n = head;
      while(k<p){
        n = n.getSegNode();
        k++;
      }
      Node ns = n.getSegNode();
      int v = n.valor;
      n.seg = ns;
      return v;
    }
    return -1;
  }
  
  void insertAt(int p, int v){
    if(p<num && !isEmpty()){
      int k=0;
      Node n = head;
      while(k<p){
        n = n.getSegNode();
        k++;
      }
      Node ns = n.getSegNode();
      Node nn = new Node(v, ns);
      n.seg = nn;
      num++;
    }
  }
  
  void display(int x, int y, int wn){
    
    strokeWeight(3);
    
    Node n = head;
    while(n.getSegNode()!=null){
      n.display(x, y, wn);
    }
    
  }
  
}
