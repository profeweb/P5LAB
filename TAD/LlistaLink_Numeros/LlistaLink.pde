
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
    return tail==null;
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
  
  /*
  int removeAt(int p){
    int temp = array[p];
    for(int i=p; i<tail; i++){
      array[i] = array[i+1];
    }
    tail--;
    return temp;
  }
  
  void insertAt(int p, int v){
    for(int i=tail+1; i>p; i--){
      array[i] = array[i-1];
    }
    array[p] = v;
    tail++;
  }
  */
  
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
    //text("^", x + tail*r + r/2, y  + r*1.5);
    //text("|", x + tail*r + r/2, y  + r*1.75);
    //text("Tail("+tail+")", x + tail*r + r/2, y  + r*2.2);
  }
  
}
