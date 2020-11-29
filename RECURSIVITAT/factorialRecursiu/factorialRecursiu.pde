
void setup(){
  int n = 8;
  int f = factorial(n);
  println("Factorial de "+n+" és "+f);
}

int factorial(int n){
  if(n==0) { return 1; }
  else { return n*factorial(n-1); }
}
