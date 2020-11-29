
void setup(){
  int b = 3;
  int e = 8;
  int p = potencia(b, e);
  println("La potencia de "+b+" elevat a "+e+" és: "+p);
}

int potencia(int b, int e){
  if(e==0){ return 1; }
  else if(e%2==0){ return potencia(b, e/2) * potencia(b, e/2); }
  else { return potencia(b, (e-1)/2)*potencia(b, (e-1)/2)*b; }
}
