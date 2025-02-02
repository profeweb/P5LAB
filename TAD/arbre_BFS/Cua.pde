class Cua {
 
  Node[] array;
  int last = -1;
  
  Cua(){
    array = new Node [100];
  }
  
  void encola(Node n){
    last++;
    array[last] = n;
  }
  
  Node desencola(){
    Node temp = array[0];
    for(int i=0; i<last; i++){
      array[i] = array[i+1];
    }
    last--;
    return temp;
  }
  
  boolean isEmpty(){
    return last==-1;
  }
  
  boolean isFull(){
    return last==array.length-1;
  }
  
  int numElements(){
    return last+1;
  }
  
}
