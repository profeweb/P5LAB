// Merge Sort

int[] A = {22, 8, 4, 1, 7, 9};

void setup(){
  
  println("Abans d'Ordenar:");
  printArray(A);
  
  mergeSort(A, 0, A.length-1);
  
  println("Després d'Ordenar:");
  printArray(A);
}


void swap(int[] A, int i, int j){
  int temp = A[i];
  A[i] = A[j];
  A[j] = temp;
}

void mergeSort(int[] A, int b, int e){
  if(b < e){
    int mid = (b + e) / 2;
    mergeSort(A, b, mid);
    mergeSort(A, mid+1, e);
    merge(A, b, mid, e);
  }
}

void merge(int[] A, int b, int m, int e){
  
  int i = b;
  int j = m + 1;
  int index = b;
  int k;
  
  int[] temp = new int[A.length];
  
  while(i<=m && j<=e){  
    if(A[i]<A[j]){  
      temp[index] = A[i];  
      i = i+1;  
    } 
    else {  
       temp[index] = A[j];  
       j = j+1;   
     }  
     index++;  
    }
    
    if(i>m){  
       while(j<=e){  
         temp[index] = A[j];  
         index++;  
         j++;  
       }  
    }  
    else   {  
        while(i<=m){  
            temp[index] = A[i];  
            index++;  
            i++;  
        }  
    }  
    k = b;  
    while(k<index)  {  
        A[k]=temp[k];  
        k++;  
    }  
}
