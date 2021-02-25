
// Matrius figures

int[][] matrizI = {{0,0,1,0},
                   {0,0,1,0},
                   {0,0,1,0},
                   {0,0,1,0}};
                   
int[][] matrizS = {{0,1,1},
                   {1,1,0},
                   {0,0,0}}; 
                   
int[][] matrizT = {{0,1,0},
                   {0,1,1},
                   {0,1,0}};
                   
int[][] matrizZ = {{1,1,0},
                   {0,1,0},
                   {0,1,1}}; 

int[][] matrizO = {{1,1},
                   {1,1}};


// Copia d'una matriu
int[][] copiaMatriu(int[][] input){
  
  int[][] output = new int[input.length][input[0].length];
  for(int f=0; f<input.length; f++){
    for(int c=0; c<input[0].length; c++){
        output[f][c] = input[f][c];
    }
  }
  return output;
}
