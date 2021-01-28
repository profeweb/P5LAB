// Bubble Sort

int[] A = {22, 8, 4, 1, 7, 9};

void setup(){
  
  println("Abans d'Ordenar:");
  printArray(A);
  
  bubbleSort(A);
  
  println("Després d'Ordenar:");
  printArray(A);
}


void swap(int[] A, int i, int j){
  int temp = A[i];
  A[i] = A[j];
  A[j] = temp;
}

void bubbleSort(int[] A){
  for(int i=0; i<A.length; i++){
    for(int j=i+1; j<A.length; j++){
      if(A[i]>A[j]){
        swap(A, i , j);
      }
    }
  }
}
