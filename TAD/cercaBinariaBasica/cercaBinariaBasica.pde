
int[] A = {5, 8, 10, 18, 33, 44, 76, 95};

int valor = 76;

void setup(){
 
  int pos = cercaBinaria(A, 0, A.length-1, valor);
  
  if(pos==-1){
    println("Valor no trobat!!");
  }
  else {
    println("Valor "+valor+" trobat a la posició "+pos+" de l'array.");
  }
  
}

int cercaBinaria(int[] A, int b, int t, int v){

  while(b <= t){
    int m = (t + b ) /2;
    if(A[m]==v){
      return m;
    }
    else if (A[m]> v) {
      t = m - 1;
    }
    else if (A[m]< v) {
      b = m + 1;
    }
  }
  return -1;
}
