// Insertion Sort

int[] A = {22, 8, 4, 1, 7, 9};

void setup(){
  
  println("Abans d'Ordenar:");
  printArray(A);
  
  insertionSort(A);
  
  println("Després d'Ordenar:");
  printArray(A);
}


void swap(int[] A, int i, int j){
  int temp = A[i];
  A[i] = A[j];
  A[j] = temp;
}

void insertionSort(int[] A){
  for(int k=1; k<A.length; k++){
    int temp = A[k];
    int j = k - 1;
    while ( j >= 0 && temp <= A[j]){
      A[j+1] = A[j];
      j = j - 1;
    }
    A[j+1] = temp;
  }
}
