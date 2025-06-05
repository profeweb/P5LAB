
class Llista<E> {
 
  E[] array;
  int tail = -1;
  
  Llista(){
    array = (E[]) (new Object[10]);
  }
  
  void prepend(E n){
    for(int i=tail; i>=0; i--){
      array[i+1] = array[i];
    }
    array[0] = n;
    tail++;
  }
  
  void append(E n){
    tail++;
    array[tail] = n;
  }
  
  boolean isEmpty(){
    return tail==-1;
  }
  
  boolean isFull(){
    return tail==array.length-1;
  }
  
  int numElements(){
    return tail+1;
  }
  
  E getElementAt(int i){
    return array[i];
  }
  
  E getFirst(){
    if(!isEmpty()){
      return array[0];
    }
    else {
      return null;
    }
  }
  
  E getLast(){
    if(!isEmpty()){
      return array[tail];
    }
    else {
      return null;
    }
  }
  
  E removeAt(int p){
    E temp = array[p];
    for(int i=p; i<tail; i++){
      array[i] = array[i+1];
    }
    tail--;
    return temp;
  }
  
  void insertAt(int p, E v){
    for(int i=tail+1; i>p; i--){
      array[i] = array[i-1];
    }
    array[p] = v;
    tail++;
  }
  
  void display(int x, int y){
    float r = 70; strokeWeight(3);
    for(int i=0; i<array.length; i++){
      fill(0); textSize(24); textAlign(CENTER);
      text(i, x + i*r + r/2 , y - r/2);
      fill(255);
      rect(x + i*r, y , r,r);
      if(i<=tail){
        fill(255,0,0);
        text(array[i].toString(),  x + i*r + r/2 , y + r/1.5 );
      }
    }
    
    fill(0); textSize(32);
    text("^", x + tail*r + r/2, y  + r*1.5);
    text("|", x + tail*r + r/2, y  + r*1.75);
    text("Tail("+tail+")", x + tail*r + r/2, y  + r*2.2);
  }
  
}
