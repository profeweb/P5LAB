// Arrays
int[] a = {3, 7, 9, 2, 5};
int[] b = {3, 5, 9, 1, 7};

void setup(){
  
  // Imprimeix les caselles de l'array A
  impArray(a);
  
}

// Imprimeix les caselles de l'Array en ordre ascendent
void impArray(int[] array){
  for(int i=0; i<array.length; i++){
    println(nf(i, 2, 0)+":["+array[i]+"]");
  }
}
