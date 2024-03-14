
int[] A = {10, 5, 18, 33, 44, 76, 8, 95};
int valor = 33;

void setup(){
 
  int pos = cercaLineal(A, valor);
  
  if(pos==-1){
    println("Valor no trobat!!");
  }
  else {
    println("Valor "+valor+" trobat a la posició "+pos+" de l'array.");
  }
  
}

int cercaLineal(int[] A, int v){
  for(int i=0; i<A.length; i++){
    if(A[i]== v){
      return i;
    }
    else if(A[i]>v){
      return -1;
    }
  }
  return -1;
}
