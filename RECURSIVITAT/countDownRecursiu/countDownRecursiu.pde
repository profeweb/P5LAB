
void setup(){
  countDown(23);
}

void countDown(int n){
  if(n==0) { println("Boooommmm!"); }
  else {
    println(n);
    countDown(n-1);
  }
}
