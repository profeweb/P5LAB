import java.util.*;

// Noms de les ciutats
String[] ciutats ={"A", "B", "C"};

// Llista de permutacions de les ciutats
List<String[]> perms;

void setup() { 
  
  // Genera totes les permutacions
  perms = new ArrayList();
  allPermutations(ciutats, perms, ciutats.length);
  
  // Imprimeix les permutacions
  print(perms);
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

// Imprimeix les permutacions
void print(List<String[]> perms){
  for(String[] p : perms){
    for(int i=0; i<p.length; i++){
      print(p[i]+"\t");
    }
    println();
  }
}
