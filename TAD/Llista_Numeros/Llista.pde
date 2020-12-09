
class Llista {
 
  int[] array;
  int tail = -1;
  
  Llista(){
    array = new int [10];
  }
  
  void prepend(int n){
    for(int i=tail; i>=0; i--){
      array[i+1] = array[i];
    }
    array[0] = n;
    tail++;
  }
  
  void append(int n){
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
  
  int getElementAt(int i){
    return array[i];
  }
  
  int getFirst(){
    if(!isEmpty()){
      return array[0];
    }
    else {
      return -1;
    }
  }
  
  int getLast(){
    if(!isEmpty()){
      return array[tail];
    }
    else {
      return -1;
    }
  }
  
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
  
  void display(int x, int y){
    float r = 70; strokeWeight(3);
    for(int i=0; i<array.length; i++){
      fill(0); textSize(24); textAlign(CENTER);
      text(i, x + i*r + r/2 , y - r/2);
      fill(255);
      rect(x + i*r, y , r,r);
      if(i<=tail){
        fill(255,0,0);
        text(array[i],  x + i*r + r/2 , y + r/1.5 );
      }
    }
    
    fill(0); textSize(32);
    text("^", x + tail*r + r/2, y  + r*1.5);
    text("|", x + tail*r + r/2, y  + r*1.75);
    text("Tail("+tail+")", x + tail*r + r/2, y  + r*2.2);
  }
  
}
