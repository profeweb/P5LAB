// TAD Llista enllaçada
// https://docs.oracle.com/javase/7/docs/api/java/util/LinkedList.html

import  java.util.LinkedList;

LinkedList<Integer> numList;

void setup(){
  
  // Constructor
  numList = new LinkedList<Integer>();
  
  // Afegir elements 10, 5, 7 i 3
  numList.add(10);
  numList.add(5);
  numList.add(7);
  numList.add(3);
  
  // Eliminar element a la posició 2
  numList.remove(2);
  
  // Recorrer la llista
  for(int i=0; i<numList.size(); i++){
    int n = numList.get(i);
    println(n);
  }
  
}
