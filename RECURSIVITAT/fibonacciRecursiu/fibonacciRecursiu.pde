
void setup(){
  int n = 15;
  int f = fibonacci(n);
  println("Fibonacci de "+n+" és "+f);
}

int fibonacci(int n){
  if(n==0 || n==1) { return 1; }
  else { return fibonacci(n-2) + fibonacci(n-1); }
}
