// Selection Sort

int[] A = {22, 8, 4, 1, 7, 9};

void setup(){
  
  println("Abans d'Ordenar:");
  printArray(A);
  
  selectionSort(A);
  
  println("Després d'Ordenar:");
  printArray(A);
}


void swap(int[] A, int i, int j){
  int temp = A[i];
  A[i] = A[j];
  A[j] = temp;
}

int smallest(int[] A, int i){
  int small, pos;
  small = A[i];
  pos = i;
  for(int j=i+1; j<A.length; j++){
    if(A[j]<small){
      small = A[j];
      pos = j;
    }
  }
  return pos;
}

void selectionSort(int[] A){
  for(int i=0; i<A.length; i++){
    int j = smallest(A, i);
    swap(A, i , j);
  }
}
