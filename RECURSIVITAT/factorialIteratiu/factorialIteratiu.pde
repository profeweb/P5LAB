
void setup(){
  int n = 8;
  int f = factorial(n);
  println("Factorial de "+n+" és "+f);
}

int factorial(int n){
  int f = 1;
  while(n>1){
    f = f * n;
    n = n - 1;
  }
  return f;
}
