int[] A = {22, 8, 4, 1, 7, 9};

void setup(){
  println("Abans d'ordenar: ");
  printArray(A);
  bubbleSortRec(A, A.length-1);
  println("Després d'ordenar: ");
  printArray(A);
}

void swap(int[] A, int i, int j){
  int temp = A[i];
  A[i] = A[j];
  A[j] = temp;
}

void bubbleSortRec(int[] A, int f){
  if(f>0){
    for(int i=0; i<f; i++){
      if(A[i]>A[i+1]){
        swap(A, i, i+1);
      }
    }
    bubbleSortRec(A, f-1);
  }
}
