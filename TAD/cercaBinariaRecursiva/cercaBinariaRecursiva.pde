
int[] A = {5, 8, 10, 18, 33, 44, 76, 95};

int valor = 76;

void setup(){
 
  int pos = cercaBinariaR(A, 0, A.length-1, valor);
  
  if(pos==-1){
    println("Valor no trobat!!");
  }
  else {
    println("Valor "+valor+" trobat a la posició "+pos+" de l'array.");
  }
  
}

int cercaBinariaR(int[] A, int b, int t, int v){

  if(t>=b){
    int m = (t + b)/2;
    if(A[m]==v){
      return m;
    }
    else if(A[m]>v){ 
      println("CercaBinaria de "+b+" a "+ (m-1));
      return cercaBinariaR(A, b, m-1, v);
    }
    else { 
      println("CercaBinaria de "+(m+1)+" a "+ t);
      return cercaBinariaR(A, m+1, t, v);
    }
  }
  return -1;
}
