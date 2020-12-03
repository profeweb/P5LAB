
class Cua {
 
  int[] array;
  int last = -1;
  
  Cua(){
    array = new int [10];
  }
  
  void encola(int n){
    last++;
    array[last] = n;
  }
  
  int desencola(){
    int temp = array[0];
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
  
  void display(int x, int y){
    float r = 70; strokeWeight(3);
    for(int i=array.length-1; i>=0; i--){
      fill(0); textSize(24);
      text(i, x + (array.length - i - 1)*r + r/2 , y - r/2);
      fill(255);
      rect(x + i*r, y , r,r);
    }
    
    for(int i=array.length-1; i>=0; i--){
      if(i<=last){
        fill(255,0,0); textSize(24); textAlign(CENTER);
        text(array[i],  x + (array.length - i - 1)*r + r/2 , y + r/1.5 );
      }
    }
    
    fill(0); textSize(32);
    text("^", x + (array.length - last -1)*r + r/2, y  + r*1.5);
    text("|", x + (array.length - last -1)*r + r/2, y  + r*1.75);
    text("Last("+last+")", x + (array.length - last -1)*r + r/2, y  + r*2.2);
  }
  
}
