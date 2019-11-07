// Function declaration 
int fibonacci(int n) {
      if(n==1) {
          print( n +" = ");
          return 1; 
      } else {
          print( n +" + ");
          return fibonacci(n-1) + n;
     }
 }
void setup(){
    int f = fibonacci(10);   // Call to the function
    println(f);
}
