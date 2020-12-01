
class Figura {
  
  color c;
  int[][] quadres;
  
  int fila, col;
  
  Figura(int[][] quadres, color c){
    this.quadres = quadres;
    this.c = c;
  }
  
  void setPosicio(int f, int c){
    this.fila = f;
    this.col = c;
  }
  
  int getMaxCol(){
    int maxc=0;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1 && c>maxc){
          maxc = c;
        }
      }
    }
    return maxc;
  }
  
  int getMaxFil(){
    int n=0;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1){
          n = f;
        }
      }
    }
    return n;
  }
  
  int getMinCol(){
    int minc=quadres[0].length;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1 && c<minc){
          minc=c;
        }
      }
    }
    return minc;
  }
  
  int getMinFil(){
    int n=0;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1){
          return f;
        }
      }
    }
    return n;
  }
  
  boolean posicioLliure(Tauler t, int ff, int cf){
    boolean b = true;
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        if(quadres[f][c]==1 && t.cells[ff+f][cf+c]==1){
          return false;
        }
      }
    }
    return b;
  }
  
  void mouEsquerra(Tauler t){
    if(this.col + this.getMinCol() > 0){
      int newCol = this.col - 1;
      if(posicioLliure(t, this.fila, newCol)){
        this.col--;
      }
    }
  }
  
  void mouDreta(Tauler t){
    if(this.col + this.getMaxCol() < t.numCols - 1){
      this.col++;
    }
  }
  
  void mouBaix(Tauler t){
    if(this.fila + this.getMaxFil() <t.numFils - 1){
      this.fila++;
    }
  }
  
  void rota(Tauler t){
    
    int[][] q = this.copia();
    
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        quadres[f][c]=q[quadres.length - c -1][f];
      }
    }
  }
  
  
  int[][] copia(){
    
    int[][] q = new int[this.quadres.length][this.quadres[0].length];
    for(int f=0; f<quadres.length; f++){
      for(int c=0; c<quadres[0].length; c++){
        q[f][c] = quadres[f][c];
      }
    }
    return q;
  }
  

}
