
int[] array1 = {0,0,0,0,0,0,0,0,0,0};
int[] array2 = {0,0,0,0,0,0,0,0,0,0};

Pila p;

int max_size = 10;
int high = -1;
int x = 0, y = 0, n = 0, t =0;
int dig_value = 0, number = 123;

void setup(){
  println("Conversió del número: "+number);
  p = new Pila();
  convert2Binary(number);
}

void convert2Binary(int x){
  
  println("Càlculs...");
  
  while(x > 0){
    y = x % 2;
    p.push(y);
    x = (int) (x / 2);
  }
  
  while (!p.isEmpty()){
    t = p.pop();
    dig_value = (int) pow(2, p.numElements());
    println("Digit binari:"+(p.numElements())+", "+dig_value+" = "+ t);
  }
  
    
}
