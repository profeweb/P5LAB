
void setup(){
  int a = 100;
  int b = 75;
  int m = mcd(a, b);
  println("MCD de "+a+" per "+b+" és: "+m);
}

int minim(int a, int b){
  if(a < b) { return a; }
  else { return b; }
}

int maxim(int a, int b){
  return (a>b) ? a : b;
}

int mcd(int a, int b){
  int minAB = minim(a, b);
  int maxAB = maxim(a, b);
  if(maxAB % minAB ==0) { return minAB; }
  else { return mcd(minAB, maxAB % minAB); }
}
