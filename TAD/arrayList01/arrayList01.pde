
// TAD Llista implementada amb un Array
// https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html

ArrayList<Integer> numList;

void setup(){
  
  // Constructor
  numList = new ArrayList<Integer>();
  
  // Afegir elements 10, 5, 7 i 3
  numList.add(10);
  numList.add(5);
  numList.add(7);
  numList.add(3);
  
  // Eliminar element a la posició 2
  numList.remove(2);
  
  // Recorrer la llista
  if(numList.isEmpty()){
    println("Llista buida");
  }
  else {
    println("Llista amb "+numList.size()+ "elements: ");
    for(int i=0; i<numList.size(); i++){
      int n = numList.get(i);
      println(n);
    }
  }
 
  
}
