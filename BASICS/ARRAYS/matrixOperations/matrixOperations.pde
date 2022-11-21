int[][] m1 = {{1, 3, 5},
              {2, 4, 6},
              {0, 0, 1},
              {3, 3, 5}};

int[][] m2 = {{5, 1, 2},
              {4, 2, 0},
              {1, 2, 3},
              {1, 0, 0}};
              
void setup(){
  printMatrix(m1);
}

void printMatrix(int[][] m){
  for(int f=0; f<m.length; f++){
    for(int c=0; c<m[f].length; c++){
      print(m[f][c] + ((c!=m[f].length-1)?"\t":"\n"));
    }
  }
}
