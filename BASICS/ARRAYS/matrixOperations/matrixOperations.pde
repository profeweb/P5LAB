int[][] m1 = {{1, 3, 5, 7},
              {2, 4, 6, 1},
              {0, 0, 1, 0},
              {3, 3, 5, 2}};
              
int[][] id = {{1, 0, 0, 0},
              {0, 1, 0, 0},
              {0, 0, 1, 0},
              {0, 0, 0, 1}};  

int[][] m2 = {{5, 1, 2, 3},{4, 2, 0, 8},{1, 2, 3, 1},{1, 0, 0, 2}};

int[][] m3 = {{1, 2, 1, 0, 2},{0, 2, 4, 5, 1},{1, 1, 0, 2, 0},{1, 1, 0, 2, 0}};
              
void setup(){
  
  int[][] s = sumaMatrius(m1, m2);
  printMatrix(s);
  
  println();
  int[][] e = escalarMatriu(m1, 2);
  printMatrix(e);
  
  println();
  int[][]v1 = vectorialMatriu(m1, m3);
  printMatrix(v1);
 
  println();
  int[][]v2 = vectorialMatriu(m1, id);
  printMatrix(v2);
}

void printMatrix(int[][] m){
  for(int f=0; f<m.length; f++){
    for(int c=0; c<m[f].length; c++){
      print(m[f][c] + ((c!=m[f].length-1)?"\t":"\n"));
    }
  }
}

int[][] sumaMatrius(int[][] a, int[][]b){
  
  // Creació de la matriu resultant
  int[][] m = new int[a.length][a[0].length];
  
  // Suma de les caselles individuals
  for(int f=0; f<m.length; f++){
    for(int c=0; c<m[f].length; c++){
      m[f][c] = a[f][c] + b[f][c];
    }
  }
  // Retorn del resultat
  return m;
}

int[][] restaMatrius(int[][] a, int[][]b){
  
  // Creació de la matriu resultant
  int[][] m = new int[a.length][a[0].length];
  
  // Suma de les caselles individuals
  for(int f=0; f<m.length; f++){
    for(int c=0; c<m[f].length; c++){
      m[f][c] = a[f][c] - b[f][c];
    }
  }
  // Retorn del resultat
  return m;
}

int[][] escalarMatriu(int[][] a, int n){
  
  // Creació de la matriu resultant
  int[][] m = new int[a.length][a[0].length];
  
  // Suma de les caselles individuals
  for(int f=0; f<m.length; f++){
    for(int c=0; c<m[f].length; c++){
      m[f][c] = a[f][c] * n;
    }
  }
  // Retorn del resultat
  return m;
}

int[][] vectorialMatriu(int[][] a, int[][]b){
  
  // Creació de la matriu resultant
  int[][] m = new int[a.length][b.length];
  
  // Suma de les caselles individuals
  for(int f=0; f<m.length; f++){
    for(int c=0; c<m[f].length; c++){
      m[f][c] = vectorial(a, b, f, c);
    }
  }
  // Retorn del resultat
  return m;
}

int vectorial(int[][]a, int[][]b, int f, int c){
  int v = 0;
  for(int p=0; p<a[f].length; p++){
    v += a[f][p] * b[p][c];
  }
  return v;
}
