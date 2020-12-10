
class LlistaLink {
 
  Node tail, head;
  int counter;
  
  LlistaLink(){
    tail = null;
    head = null;
    counter = 0;
  }
  
  void prepend(int n){
    
    if(isEmpty()){
      Node newNode = new Node(n, null);
      tail = newNode;
      head = newNode;
    }
    else {
      Node newNode = new Node(n, head);
      head = newNode;
    }
    
    counter++;
  }
  
  void append(int n){
    
    Node newNode = new Node(n, null);
    if(isEmpty()){
      tail = newNode;
      head = newNode;
    }
    else {
      tail.seguent = newNode;
      tail = newNode;
    }
    counter++;
  }
  
  boolean isEmpty(){
    return counter==0;
  }
  
  int numElements(){
    return counter;
  }
  
  int getElementAt(int p){
    int i= 0;
    int value = -1;
    Node n = head;
    while(i!=p && n!=null){
      value = n.value;
      n = n.seguent;
      i++;
    }
    return value;
  }
  
  int getFirst(){
    if(!isEmpty()){
      return head.value;
    }
    else {
      return -1;
    }
  }
  
  int getLast(){
    if(!isEmpty()){
      return tail.value;
    }
    else {
      return -1;
    }
  }
  
  int removeFirst(){
    Node n = head;
    int value = n.value;
    head = n.seguent;
    counter --;
    return value;
  }
  
  int removeLast(){
    
    Node nLast = tail;
    int value = nLast.value;
    
    Node n = head;
    Node prev = head;

    while(n!=nLast){
      prev = n;
      n = n.seguent;
    }
    
    prev.seguent = null;
    tail = prev;
    counter--;
    
    return value;
  }
    
  
  
  int removeAt(int p){
    
    if(p==0){
      return removeFirst();
    }
    else if(p==numElements()-1){
      return removeLast();
    }
    else {
    
      int i = 0;
      int value = -1;
      Node n = head;
      Node prev = head;
  
      while(i!=p && n!=null){
        prev = n;
        n = n.seguent;
        value = n.value;
        i++;
      }
      
      prev.seguent = n.seguent;
      counter--;
      
      return value;
    }
  }
  
  
  void display(int x, int y){
    float r = 70; strokeWeight(3);
    Node n = head;
    int i= 0;
    while(n != null){
      fill(0); textSize(24); textAlign(CENTER);
      text(i, x + i*r + r/2 , y - r/2);
      fill(255);
      rect(x + i*r, y , r,r);
      fill(255,0,0);
      text(n.value,  x + i*r + r/2 , y + r/1.5 );
      n = n.seguent;
      i++;
    }
    
    fill(0); textSize(32);
    text("^", x + r/2, y  + r*1.5);
    text("|", x + r/2, y  + r*1.75);
    text("Head", x  + r/2, y  + r*2.2);
    
    text("^", x + r*(l.numElements()-1) + r/2, y  + r*1.5);
    text("|", x + r*(l.numElements()-1) + r/2, y  + r*1.75);
    text("|", x + r*(l.numElements()-1) + r/2, y  + r*2.5);
    text("Tail", x + r*(l.numElements()-1) + r/2, y + r*3);
  }
  
}
