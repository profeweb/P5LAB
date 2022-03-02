import java.util.*;

String[] cities ={"A", "B", "C"};
List<String[]> pers;

void setup() { 
  
  pers = permutations(cities);
  
  for(String[] p : pers){
    for(int i=0; i<p.length; i++){
      print(p[i]+"\t");
    }
    println();
  }
}

// Retorna la llista amb totes les permutacions
List<String[]> permutations(String[] original) {
  List<String[]> permutations = new ArrayList();
  allPermutations(original, permutations, original.length);
  return permutations;
}

void allPermutations(String[] permutacio, List<String[]> permutacions, int n) {
  // Cas base - trobada nova permutació, afegida i return
  if (n <= 0) {
    permutacions.add(permutacio);
    return;
  }
  // Cas recursiu - cercar més permutacions fent swaps
  String[] tempP = Arrays.copyOf(permutacio, permutacio.length);
  for (int i = 0; i < n; i++) {
    swap(tempP, i, n - 1); // mou l'element de i al final
    allPermutations(tempP, permutacions, n - 1);
    swap(tempP, i, n - 1); // backtrack
  }
}

// Swapping entre caselles d'array
void swap(String[] array, int first, int second) {
  String temp = array[first];
  array[first] = array[second];
  array[second] = temp;
}
