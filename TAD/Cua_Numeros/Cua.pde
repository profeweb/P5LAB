
class Pila {
 
  int[] array;
  int top = -1;
  
  Pila(){
    array = new int [10];
  }
  
  void push(int n){
    top++;
    array[top] = n;
  }
  
  int pop(){
    int temp = top;
    top--;
    return array[temp];
  }
  
  boolean isEmpty(){
    return top==-1;
  }
  
  boolean isFull(){
    return top==array.length-1;
  }
  
  int numElements(){
    return top+1;
  }
  
  void display(int x, int y){
    float r = 70; strokeWeight(3);
    for(int i=array.length-1; i>=0; i--){
      fill(0); textSize(24);
      text(i, x - r/1.5, y + (array.length - i - 1)*r + r/2);
      fill(255);
      rect(x, y + i*r, r,r);
    }
    
    for(int i=array.length-1; i>=0; i--){
      if(i<=top){
        fill(255,0,0); textSize(24); textAlign(CENTER);
        text(array[i],  x + r/2.2, y + (array.length - i - 1)*r + r/2);
      }
    }
    
    fill(0); textSize(32); textAlign(LEFT);
    text("<-- Top("+top+")", x + r*1.2, y + (array.length - top -1)*r + r/2);
  }
  
}
