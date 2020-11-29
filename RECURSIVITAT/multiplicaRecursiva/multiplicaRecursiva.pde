
void setup(){
  int a = 3;
  int b = 8;
  int m = mult(a, b);
  println("El producte de "+a+" per "+b+" és: "+m);
}

int mult(int a, int b){
    if(a==0 || b==0){ return 0; }
    else { return mult(a, b-1) + a; }
}
